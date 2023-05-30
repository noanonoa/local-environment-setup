# Local Environment Setup

This is aimed to streamline the process of setting up a development environment
for a new macOS. There are many tools for the job but this set up is my
personal preference and has served me well over the years.

## Table of Contents

1. [Mac Setup](#mac-setup)
2. [Dev Setup](#dev-setup)
    - [iTerm2](#1-iterm2)
    - [Homebrew](#2-homebrew)
    - [Oh My Zsh](#3-oh-my-zsh)
    - [Powerlevel10k](#4-powerlevel10k)
    - [`.zshrc`](#5-zshrc)
    - [`.secrets`](#6-secrets)
    - [Claude Code](#7-claude-code)
    - [Apple XCode](#8-apples-xcode)
    - [Git](#9-git)
    - [SSH](#10-set-up-ssh)
    - [mise](#11-mise)
    - [Yarn](#12-yarn)
    - [Poetry](#13-poetry)
3. [`.vimrc`](#vimrc)
4. [Apps](#apps)
    - [Browsers](#browsers)
    - [VS Code](#vs-code)
    - [JetBrains Toolbox](#jetbrains-toolbox)
    - [1Password](#1password)
    - [Rectangle](#rectangle)
    - [Alfred](#alfred)

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

### 1. iTerm2

[iTerm2](https://iterm2.com/index.html)

Download and install from the website.

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

### 3. Oh My Zsh

[Oh My Zsh](https://ohmyz.sh)

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

NOTE: This will overwrite your existing `.zshrc`. If you already have a
configured `.zshrc`, back it up first and restore your customizations after
installing.

### 4. Powerlevel10k

Install via Homebrew:

```shell
brew install powerlevel10k
```

Run the configuration wizard:

```shell
p10k configure
```

This will walk you through setting up your prompt style and save the config
to `~/.p10k.zsh`. Powerlevel10k is already sourced in `.zshrc`.

### 5. `.zshrc`

This repo includes a configured `.zshrc` with aliases, PATH settings, and tool
activation (mise, Powerlevel10k, Claude Code). Copy it to your home directory:

```shell
cp .zshrc ~/.zshrc
```

NOTE: If you already have a `.zshrc` you want to keep, review the differences
and merge manually instead.

Reload your shell:

```shell
source ~/.zshrc
```

The `.zshrc` sources a separate `~/.secrets` file for sensitive values. See
the next step to set that up.

### 6. `.secrets`

`.zshrc` handles shell configuration (aliases, PATH, tool activation).
`.secrets` handles sensitive values (API tokens, credentials) that should
never be checked into version control.

If you already have a `.secrets` file, keep it. If not, create one:

```shell
touch ~/.secrets
chmod 600 ~/.secrets
```

Boilerplate for `~/.secrets`:

```shell
# API tokens
# export SOME_API_TOKEN=""

# Cloud credentials
# export AWS_ACCESS_KEY_ID=""
# export AWS_SECRET_ACCESS_KEY=""
```

`.secrets` is already in `.gitignore_global` and sourced by `.zshrc`.

### 7. Claude Code

[Claude Code Documentation](https://code.claude.com/docs/en/overview)

Install from the command line:

```shell
curl -fsSL https://claude.ai/install.sh | bash
```

This installs to `~/.local/bin`. Make sure it's in your PATH (already
included in `.zshrc`).

### 8. Apple's XCode

[Apple Store - XCode](https://apps.apple.com/us/app/xcode/id497799835)

### 9. Git

```shell
brew install git
```

The **first thing** you should do with Git is set your **global configuration**.

Keep PII (name, email, signing keys) out of `.gitconfig` by using a separate
`.gitconfig.private` file. This way `.gitconfig` is safe to check into version
control and `.gitconfig.private` stays local (already in `.gitignore_global`).

```shell
touch ~/.gitconfig
```

Input your config in `~/.gitconfig`:

```shell
[include]
  # Load private config (name, email, signing keys, etc.)
  path = ~/.gitconfig.private
[core]
  editor = /usr/bin/vim
  excludesfile = ~/.gitignore_global
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

Create your private config:

```shell
touch ~/.gitconfig.private
```

Input your personal details in `~/.gitconfig.private`:

```shell
[user]
  name    = Firstname Lastname
  email   = you@example.com

# vim: set ft=gitconfig:
```

Set your global git ignore configuration:

```shell
touch ~/.gitignore_global
```

Input your global ignores in `~/.gitignore_global`:

```shell
  .DS_Store
  .idea/
  .secrets
  .gitconfig.private
```

### 10. Set up SSH

1. Check if you have **SSH key**, run:

```shell
ls -al ~/.ssh
```

If you don't see `ed25519` and `ed25519.pub` (or similar), **generate one**:

```shell
ssh-keygen -t ed25519 -C "your_email@example.com (or computer name)"
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

### 11. mise

[mise Documentation](https://mise.jdx.dev)

mise is a runtime version manager that replaces nvm (Node), chruby/rbenv
(Ruby), pyenv (Python), and asdf. It lets you install and switch between
versions per-project using `.mise.toml` or `.tool-versions` files.

Install via Homebrew:

```shell
brew install mise
```

Activation is already included in `.zshrc`. Verify it's working:

```shell
mise --version
```

**Node.js:**

```shell
mise use --global node@latest
```

NOTE: npm is included with Node.js and will be available automatically.

```shell
node -v && npm -v
```

**Ruby:**

```shell
mise use --global ruby@latest
```

```shell
ruby -v
```

**Python:**

```shell
mise use --global python@latest
```

NOTE: pip is included with Python and will be available automatically.

```shell
python --version && pip --version
```

**Java:**

```shell
mise use --global java@latest
```

```shell
java --version
```

**Per-project versions:**

If a project needs a specific runtime version, navigate to the project folder
and set it locally. For example:

```shell
cd <path to project folder>
mise use node@20
```

This creates a `.mise.toml` in that directory. mise will automatically switch
to that version when you `cd` into the project.

NOTE: mise manages **runtimes only**. Package and dependency managers like Yarn
and Poetry are installed separately via Homebrew.

### 12. Yarn

```shell
brew install yarn
```

### 13. Poetry

[Poetry Documentation](https://python-poetry.org)

Poetry is a Python dependency and virtual environment manager (similar to
Bundler for Ruby or Yarn for JavaScript).

```shell
brew install poetry
```

```shell
poetry --version
```


## `.vimrc`

Optional. This repo includes a [`.vimrc`](/.vimrc) with personal settings for
VIM (PaperColor theme, custom keybindings, tab/indent preferences). Copy it to
your home directory if you use VIM:

```shell
cp .vimrc ~/.vimrc
```

NOTE: Requires the PaperColor theme. Install it first:

```shell
git clone https://github.com/NLKNguyen/papercolor-theme.git ~/.vim/pack/colors/start/papercolor-theme
```

This `.vimrc` enables modelines, which lets vim read settings from comments at
the top or bottom of files. For example, the `.secrets` and `.gitconfig.private`
boilerplates in this repo include modelines like `# vim: set ft=sh:` so vim
applies the correct syntax highlighting automatically.

## Apps

### Browsers

[Google Chrome](https://www.google.com/chrome/) |
[Mozilla Firefox](https://www.mozilla.org/en-US/firefox/)

Download and install both from their websites.

### VS Code

[Visual Studio Code](https://code.visualstudio.com/)

Code editor.

### JetBrains Toolbox

[JetBrains Toolbox](https://www.jetbrains.com/toolbox-app/)

Manages JetBrains IDEs (RubyMine, DataGrip, IntelliJ, Rider, etc.). Install
Toolbox first, then install individual IDEs from within it.

### 1Password

[1Password](https://1password.com/)

Password manager.

### Rectangle

[Rectangle](https://rectangleapp.com/)

Window management. After installing, import the config from this repo:

Rectangle → Preferences → Import → select `RectangleConfig.json`

### Alfred

[Alfred](https://www.alfredapp.com/)

Launcher and productivity tool.
