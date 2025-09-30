source $HOME/.config/nvim/plug.vim

set clipboard=unnamedplus

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
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
  Plug 'nordtheme/vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  "Syntax
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  "colors
  Plug 'ap/vim-css-color'
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
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR> 
nnoremap <C-c> :q!<CR>

"coc

" Usar <Tab> para navegar el menú de completado
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Shift-Tab -> sugerencia anterior
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Mostrar documentación al pasar el cursor
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
" --- desactivar navegación con flechas ---
inoremap <silent><expr> <Down> pumvisible() ? "<Nop>" : "\<Down>"
inoremap <silent><expr> <Up>   pumvisible() ? "<Nop>" : "\<Up>"

inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

" Diagnósticos rápidos
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"theme

hi Normal guibg=NONE ctermbg=NONE
"source $HOME/.vimrc

nnoremap ,<space> :CHADopen<CR>


let g:indentLine_color_gui = '#fff'
let g:indentLine_char = '⏽ '
let g:molokai_original = 1
"colorscheme OceanicNext
colorscheme nord
set termguicolors

let g:airline_theme = 'nord'

set noshowmode


" Colores coc

hi! link CocMenuSel Search
hi! link CocFloating Normal

hi EndOfBuffer guifg=bg guibg=bg
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg
hi VertSplit guibg=#302d38 guifg=#302d38
autocmd vimenter * hi Normal guibg=255 ctermbg=NONE "transparent bg

