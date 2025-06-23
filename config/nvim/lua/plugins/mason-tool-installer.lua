return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",
  opts = {
    ensure_installed = {
      "pyright",
      "tsserver",
      "html",
      "cssls",
      "clangd",
      "black",
      "prettier",
      "clang-format",
    },
    auto_update = false,
    run_on_start = true,
  },
}
