return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()

    -- Run gofmt + goimports on save
    local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require("go.format").goimports()
      end,
      group = format_sync_grp,
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
  keys = {
    { "<leader>G", group = "Go" },
    { "<leader>Gatj", "<cmd>GoAddTag<cr>", desc = "Add JSON tags" },
    { "<leader>Gd", "<cmd>GoDoc<cr>", desc = "Show docs" },
    { "<leader>Gdf", "<cmd>GoDebug -n<cr>", desc = "Debug current function" },
    { "<leader>Gfs", "<cmd>GoFillStruct<cr>", desc = "Fill struct with zero values" },
    { "<leader>Gtf", "<cmd>GoTestFunc<cr>", desc = "Test current function" },
  },
}
