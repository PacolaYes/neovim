return {
  {
    "L3MON4D3/LuaSnip",

    lazy = true,

    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
  require("luasnip.loaders.from_vscode").lazy_load()
      end
    },
    version = "v2.*",
    build = "make install_jsregexp"
  },

  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      "saadparwaiz1/cmp_luasnip",

      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",

      "roginfarrer/cmp-css-variables",
      "nat-418/cmp-color-names.nvim",
      { url = "https://codeberg.org/FelipeLema/cmp-async-path.git" }
    },

    opts = function()
      local cmp = require("cmp")

      return {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true })
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" }
  }, {
    { name = "buffer" },
    { name = "async_path" }
  }, {
    { name = "css-variables" },
    { name = "color_names" }
  })
      }
    end,

    event = "InsertEnter",

    keys = {
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    }
  }
}
