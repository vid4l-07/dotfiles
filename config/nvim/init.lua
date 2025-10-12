------------------------------------------------------------
-- Opciones generales
------------------------------------------------------------
vim.opt.clipboard = "unnamedplus"
vim.opt.shell = "/bin/zsh"
vim.cmd("syntax on")
vim.opt.tabstop = 4
vim.cmd("filetype on")
vim.opt.ruler = true
vim.opt.mouse = "a"
vim.opt.list = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.encoding = "UTF-8"
vim.cmd("filetype plugin indent on")
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.foldcolumn = "2"

------------------------------------------------------------
-- Airline (barra superior e inferior)
------------------------------------------------------------
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#left_sep"] = " "
vim.g["airline#extensions#tabline#left_alt_sep"] = "|"
vim.g["airline#extensions#whitespace#enabled"] = 0
vim.g["airline#extensions#tabline#buffers_label"] = "" -- quita la palabra buffers
vim.g.airline_section_c = "" -- quitar nombre del archivo
vim.g.airline_section_y = "" -- quitar encoding
vim.g.airline_section_z = "" -- quitar lineas/columnas

------------------------------------------------------------
-- Tema y colores
------------------------------------------------------------
vim.opt.termguicolors = true
-- Fondo transparente
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

vim.g.indentLine_char = "⏽ "
vim.g.molokai_original = 1

-- vim.cmd("colorscheme nord")
-- vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme onedark")

-- vim.g.airline_theme = 'nord'
-- vim.g.airline_theme = 'base16_atelier_cave'

-- Tema (se cambia desde changetheme)
vim.cmd("source $HOME/.config/nvim/theme.vim")

-- Colores coc.nvim
vim.cmd([[
	hi! link CocMenuSel Search
	hi! link CocFloating Normal
	"hi! link CocSearch Normal
	hi! link CocSearch NonText
	hi EndOfBuffer guifg=bg guibg=bg
	hi LineNr guibg=bg
	hi foldcolumn guibg=bg
	hi VertSplit guibg=#302d38 guifg=#302d38
]])

------------------------------------------------------------
-- Funciones
------------------------------------------------------------
-- Ejecutar archivo actual según su extensión
function _G.RunFile()
  vim.cmd("w")
  local file = vim.fn.expand("%:p")
  local ext = vim.fn.expand("%:e")
  local cmd = nil

  if ext == "py" then
    cmd = "python3 " .. file
  elseif ext == "c" then
    cmd = "gcc " .. file .. " -o /tmp/a.out && /tmp/a.out"
  elseif ext == "cpp" then
    cmd = "g++ " .. file .. " -o /tmp/a.out && /tmp/a.out"
  elseif ext == "js" then
    cmd = "node " .. file
  elseif ext == "sh" then
    cmd = "bash " .. file
  elseif ext == "lua" then
    cmd = "lua " .. file
  else
    print("Tipo de archivo no soportado: " .. ext)
    return
  end

  vim.cmd("botright split | term " .. cmd)
end

vim.api.nvim_create_user_command("RunFile", RunFile, {})

-- Alternar Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_enabled = 1 -- empieza habilitado
function _G.CopilotToggle()
  if vim.g.copilot_enabled == 1 then
    vim.cmd("Copilot disable")
    vim.g.copilot_enabled = 0
    print("Copilot desactivado")
  else
    vim.cmd("Copilot enable")
    vim.g.copilot_enabled = 1
    print("Copilot activado")
  end
end

------------------------------------------------------------
-- Keymaps
------------------------------------------------------------
vim.g.mapleader = " " -- espacio tecla líder
local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Cerrar sin guardar
map("n", "<leader>q", ":q!<CR>", opts)
-- Guardar
map("n", "<leader>w", ":silent w<CR>", opts)

-- Scroll
map("n", "<C-k>", "3<C-y>", opts)
map("n", "<C-j>", "3<C-e>", opts)

-- Enviar cursor al centro
map("n", "<leader>z", ":call cursor(line('w0') + (winheight(0)/2), col('.'))<CR>", { silent = true })

-- Mover líneas
map("n", "<A-j>", ":m .+1<CR>==", { silent = true })
map("n", "<A-k>", ":m .-2<CR>==", { silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })

-- NERDTree
map("n", "<leader>t", ":NERDTreeToggle<CR>", opts)
map("n", "<C-t>", ":NERDTreeFocus<CR>", opts)

-- Cambiar buffer
map("n", "<leader>n", ":bnext<CR>", opts)
map("n", "<leader>p", ":bprevious<CR>", opts)

-- Ejecutar archivo actual
map("n", "<leader>r", ":RunFile<CR>", opts)

-- Copilot
map("n", "<leader>i", ":lua CopilotToggle()<CR>", opts)

	-- Aceptar sugerencia con Ctrl+i si no hay menú visible
vim.api.nvim_set_keymap(
  "i",
  "<C-i>",
  'pumvisible() ? "\\<C-e>\\<C-i>" : copilot#Accept("\\<CR>")',
  { expr = true, silent = true }
)

-- coc.nvim (autocompletado)
vim.api.nvim_set_keymap("i", "<TAB>", 'pumvisible() ? "\\<C-n>" : "\\<TAB>"', { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-TAB>", 'pumvisible() ? "\\<C-p>" : "\\<S-TAB>"', { expr = true, silent = true })
vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", opts)
vim.api.nvim_set_keymap("i", "<Down>", 'pumvisible() ? "<Nop>" : "\\<Down>"', { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<Up>", 'pumvisible() ? "<Nop>" : "\\<Up>"', { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<CR>", 'pumvisible() ? coc#_select_confirm() : "\\<CR>"', { expr = true, silent = true })

	-- Diagnósticos rápidos
vim.api.nvim_set_keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", {})
vim.api.nvim_set_keymap("n", "]g", "<Plug>(coc-diagnostic-next)", {})

------------------------------------------------------------
-- NERDTree
------------------------------------------------------------
-- autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.winnr("$") == 1 and vim.b.NERDTree and vim.b.NERDTree.isTabTree then
      vim.cmd("quit")
    end
  end,
})
------------------------------------------------------------
--- Plugins
------------------------------------------------------------
-- Instalar con :Lazy sync, se ve con :Lazy
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configurar plugins
require("lazy").setup({
  -- NERDTree
  { "preservim/nerdtree" },

  -- Themes
  { "mhartington/oceanic-next" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "nordtheme/vim" },
  { "rebelot/kanagawa.nvim" },

  -- Airline
  { "vim-airline/vim-airline" },
  { "vim-airline/vim-airline-themes" },

  -- Syntax y completado
  { "neoclide/coc.nvim", branch = "release" },-- menu autocompletado | :CocInstall coc-json coc-tsserver coc-pyright coc-html coc-css coc-sh coc-yaml coc-go coc-rust-analyzer coc-java | aqui se instala soporte para lenguajes, buscar mas o instalar lo necesario

  { "jiangmiao/auto-pairs" },
  { "alvan/vim-closetag" },
  { "ap/vim-css-color" },

  -- IA
  { "github/copilot.vim" }, -- :Copilot setup
})
