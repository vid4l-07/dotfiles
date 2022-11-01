set termguicolors
hi Normal guibg=NONE ctermbg=NONE
source $HOME/.vimrc

nnoremap ,<space> :CHADopen<CR>
nnoremap <space>x :wq!<CR>

let g:indentLine_color_gui = '#fff'
let g:indentLine_char = '⏽ '
let g:molokai_original = 1
colorscheme OceanicNext

set noshowmode

hi EndOfBuffer guifg=bg guibg=bg
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg
hi VertSplit guibg=#302d38 guifg=#302d38
"autocmd vimenter * hi Normal guibg=255 ctermbg=NONE " transparent bg
syntax on
