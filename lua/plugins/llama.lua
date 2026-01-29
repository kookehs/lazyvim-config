return {
  "ggml-org/llama.vim",
  init = function()
    vim.g.llama_config = {
      endpoint_fim = "http://127.0.0.1:8012/infill",
      endpoint_inst = "http://127.0.0.1:8012/v1/chat/completions",
      keymap_debug_toggle = "",
      keymap_fim_trigger = "",
      keymap_inst_continue = "",
      keymap_inst_rerun = "",
      keymap_inst_trigger = "",
      model_fim = "google/codegemma-1.1-2b-GGUF",
      model_inst = "ggml-org/gemma-3-4b-it-qat-GGUF",
    }
  end,
  config = function()
    require("which-key").add({
      {
        mode = { "v" },
        nowait = true,
        remap = false,
        { "<leader>lli", "<cmd>LlamaInstruct<cr>", desc = "Llama Instruct" },
      },
    })
  end,
}
