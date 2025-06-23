return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    servers = {
      pyright = {},
      tsserver = {},
      html = {},
      cssls = {},
      clangd = {},
    },
  },
}
