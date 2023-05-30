# Local Environment Setup

This is aimed to streamline the process of setting up a development environment
for a new macOS. There are many tools for the job but this set up is my
personal preference and has served me well over the years.

## Table of Contents

1. [Mac Setup](#mac-setup)
2. [Dev Setup](#dev-setup)  
  a. [Apple XCode](#1-apples-xcode)  
  b. [homebrew](#2-homebrew)  
  c. [git](#3-git)  
  d. [SSH](#4-set-up-ssh)  
  e. [Node.js](#5-nodejs)  
  f. [yarn](#6-yarn)  
  g. [chruby](#7-chruby)  
  h. [ruby](#8-ruby)    
  i. [pyenv](#9-pyenv)  
  j. [python](#10-python)  
  k. [pipenv](#11-pipenv)  
3. [`.vimrc`](/.vimrc)
4. [`.zshrc`](/.zshrc)
5. [Apps](#Apps)
6. TODO: vscode settings
7. TODO: rubymine settings

## Mac Setup

1.  **Set up Finger ID  
2.  Set up Apple ID  
      Photos sync: off  
3.  **Trackpad**  
      Natural scrolling: off  
4.  **Keyboard**  
      Key repeat rate: Fast  
      Delay until repeat: Short  
      Add Input: Korean  
      Use smart quotes and dashes: off  
      Correct spelling automatically: off  
      Capitalize words automatically: off  
      Add period with double-space: off  
      Caps Lock key: Escape  
5.  **Desktop & Dock**  
      Position on screen: left  
      Automatically hide and show the Dock: on  
6.  **Displays**  
      Automatically adjust brightness: off  
      Hot Corners: off  
7.  **Change Defaults**  

Show hidden files:

```shell
defaults write com.apple.finder AppleShowAllFiles YES
```

Show path bar:

```shell
defaults write com.apple.finder ShowPathbar -bool true
```

Show status bar:

```shell
defaults write com.apple.finder ShowStatusBar -bool true
```

Show Library folder:

```shell
chflags nohidden ~/Library
```

Enable repeating keys on press and hold (for VIM):

```shell
defaults write -g ApplePressAndHoldEnabled 0
```

Set Screenshot Location (Desktop):

```shell
defaults write com.apple.screencapture "location" -string "~/Desktop" && killall SystemUIServer
```

## Dev Setup

Download and configure the following **in order**:  

### 1. Apple's XCode  

[Apple Store - XCode](https://apps.apple.com/us/app/xcode/id497799835)

### 2. Homebrew  

Install from the command line:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Make sure everything is up to date:  

```shell
brew update
```

NOTE: On the M1 install, there may be a few errors at the end. Run the
commands to add to path, then run `brew doctor` and run the commands listed.

### 3. Git

```shell
brew install git
```

The **first thing** you should do with Git is set your **global configuration**:

```shell
touch ~/.gitconfig
```

Input your config:

```shell
[user]
  name    = Firstname Lastname
  email   = you@example.com
[github]
  user    = username
[core]
  editor = /usr/bin/vim
  excludesfile = /Users/{{MAC_USER_NAME}}/.gitignore_global
[filter "lfs"]
  process = git-lfs filter-process
  required = true
  clean = git-lfs clean -- %f
  smudge = git-lfs smudge -- %f
[init]
  defaultBranch = master
[push]
  autoSetupRemote = true
```

Set your global git ignore configuration:

```shell
touch ~/.gitignore_global
```

Input your global ignores in `~/.gitignore_global`:

```shell
 .DS_Store
 .idea/
```

### 4. Set up SSH  

1. Check if you have **SSH key**, run:

```shell
ls -al ~/.ssh
```

If you don't see `ed25519` and `ed25519.pub` (or similar), **generate one**:

```shell
ssh-keygen -t ed25519 -C "your_email@example.com"
```

2. Add your SSH key to **GitHub**

```shell
cat ~/.ssh/id_ed25519.pub
```

3. Add the key to [GitHub SSH Settings](https://github.com/settings/keys)

4. Ensure SSH agent is running

```shell
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

5. Test your SSH connection

```shell
ssh -T git@github.com
```

6. If successful it should say

```shell
"Hi <username>! You've successfully authenticated..."
```

### 5. Node.js

Do not install Node.js via homebrew.  Use `nvm` instead.  This allows you to
easily switch between Node versions, which is essential:  

[**https://github.com/nvm-sh/blob/master/README.md**](https://github.com/nvm-sh/blob/master/README.md)

After installing `nvm`, install latest Node.js version:

```shell
nvm install node
```

Restart terminal and run the final command:

```shell
nvm use node
```

Confirm that you are using the latest version of Node and npm:

```shell
node -v && npm -v
```

For later, here's how to update `nvm`:

```shell
nvm install node --reinstall-packages-from=node
```

Changing versions:

```shell
nvm install xx.xx
```

```shell
nvm use xx.xx
```

And, setting default:

```shell
nvm alias default xx.xx
```

### 6. Yarn

```shell
brew install yarn
```

### 7. Chruby

Use Homebrew to install the `ruby-install` utility and the `chruby` Ruby
version manager:

```shell
brew install ruby-install chruby
```

Verify that `ruby-install` and `chruby` are available:

```shell
ruby-install -V && chruby -v
```

Add `chruby` to `.zshrc`:  
NOTE: source path might be different for Homebrew installations. Check source
paths with command `brew info chruby` and add those to `.zshrc`

```shell
# enables chruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh

# auto-changes to .ruby-version
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# defaults to Ruby version
chruby ruby-3.1.0
```

### 8. Ruby

Install Ruby:

```shell
# check latest ruby version
ruby-install --latest

# install specific version
ruby-install #.#.#
```

### 9. Pyenv

Install `pyenv` via Homebrew:

```shell
brew install pyenv
```

### 10. Python

Install Python using `pyenv`:

```shell
pyenv install 3.11.3
```

Configure `pyenv` in `.zshrc`:

```shell
# Initialize pyenv
eval "$(pyenv init --path)"

# Set up pyenv-related environment variables
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
```

Restart Terminal or reload `.zshrc`:

```shell
source ~/.zshrc
```

Confirm Python

```shell
which Python
```

Check all Python versions installed using `pyenv`:

```shell
pyenv versions
```

Set default Python version:

```shell
pyenv global 3.11.3
```

NOTE: If a particular project needs a different Python version, install the
version first (if not installed already), navigate to the project folder, and
set that version as local to that folder. For example:

```shell
pyenv install 3.7.0
cd <path to project folder>
pyenv local 3.7.0
```

This way, a specific project will use version 3.7.0, and all other projects by
default will use the 3.11.3 version.

### 11. Pipenv

Install `pipenv` with Homebrew:

```shell
brew install pipenv
```

Navigate to the project folder and run:

```shell
pipenv shell
```

This will create virtual environment with the same name as the folder name
(plus some hash). To install Python packages from `requirements.txt` or
`Pipfile` already in the project folder:

```shell
pipenv install
```

To install additional packages:

```shell
pipenv install <package_name>
```

To get a detailed understanding of how PATH works in macOS (as well as shims)
follow this link:
[https://github.com/pyenv/pyenv](https://github.com/pyenv/pyenv)


## Apps
RubyMine
DataGrip
iTerm2
Chrome
Firefox
1Password
Rectangle
Oh-my-zsh
