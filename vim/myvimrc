autocmd!
autocmd BufWritePre * %s/\s\+$//e
filetype plugin indent on
"
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
  if has('nvim')
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'ThePrimeagen/harpoon'
  else
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  Plug 'chemzqm/denite-extra'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-fugitive'
  Plug 'dbeniamine/cheat.sh-vim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'rafalbromirski/vim-aurora'
  Plug 'chrisbra/csv.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'mbbill/undotree'
  "
  " Color schemes
  Plug 'andreasvc/vim-256noir'
  Plug 'morhetz/gruvbox'
  Plug 'davidosomething/vim-colors-meh'
  Plug 'tomasr/molokai'
  Plug 'mhartington/oceanic-next'
  Plug 'cocopon/iceberg.vim'
  Plug 'arcticicestudio/nord-vim'
  " Initialize plugin system
call plug#end()


let g:mapleader = "\<Space>"


set nocompatible
let g:vim_tags_auto_generate = 0 " Disable tag generation on file save
set encoding=utf-8 nobomb        " Default encoding to UTF8
set synmaxcol=1200               " Syntax coloring lines that are too long just slows down the world
set nojoinspaces                 " Use only 1 space after "." when joining lines instead of 2
set nostartofline                " Don't reset cursor to start of line when moving around

set hlsearch                    " highlight the search
set ls=2                        " show a status line even if there's only one window

set wildmenu                    " show completion on the mode-line
set number relativenumber       " show hybrid number in each line
set laststatus=2                " show status line always
set linespace=0                 " number of pixels between the lines
set splitright                  " open vertical splits on the right
set splitbelow                  " open the horizontal split below
set wrap                        " wrap long lines
"set linebreak                   " break lines at word end
set nobackup                    " don't want no backup files
set nowritebackup               " don't make a backup before overwriting a file
set hidden                      " hide buffers when abandoned

" Improve vim's scrolling speed
set lazyredraw
set redrawtime=10000

" Time out on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=100

" Auto-reload buffers when files are changed on disk
set autoread

" Lines with equal indent form a fold.
set foldmethod=indent
set foldlevel=1
set foldnestmax=10

" Open all folds by default
set nofoldenable

set undofile                    " Save undo's after file closes
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo
set backupdir=~/.vim/.backup//
set noswapfile
"set directory=~/.vim/.swp//

set vb                          " disable alert sound
set showcmd                     " display incomplete commands
set showmatch                   " Show matching brackets.
set history=100                 " a ton of history

" Whitespace
set tabstop=2         " Tab is spaces
set shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set incsearch                   " incremental searching

" Searching
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set smarttab                    " sw at the start of the line, sts everywhere else
set scrolloff=0                 " keep a 5 line padding when moving the cursor
set autoindent                  " indent on enter
set smartindent                 " do smart indenting when starting a new line
set shiftround                  " indent to the closest shiftwidth
set switchbuf=""                " do not move focus/cursor to where the buffer is already open
set tagbsearch                  " use binary searching for tags
set shortmess=atI               " The 'Press ENTER or type command to continue' prompt is jarring and usually unnecessary.

