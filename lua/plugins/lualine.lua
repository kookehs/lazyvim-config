return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_z = {
          { require("config.spinner") },
        },
      },
    })
  end,
}
