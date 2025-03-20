return {
  "mfussenegger/nvim-dap",
  keys = {
    {
      "<A-b>",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle breakpoint",
    },
    {
      "<A-c>",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    {
      "<A-d>",
      function()
        require("dap").disconnect({ terminateDebuggee = true })
      end,
      desc = "Disconnect",
    },
    {
      "<A-i>",
      function()
        require("dap").step_into()
      end,
      desc = "Step into",
    },
    {
      "<A-o>",
      function()
        require("dap").step_out()
      end,
      desc = "Step out",
    },
    {
      "<A-s>",
      function()
        require("dap").step_over()
      end,
      desc = "Step over",
    },
  },
}