" Some files to ignore
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.gif,*.jpg,*.png,*.log
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*/resources/*
set wildignore+=node_modules/*
set wildignore+=*.swp,*~,._*
set wildignore+=.DS_Store
set wildignore+=*.aux,tags,.*

"Some other adjustments
if exists("&breakindent")
  set breakindent showbreak=+++
elseif has("gui_running")
  set showbreak=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ +++
endif


" Setting theme and gui font
if exists("&guifont")
  if has("mac")
    set guifont=Sometype\ Mono:h15
  elseif has("unix")
    if &guifont == ""
      set guifont=bitstream\ vera\ sans\ mono\ 10
    endif
  elseif has("win32")
    set guifont=Consolas:h11,Courier\ New:h10
  endif
endif



if exists("+spelllang")
  set spelllang=es
endif

function! OpenURL(url)
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !sensible-browser \"".a:url."\""
  else
    exe "silent !sensible-browser -T \"".a:url."\""
  endif
  redraw!
endfunction

command! -nargs=1 OpenURL :call OpenURL(<q-args>)

" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction


" MAPPINGS
" Disable arrows in the keyboard
map <Up>   <C-W>k
map <Down> <C-W>j
map <Left> <C-W>h
map <Right> <C-W>l

"Exit from insert mode
inoremap jk <esc>

" open URL under cursor in browser
nnoremap gb :OpenURL <cfile><CR>
nnoremap gA :OpenURL http://www.answers.com/<cword><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>

" remove search highlighting
nnoremap <leader>h :noh<cr>

" Expand %% to current directory http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%')<cr>
"
"Save files using sudo privileges
cnoremap w!! %!sudo tee > /dev/null %

nnoremap <silent> <Leader>tt :call TrimWhiteSpace()<CR>


"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX
"check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more
"information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 <
    "https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    "https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
    ">
    " <
    " https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
    " >
    if (has("termguicolors"))
      set termguicolors
    endif
  else
    set undodir=~/.vim/.undo//
  endif
endif

"Setting the colorscheme
syntax on
"set t_Co=256
set background=dark " for the dark version
"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"colorscheme OceanicNext
"colorscheme nord
"colorscheme iceberg
"colorscheme molokai

"colorscheme meh
"colorscheme 256_noir
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'

if exists('$TMUX')
  " Colors in tmux
  let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif


" Denite
" based on
" https://github.com/sodiumjoe/dotfiles/blob/master/vimrc#L179
"
autocmd FileType denite call s:denite_settings()


function! s:denite_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
endfunction

autocmd FileType denite-filter call s:denite_filter_settings()

function! s:denite_filter_settings() abort
  nmap <silent><buffer> <Esc> <Plug>(denite_filter_quit)
endfunction

nnoremap <C-p> :<C-u>Denite file/rec -start-filter<CR>
nnoremap <C-b> :<C-u>Denite file/rec buffer -start-filter<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:.<CR>
nnoremap <leader>/ :<C-u>Denite grep:.<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:.<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file/rec -start-filter<CR>
nnoremap <leader>r :<C-u>Denite -resume -cursor-pos=+1<CR>
nnoremap <leader><C-r> :<C-u>Denite register:.<CR>
nnoremap <leader>g :<C-u>Denite gitstatus<CR>

hi link deniteMatchedChar Special

if exists('denite#custom#map')
  call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
  if has('gui_running')
    call denite#custom#option('default', {'prompt': '❯'})
    call denite#custom#var('file/rec', 'command', ['fd', '-H', '--full-path'])
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--smart-case'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
  endif
endif


"Status line
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=[%n]%f\                          " file name
set statusline+=%=                           " right align
set statusline+=%<\ %{fugitive#statusline()}%m

"hi statusline guibg=gray54 ctermfg=8 guifg=black ctermbg=15

"PLUGGIN CONFIGURATION

""FUGITIVE
nmap <leader>gj :diffget \\3<CR>
nmap <leader>gf :diffget \\2<CR>
nmap <leader>gs :G<CR>

"" DEVELOPMENT
nnoremap <leader>ds :cd ~/Development/sisne<CR>:e.<CR>:pwd<CR>
nnoremap <leader>di :cd ~/Development/intranet_gna/<CR>:e.<CR>:pwd<CR>
nnoremap <leader>dco :cd ~/Development/intranet_gna/apps/core/<CR>:e.<CR>:pwd<CR>
nnoremap <leader>dcl :cd ~/Development/intranet_gna/apps/clinical/<CR>:e.<CR>:pwd<CR>
nnoremap <leader>df :cd ~/Development/intranet_gna/apps/financial/<CR>:e.<CR>:pwd<CR>
nnoremap <leader>da :cd ~/Development/intranet_gna/apps/admin/<CR>:e.<CR>:pwd<CR>
nnoremap <leader>dh :cd ~/Development/intranet_gna/apps/hrm/<CR>:e.<CR>:pwd<CR>

"" DEVELOPMENT
nnoremap <leader>em :Emodel<SPACE>
nnoremap <leader>ev :Eview<SPACE>
nnoremap <leader>ec :Econtroller<SPACE>


""For spell checking
nmap <silent> <leader>scs :set spell! spelllang=es<CR>
nmap <silent> <leader>sce :set spell! spelllang=en_us<CR>
nmap <silent> <leader>nsc :set nospell<CR>

""For change cursor shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


let g:netrw_list_hide = '.*\.swp$,^\.,^tags$'
let g:netrw_liststyle=0
"
set cursorline
highlight CursorLineNR guibg=NONE guifg=GRAY ctermbg=NONE ctermfg=NONE gui=NONE cterm=NONE
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=NONE guifg=NONE
au FileType netrw hi CursorLine guibg=gray20 ctermbg=59
au FileType netrw au BufEnter <buffer> hi CursorLine guibg=gray20 ctermbg=59
au FileType netrw au BufLeave <buffer> hi CursorLineNR guibg=NONE
au FileType netrw au BufLeave <buffer> hi CursorLine guifg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE


"" TASKS
nnoremap <silent> <F2> :s/^\s*\(-<space>\\|\*<space>\)\?\zs\(\[[^\]]*\]<space>\)\?\ze./[<space>]<space>/<CR>0t]
nnoremap <silent> <F3> :s/^\s*\(-<space>\\|\*<space>\)\?\zs\(\[[^\]]*\]<space>\)\?\ze./[x]<space>/<CR>0t]
vnoremap <silent> <F2> :s/^\s*\(-<space>\\|\*<space>\)\?\zs\(\[[^\]]*\]<space>\)\?\ze./[<space>]<space>/<CR>0t]
vnoremap <silent> <F3> :s/^\s*\(-<space>\\|\*<space>\)\?\zs\(\[[^\]]*\]<space>\)\?\ze./[x]<space>/<CR>0t]
nnoremap <leader>b  :e ~/Development/bullet_task.txt<CR>
""thers maps
nnoremap <silent> <F4> :lchdir %:p:h<CR>:pwd<CR>

let g:deoplete#enable_at_startup = 1

"let g:vimade = {"fadelevel": 0.9}
"
""Create Mappings to Quickly Traverse Vim's Lists,
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>


"working with system clipboard easier
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nnoremap <silent> <C-f> :silent !~/.local/bin/tmux-windowizer %<CR>
