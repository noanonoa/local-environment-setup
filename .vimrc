" **** General Settings

" Show Line Numbers
set number

" Show Relative Numbers
set relativenumber

" Highlight Column After 'textwidth'
set colorcolumn=80

" Disable Error Indicators (beep sound, flashing screen)
set vb t_vb=

" **** Search Settings

" Ignore Case in Search
set ignorecase

" Highlight All Results
set hlsearch

" Show Search Results As Typing
set incsearch

" **** Color Theme Settings

" Theme papercolor
" git clone https://github.com/NLKNguyen/papercolor-theme.git ~/.vim/pack/colors/start/papercolor-theme
colorscheme PaperColor
set background=light
" set t_Co=256

" Theme gruvbox
" autocmd vimenter * ++nested colorscheme gruvbox
" set background=light

" Theme molokai
" colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1

" **** Advanced Settings

" Tab Settings
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

" Spellcheck
set spell spelllang=en_us

" **** Bindings

" Rebind <Leader> Key (Default `\`)
let mapleader = "'"

" Fix spelling with <leader>f shortcut ('f)
nnoremap <leader>f 1z=

" Toggle spelling visuals ('s)
nnoremap <leader>s :set spell!

" Global Search and Replace Line ('r)
nnoremap <leader>r :s/

" Global Search and Replace Global ('r)
nnoremap <leader>R :%s/

" Clear Search Highlight ('n)
nnoremap <leader>n :noh

" Disable Mapping When Toggling Visual Mode
vnoremap . :norm.<CR>

" Split Screen Navigation Ctrl + Direction Key
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" **** Running vi Within irb

if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif


" **** Enable True Color

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

