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
        "<leader>a",
        icon = {
          icon = "󰧑",
        },
        group = "ai",
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
