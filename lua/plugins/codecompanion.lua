return {
  "olimorris/codecompanion.nvim",
  config = function()
    require("codecompanion").setup({
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            env = {
              chat_uri = "/v1/chat/completions",
              model = "gpt-oss:20b",
              models_endpoint = "/v1/models",
              url = "http://localhost:11434",
            },
            name = "gpt-oss",
            opts = {
              stream = true,
            },
            schema = {
              think = {
                default = true,
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "ollama",
        },
        cmd = {
          adapter = "ollama",
        },
        inline = {
          adapter = "ollama",
        },
      },
    })
    require("which-key").add({
      {
        mode = { "n" },
        nowait = true,
        remap = false,
        { "<leader>aA", "<cmd>CodeCompanionChat Add<cr>", desc = "CodeCompanion Add" },
        { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
        { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Toggle" },
        { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "CodeCompanion Inline" },
      },
      {
        mode = { "v" },
        nowait = true,
        remap = false,
        { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Toggle" },
        { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
