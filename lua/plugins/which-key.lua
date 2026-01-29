return {
  "folke/which-key.nvim",
  dependencies = {
    { "nvim-mini/mini.icons" },
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
        "<leader>l",
        icon = {
          icon = "󰧑",
        },
        group = "ai",
        mode = "v",
      },
      {
        "<leader>ll",
        icon = {
          icon = "󰳆",
        },
        group = "llama",
        mode = "v",
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
