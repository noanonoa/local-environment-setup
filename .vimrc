" ************************************************************ General Settings

" Show Line Numbers
set number

" Show Relative Numbers (shows distance from cursor line, useful for jumps like 5j, 12k)
" set relativenumber

" Highlight Column After 'textwidth' (visual guide for line length)
set colorcolumn=80

" Turn Off Highlight For Misspelling (keeps spellcheck functional without
" distracting underlines — use 'fs to fix, 's to toggle visuals back on)
autocmd ColorScheme * hi clear SpellBad

" Disable Error Indicators (beep sound, flashing screen)
set vb t_vb=

" ************************************************************* Search Settings

" Ignore Case in Search
set ignorecase

" Highlight All Results
set hlsearch

" Show Search Results As Typing
set incsearch

" ******************************************************** Color Theme Settings

" Theme papercolor (light theme)
" Install: git clone https://github.com/NLKNguyen/papercolor-theme.git ~/.vim/pack/colors/start/papercolor-theme
set background=light
colorscheme PaperColor
set t_Co=256

" Theme gruvbox
" autocmd vimenter * ++nested colorscheme gruvbox
" set background=light

" Theme molokai
" colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1

syntax on

" *********************************************************** Advanced Settings

" Tab Settings
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Spellcheck (disabled by default — toggle on with 's)
" set spell spelllang=en_us

" Disable markdown error highlighting (false positives on underscores)
autocmd FileType markdown hi link markdownError Normal

" ******************************************************************** Bindings
"
" Leader key is set to single quote (')
" Quick reference:
"   'fs  — Fix spelling (accept first suggestion)
"   's   — Toggle spell check visuals on/off
"   'r   — Search and replace on current line    :s/old/new/g
"   'R   — Search and replace in entire file     :%s/old/new/g
"   'n   — Clear search highlight
"   'fj  — Format JSON (whole file in normal mode, selection in visual mode)
"
" Split navigation:
"   Ctrl+H/J/K/L — Move between splits (left/down/up/right)

" Rebind <Leader> Key (Default `\`)
let mapleader = "'"

" Fix spelling with <Leader>fs ('fs) — applies first suggestion
nnoremap <Leader>fs 1z=

" Toggle spelling visuals ('s)
nnoremap <Leader>s :set spell!

" Search and Replace on current line ('r)
" Usage: 'r then type old/new/g
nnoremap <Leader>r :s/

" Search and Replace in entire file ('R)
" Usage: 'R then type old/new/g
nnoremap <Leader>R :%s/

" Clear Search Highlight ('n)
nnoremap <Leader>n :noh

" Disable Mapping When Toggling Visual Mode
vnoremap . :norm.<CR>

" Split Screen Navigation Ctrl + Direction Key
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Pretty JSON (using Python)
" Normal mode: formats entire file
" Visual mode: formats selected lines only
nnoremap <silent> <Leader>fj :%!python -m json.tool<CR>
vnoremap <silent> <Leader>fj :'<,'>!python -m json.tool<CR>


" ******************************************************************** Filetype

" Enable filetype detection (lets vim apply language-specific settings)
filetype plugin indent on

" Reset indent settings per filetype to use the defaults above
autocmd FileType * setlocal shiftwidth< tabstop< softtabstop<

" Enable modelines (reads vim settings from comments at the top/bottom of files,
" e.g. `# vim: set ft=sh:` in a .secrets file to get shell syntax highlighting)
set modeline
set modelines=5


" *********************************************************** Enable True Color

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
