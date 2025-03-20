return {
  "folke/which-key.nvim",
  dependencies = {
    { "echasnovski/mini.icons" },
  },
  opts = {
    spec = {
      {
        "<leader>:",
        desc = "which_key_ignore",
      },
      {
        "<leader>.",
        desc = "which_key_ignore",
      },
      {
        "<leader>`",
        desc = "which_key_ignore",
      },
      {
        "<leader>cg",
        icon = {
          color = "azure",
          icon = "󰟓",
        },
        group = "go",
      },
      {
        "<leader>K",
        desc = "which_key_ignore",
      },
      {
        "<leader>S",
        desc = "which_key_ignore",
      },
    },
  },
}
