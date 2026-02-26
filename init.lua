vim.o.number = true
vim.o.relativenumber = true

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.g.mapleader = " "

vim.o.winborder = "rounded"

vim.o.linebreak = true
vim.g.nolist = true
vim.o.breakindent = true

vim.o.termguicolors = true

vim.keymap.set({ "n" }, "<leader>w", ":write<CR>")
vim.keymap.set({ "n" }, "<leader>q", ":quit<CR>")
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({"n"}, "<leader>fm", ":set foldmethod=indent<CR>")
vim.keymap.set({"n"}, "<leader>fq", ":qall!<CR>")

vim.pack.add({
   -- vim-tmux movement
   { src = 'https://github.com/christoomey/vim-tmux-navigator' },
   -- Surround
   { src = 'https://github.com/kylechui/nvim-surround' },

   -- Telescope
   { src = 'https://github.com/nvim-lua/plenary.nvim' },
   { src = 'https://github.com/nvim-telescope/telescope.nvim' },

   -- cattpuccin / nvim theme
   { src = 'https://github.com/catppuccin/nvim' },
   { src = 'https://github.com/xiyaowong/transparent.nvim'},

   --Oil
   { src = 'https://github.com/stevearc/oil.nvim' },
   { src = 'https://github.com/benomahony/oil-git.nvim' },
   { src = 'https://github.com/nvim-tree/nvim-web-devicons' },

   --LSP!!
   { src = 'https://github.com/neovim/nvim-lspconfig' },
   { src = 'https://github.com/mason-org/mason.nvim' },
   { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
   { src = 'https://github.com/nvimtools/none-ls.nvim' },
})

require('nvim-surround').setup()

require('telescope').setup({
   defaults = {
      file_ignore_patterns = {
         "node_modules",
         ".git/",
      },
   },
   pickers = {
      find_files = {
         hidden = true,
      },
   },
})

vim.keymap.set({ "n" }, "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set({ "n" }, "<leader>fg", ":Telescope live_grep<CR>")

require('oil').setup({
   view_options = {
      show_hidden = true
   },
   columns = {
      'icon',
   }
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Colorschemes and themes
 -- Optional, you don't have to run setup.
require("transparent").setup({
  -- table: default groups
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  -- table: additional groups that should be cleared
  extra_groups = {},
  -- table: groups you don't want to clear
  exclude_groups = {},
  -- function: code to be executed after highlight groups are cleared
  -- Also the user event "TransparentClear" will be triggered
  on_clear = function() end,
})

vim.cmd("colorscheme catppuccin-frappe")
vim.keymap.set({ "n" }, "<leader>lm", ":colorscheme catppuccin-latte<CR>")
vim.keymap.set({ "n" }, "<leader>dm", ":colorscheme catppuccin-frappe<CR>")



-- LSP
require("mason").setup()

vim.lsp.config['lua-language-server'] = {}

vim.lsp.enable({ 
   'lua-language-server',
   'clangd',
   'arduino-language-server',
   'jdtls',
   'pyright',
})

vim.keymap.set({ "n" }, '<leader>lf', vim.lsp.buf.format)
vim.keymap.set({ "n" }, '<leader>e', vim.diagnostic.open_float)
vim.keymap.set({ "n" }, '<leader>k', vim.lsp.buf.hover)
vim.keymap.set({ "n" }, '<leader> gD', vim.lsp.buf.definition)

-- Highlighting
require("nvim-treesitter.configs").setup {
   ensure_installed = { "c", "cpp", "lua", "markdown", "java", "python"},
   highlight = { enable = true },
}

-- Formatting
local null_ls = require("null-ls")

null_ls.setup({
   sources = {
      null_ls.builtins.formatting.black,
   },
})

-- Tmux Navigator Keymaps
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")

