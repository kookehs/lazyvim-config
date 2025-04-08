return {
  "MagicDuck/grug-far.nvim",
  keys = {
    {
      "<leader>sf",
      function()
        local grug = require("grug-far")
        local buffer = vim.fn.expand("%")
        grug.open({
          transient = true,
          prefills = {
            paths = buffer,
          },
        })
      end,
      desc = "Search and Replace (file)",
      mode = { "n", "v" },
    },
  },
}
