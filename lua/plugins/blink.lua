local trigger_text = ";"

return {
  "saghen/blink.cmp",
  enabled = true,
  opts = function(_, opts)
    opts.cmdline = {
      enabled = true,
    }

    opts.completion = {
      documentation = {
        auto_show = true,
        window = {
          border = "single",
        },
      },
      ghost_text = {
        enabled = true,
      },
      menu = {
        border = "single",
      },
    }

    opts.enabled = function()
      local filetype = vim.bo[0].filetype
      if filetype == "TelescopePrompt" or filetype == "minifiles" or filetype == "snacks_picker_input" then
        return false -- Disable for Telescope buffers
      end
      return true
    end

    opts.keymap = {
      preset = "default",

      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then return cmp.accept()
          else return cmp.select_and_accept() end
        end,
        'snippet_forward',
        'fallback'
      },

      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },

      ["<S-j>"] = { "scroll_documentation_down", "fallback" },
      ["<S-k>"] = { "scroll_documentation_up", "fallback" },

      ["<C-e>"] = { "hide", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    }

    opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
      default = { "buffer", "lsp", "path", "snippets"},
      providers = {
        buffer = {
          enabled = true,
          max_items = 3,
          min_keyword_length = 4,
          module = "blink.cmp.sources.buffer",
          name = "Buffer",
          score_offset = 10,
        },
        lsp = {
          enabled = true,
          kind = "LSP",
          min_keyword_length = 1,
          module = "blink.cmp.sources.lsp",
          name = "lsp",
          score_offset = 90,
        },
        path = {
          fallbacks = { "buffer", "snippets" },
          module = "blink.cmp.sources.path",
          name = "Path",
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
            end,
            show_hidden_files_by_default = true,
          },
          score_offset = 20,
        },
        snippets = {
          enabled = true,
          max_items = 15,
          min_keyword_length = 2,
          module = "blink.cmp.sources.snippets",
          name = "snippets",
          score_offset = 80,
          should_show_items = function()
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
            return before_cursor:match(trigger_text .. "%w*$") ~= nil
          end,
          transform_items = function(_, items)
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
            local trigger_pos = before_cursor:find(trigger_text .. "[^" .. trigger_text .. "]*$")
            if trigger_pos then
              for _, item in ipairs(items) do
                if not item.trigger_text_modified then
                  ---@diagnostic disable-next-line: inject-field
                  item.trigger_text_modified = true
                  item.textEdit = {
                    newText = item.insertText or item.label,
                    range = {
                      start = { line = vim.fn.line(".") - 1, character = trigger_pos - 1 },
                      ["end"] = { line = vim.fn.line(".") - 1, character = col },
                    },
                  }
                end
              end
            end
            return items
          end,
        },
      },
    })

    opts.snippets = {
      preset = "luasnip",
    }

    return opts
  end,
}
