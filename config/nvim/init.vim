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
  Plug 'rebelot/kanagawa.nvim'
  "Syntax
  Plug 'neoclide/coc.nvim', {'branch': 'release'} "menu autocompletado | :CocInstall coc-json coc-tsserver coc-pyright coc-html coc-css coc-sh coc-yaml coc-go coc-rust-analyzer coc-java | aqui se instala soporte para lenguajes, buscar mas o instalar lo necesario
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  "colors
  Plug 'ap/vim-css-color'
  "IA
  Plug 'github/copilot.vim'  ":Copilot setup
  call plug#end()


		"Bar

"barra de arriba
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#buffers_label = '' "quita la palabra buffers de la barra de arriba
"barra de abajo
"au User AirlineAfterInit  :let g:airline_section_z = airline#section#create(['%3p%%', '|', 'linenr', '|', 'col:%3v'])
let g:airline_section_c = ''	"quitar nombre del archivo
let g:airline_section_y = ''	"quitar encoding
let g:airline_section_z = ''	"quitar lineas/columnas y eso


		"NERDTree

"autocmd  VimEnter * NERDTree | wincmd  p  "ejecutar NERDTree al iniciar

" Close the tab if NERDTree is the only window remaining in it.

autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


		"Atajos de teclas"

let mapleader=" " " espacio tecla lider

nnoremap <leader>q :q!<CR>	" cerrar archivo sin guardar
nnoremap <silent> <leader>w :silent w<CR>	" guardar

nnoremap <C-k> 3<C-y>	" Scroll 3 líneas arriba
nnoremap <C-j> 3<C-e>	" Scroll 3 líneas abajo

nnoremap <silent><leader>z :call cursor(line('w0') + (winheight(0)/2), col('.'))<CR>	" enviar cursor al centro de la pantalla

nnoremap <silent> <A-j> :m .+1<CR>==		" mover linea para arriba
nnoremap <silent> <A-k> :m .-2<CR>==		" mover linea para abajo
vnoremap <A-j> :m '>+1<CR>gv=gv		" Mover bloque seleccionado hacia abajo
vnoremap <A-k> :m '<-2<CR>gv=gv		" Mover bloque seleccionado hacia arriba

"nnoremap j jzz		" mantener cusror centrado en la pantalla
"nnoremap k kzz

"NerdTree
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <C-t> :NERDTreeFocus<CR>

"change file
nnoremap <silent><leader>n :bnext<CR>
nnoremap <silent><leader>p :bprevious<CR>

"IA
imap <silent><script><expr> <Tab> copilot#Accept("\<Tab>") "desactivar tab para copilot
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-i> copilot#Accept("\<CR>") "aceptar sugerencia con ctrl+i

"funcion para activar y desactivar copilot
let g:copilot_enabled = 1 " empieza habilitado

function! CopilotToggle()
  if g:copilot_enabled
    Copilot disable
    let g:copilot_enabled = 0
    echo "Copilot desactivado"
  else
    Copilot enable
    let g:copilot_enabled = 1
    echo "Copilot activado"
  endif
endfunction

nnoremap <leader>i :call CopilotToggle()<CR>

"coc

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"	" Usar <Tab> para navegar el menú de completado
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"	" Shift-Tab -> sugerencia anterior
nnoremap <silent> K :call CocActionAsync('doHover')<CR>		" Mostrar documentación al pasar el cursor
inoremap <silent><expr> <Down> pumvisible() ? "<Nop>" : "\<Down>"	" --- desactivar navegación con flechas ---
inoremap <silent><expr> <Up>   pumvisible() ? "<Nop>" : "\<Up>"

inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

" Diagnósticos rápidos
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


		"theme

hi Normal guibg=NONE ctermbg=NONE
"source $HOME/.vimrc

source $HOME/.config/nvim/theme.vim  "archivo con el tema / se cambia desde changetheme

"let g:indentLine_color_gui = '#fff'
let g:indentLine_char = '⏽ '
let g:molokai_original = 1
"colorscheme nord
"colorscheme kanagawa
"colorscheme atelier_cave
"colorscheme onedark
set termguicolors

"let g:airline_theme = 'nord'
"let g:airline_theme = 'base16_atelier_cave'

set noshowmode

" Colores coc

hi! link CocMenuSel Search
hi! link CocFloating Normal
"hi! link CocSearch Normal
hi! link CocSearch NonText

hi EndOfBuffer guifg=bg guibg=bg
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg
hi VertSplit guibg=#302d38 guifg=#302d38
"autocmd vimenter * hi Normal guibg=255 ctermbg=NONE "transparent bg

