set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim

" Custom settings
let mapleader="_"

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set hlsearch                      " activate search result highlighting
set wildignore+=tags,doc,tmp,log
set number
set nocompatible      " Do not be compatible with Vi - be iMproved
set laststatus=2      " Always show status bar

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.
set t_Co=256
set term=xterm-256color
set termencoding=utf-8
set encoding=utf-8

set mouse+=a
" tmux knows the extended mouse mode
set ttymouse=xterm2
" no freakin' end of line
set noeol

" stop searching at the end of the file
set nowrapscan

let g:syntastic_auto_loc_list=1
let g:syntastic_enable_balloons = 1
let g:syntastic_check_on_open=0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_ruby_mri_exec = '/Users/hsetzer/.rbenv/shims/ruby'
let g:loaded_netrw       = 0
let g:loaded_netrwPlugin = 0

call vundle#begin()
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" My bundles here:
" original repos on GitHub
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'flazz/vim-colorschemes'
Plugin 'thoughtbot/vim-rspec'
Plugin 'rizzatti/dash.vim'
Plugin 'keith/parsec.vim'
Plugin 'junegunn/fzf'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-unimpaired'
" vim-scripts repos
"Plugin 'wincent/command-t.git'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'DepthDeluxe/Todo.vim'
Plugin 'vim-ruby/vim-ruby'

call vundle#end()
filetype plugin indent on

" Custom settings 2
set guifont=Inconsolata\ for\ Powerline:h14
set encoding=utf-8
let g:solarized_termtrans=1
colorscheme solarized
set background=dark
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set listchars=nbsp:¬,extends:»,precedes:«,trail:•
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

command Pry :normal orequire 'pry-remote'; binding.remote_pry<ESC>:w<CR>
command! -nargs=1 Fu :exec ":cd " . $FUCHS_DEV . "/" . <q-args> | :NERDTree


autocmd BufWritePre * :%s/\s\+$//e
autocmd VimEnter * NERDTree
autocmd FileType ruby let &colorcolumn=80
" check if file has been changed
autocmd WinEnter * checktime
autocmd CursorHold * checktime

map <D-F> :Ack<space>

" copy paste
vnoremap Y "*y
nnoremap Y "*y

"  scroll left and right when 'nowrap':
map <C-L> zl
map <C-H> zh

syntax on

map <C-t> :FZF<CR>
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let g:fzf_launcher = "PATH_TO_THE_SCRIPT_FILE %s"

function!   QuickFixOpenAll()
  if empty(getqflist())
    return
  endif
  let s:prev_val = ""
  for d in getqflist()
    let s:curr_val = bufname(d.bufnr)
    if (s:curr_val != s:prev_val)
      exec "edit " . s:curr_val
    endif
    let s:prev_val = s:curr_val
  endfor
endfunction

command! QuickFixOpenAll         call QuickFixOpenAll()


" powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\

" Gitgutter Icons
let g:gitgutter_sign_added = '✭'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '◄'
let g:gitgutter_sign_removed_first_line = '◄'
let g:gitgutter_sign_modified_removed = '▼'

"NerdTree
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_autoclose = 1