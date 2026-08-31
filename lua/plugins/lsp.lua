return {
  { "neovim/nvim-lspconfig" },
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "ray-x/lsp_signature.nvim",
    lazy = true,
    event = "InsertEnter",
    opts = {
      toggle_key = "<C-s>"
    }
  }
}
