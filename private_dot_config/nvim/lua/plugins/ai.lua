return {
  {
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lob_level = "DEBUG",
      display = {
        chat = {
          intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
          show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
          separator = "─", -- The separator between the different messages in the chat buffer
          show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
          show_settings = false, -- Show LLM settings at the top of the chat buffer?
          show_token_count = true, -- Show the token count for each response?
          start_in_insert_mode = false, -- Open the chat buffer in insert mode?
        },
        inline = {
          layout = "buffer",
        },
        diff = {
          enabled = true,
          close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
          layout = "vertical", -- vertical|horizontal split for default provider
          opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
          provider = "default", -- default|mini_diff
        },
        action_palette = {
          width = 95,
          height = 10,
          prompt = "Prompt ",
          provider = "default",
          opts = {
            show_default_actions = true,
            show_default_prompt_library = true,
          },
        },
      },
      strategies = {
        chat = {
          roles = {
            ---The header name for the LLM's messages
            ---@type string|fun(adapter: CodeCompanion.Adapter): string
            llm = function(adapter)
              return "CodeCompanion (" .. adapter.formatted_name .. ")"
            end,

            ---The header name for your messages
            ---@type string
            user = "Me",
          },
          keymaps = {
            send = {
              modes = { n = "<C-s>", i = "<C-s>" },
            },
            close = {
              modes = { n = "<C-c>", i = "<C-c>" },
            },
          },
          adapter = "llama31",
        },
        inline = {
          keymaps = {
            accept_change = {
              nodes = { n = "ga" },
              description = "Accept the suggested change",
            },
            reject_change = {
              nodes = { n = "gr" },
              desciption = "Reject the suggested change",
            },
          },
          adapter = "llama31",
        },
      },
      adapters = {
        llama31 = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "llama31",
            env = {
              url = "http://192.168.49.27:11434",
            },
            headers = {
              ["Content-Type"] = "application/json",
            },
            parameters = {
              sync = true,
            },
            schema = {
              model = {
                default = "llama3.1",
              },
              num_ctx = {
                defaults = 16384,
              },
              num_predect = {
                default = -1,
              },
            },
          })
        end,
      },
    },
    keys = {
      { "<leader>cpc", vim.cmd.CodeCompanionChat, mode = { "n", "v" }, desc = "Open Chat" },
      { "<leader>cpa", vim.cmd.CodeCompanionAction, mode = { "n", "v" }, desc = "Open Actions" },
    },
  },
  {
    "milanglacier/minuet-ai.nvim",
    enabled = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader>av", "<cmd>Minuet virtualtext toggle<CR>", desc = "Toggle virtual text" },
    },
    config = function()
      require("minuet").setup({
        context_window = 1000, --768 test works
        request_timeout = 5,
        provider = "openai_fim_compatible",
        provider_options = {
          openai_fim_compatible = {
            model = "qwen2.5-coder",
            end_point = "http://192.168.49.27:11434/v1/completions",
            api_key = "TERM",
            name = "qwen14",
            stream = true,
            template = {
              prompt = function(context_before_cursor, context_after_cursor)
                return "<|fim_prefix|>"
                  .. context_before_cursor
                  .. "<|fim_suffix|>"
                  .. context_after_cursor
                  .. "<|fim_middle|>"
              end,
              suffix = false,
            },
            optional = {
              stop = { "\n\n" },
              max_tokens = 256,
            },
          },
        },
        virtualtext = {
          auto_trigger_ft = {},
          keymap = {
            accept = "<A-A>",
            accept_line = "<A-a>",
            -- Cycle to prev completion item, or manually invoke completion
            prev = "<A-n>",
            -- Cycle to next completion item, or manually invoke completion
            next = "<A-p>",
            dismiss = "<A-e>",
          },
        },
      })
    end,
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        ["<A-y>"] = {
          function(cmp)
            cmp.show({ providers = { "minuet" } })
          end,
        },
      },
      sources = {
        -- if you want to use auto-complete
        default = { "lsp", "path", "snippets", "buffer", "minuet" },
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            score_offset = 100,
          },
        },
      },
    },
  },
}
