return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      lsp_inlay_hints = {
        enable = false,
      },
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
  keys = {
    { "<leader>cga", "<cmd>GoAddTag<cr>", desc = "Add JSON tags", ft = { "go" } },
    { "<leader>cgh", "<cmd>GoDoc<cr>", desc = "Show docs", ft = { "go" } },
    { "<leader>cgf", "<cmd>GoFillStruct<cr>", desc = "Fill struct with zero values", ft = { "go" } },
    { "<leader>cgt", "<cmd>GoTestFunc<cr>", desc = "Test current function", ft = { "go" } },
  },
}
