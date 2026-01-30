return {
  "ggml-org/llama.vim",
  init = function()
    vim.g.llama_config = {
      endpoint_fim = "http://127.0.0.1:8012/infill",
      endpoint_inst = "http://127.0.0.1:8012/v1/chat/completions",
      keymap_debug_toggle = "",
      keymap_fim_accept_full = "<Tab>",
      keymap_fim_accept_line = "<S-Tab>",
      keymap_fim_accept_word = "",
      keymap_fim_trigger = "",
      keymap_inst_accept = "<Tab>",
      keymap_inst_canel = "<Esc>",
      keymap_inst_continue = "",
      keymap_inst_rerun = "",
      max_line_suffix = 1,
      model_fim = "google/codegemma-1.1-2b-GGUF",
      model_inst = "ggml-org/gemma-3-4b-it-qat-GGUF",
      show_info = 0,
    }
  end,
}
