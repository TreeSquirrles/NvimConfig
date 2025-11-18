vim.o.number = true
vim.o.relativenumber = true

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 3
vim.o.tabstop = 3

vim.g.mapleader = " "

vim.o.winborder = "rounded"


vim.keymap.set({ "n" }, "<leader>w", ":write<CR>")
vim.keymap.set({ "n" }, "<leader>q", ":quit<CR>")
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')


vim.pack.add({
   -- Surround
   { src = 'https://github.com/kylechui/nvim-surround' },

   -- Telescope
   { src = 'https://github.com/nvim-lua/plenary.nvim' },
   { src = 'https://github.com/nvim-telescope/telescope.nvim' },

   -- cattpuccin
   { src = 'https://github.com/catppuccin/nvim' },

   --Oil
   { src = 'https://github.com/stevearc/oil.nvim' },
   { src = 'https://github.com/benomahony/oil-git.nvim' },
   { src = 'https://github.com/nvim-tree/nvim-web-devicons' },

   --LSP!!
   { src = 'https://github.com/neovim/nvim-lspconfig' },
   { src = 'https://github.com/mason-org/mason.nvim' },
   { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },

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

vim.keymap.set({ "n" }, "<leader><leader>", ":Telescope find_files<CR>")
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

-- Colorschemes
vim.cmd("colorscheme catppuccin-frappe")
vim.keymap.set({ "n" }, "<leader>lm", ":colorscheme catppuccin-latte<CR>")
vim.keymap.set({ "n" }, "<leader>dm", ":colorscheme catppuccin-frappe<CR>")

require("mason").setup()
vim.lsp.config['clangd'] = {
   filetypes = { "c", "cpp", "objc", "objcpp" },
}

vim.lsp.config['arduino-language-server'] = {
   cmd = {
      "arduino-language-server",
   },
   filetypes = { "ino" },
}

vim.lsp.config['lua-language-server'] = {
   cmd = {
      'lua-language-server',
   },
   filetypes = { 'lua' },
}

vim.lsp.enable({ 'lua-language-server',
   'clangd',
   'arduino-language-server',
   'jdtls',
   'pyright',
})

vim.keymap.set({ "n" }, '<leader>lf', vim.lsp.buf.format)
vim.keymap.set({ "n" }, '<leader>e', vim.diagnostic.open_float)
vim.keymap.set({ "n" }, '<leader>k', vim.lsp.buf.hover)

require("nvim-treesitter.configs").setup {
   ensure_installed = { "c", "cpp", "lua", "markdown", "java", "python"},
   highlight = { enable = true },
}
