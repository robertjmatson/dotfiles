if true then
  return {}
end
return {
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        -- Manually invoke minuet completion.
        ["<A-y>"] = require("minuet").make_blink_map(),
      },
      sources = {
        default = { "lsp", "path", "buffer", "snippets", "minuet", "codecompanion" },
        -- For manual completion only, remove 'minuet' from default
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            score_offset = 8, -- Gives minuet higher priority among suggestions
          },
        },
        --per_filetype = {
        --  codecompanion = { "codecompanion" },
        --},
      },
      -- Recommended to avoid unnecessary request
      ompletion = { trigger = { prefetch_on_insert = true } },
    },
  },
}
