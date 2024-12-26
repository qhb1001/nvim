-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- LSP related set-up
require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")
lspconfig.clangd.setup({
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
  init_options = {
    fallbackFlags = { '-std=c++17' },
  },
})

