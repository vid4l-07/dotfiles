source $HOME/.vim/autoload/plug.vim

set shell=/bin/zsh
syntax on
set tabstop=4
filetype on
set ruler
set mouse=a
set list
set nu rnu
set encoding=UTF-8

filetype plugin indent on

"Plugins"

call plug#begin()
  "Nav tree
  Plug 'preservim/nerdtree'
  "Themes
  Plug 'mhartington/oceanic-next'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  "Syntax
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
call plug#end()

"Bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
au User AirlineAfterInit  :let g:airline_section_z = airline#section#create(['%3p%%', '|', 'linenr', '|', 'col:%3v'])
map <C-right> :bnext<CR>
map <C-left> :bprevious<CR>

"autocmd  VimEnter * NERDTree | wincmd  p  "ejecutar NERDTree al iniciar

" Close the tab if NERDTree is the only window remaining in it.

autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"Atajos de teclas"

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR> "Abre y cierra nord tree"
nnoremap <C-f> :NERDTreeFind<CR> "Te muestra la ubicacion del archivo actual"

