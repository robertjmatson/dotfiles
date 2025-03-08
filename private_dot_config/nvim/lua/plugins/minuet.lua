if true then
  return {}
end

return {
  {
    "milanglacier/minuet-ai.nvim",
    enabled = true,
    keys = {
      { "<leader>av", "<cmd>Minuet virtualtext toggle<CR>", desc = "Toggle virtual text" },
    },
    config = function()
      require("minuet").setup({
        provider = "openai_fim_compatible",
        provider_options = {
          openai_fim_compatible = {
            model = "codegemma",
            end_point = "http://192.168.49.27:11434/v1/completion",
            api_key = "TERM",
            name = "Ollama",
            stream = true,
            template = {
              prompt = "See [Prompt Section for default value]",
              suffix = "See [Prompt Section for default value]",
            },
            optional = {
              stop = nil,
              max_tokens = nil,
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
}
