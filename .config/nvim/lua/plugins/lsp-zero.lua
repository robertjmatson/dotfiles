return {
	{'folke/tokyonight.nvim'},
  	{'williamboman/mason.nvim'},
  	{'williamboman/mason-lspconfig.nvim'},
  	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  	{'neovim/nvim-lspconfig'},
  	{'hrsh7th/cmp-nvim-lsp'},
  	{'hrsh7th/nvim-cmp'},
  	{'L3MON4D3/LuaSnip'},
	config = function()
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
  			-- see :help lsp-zero-keybindings
  			-- to learn the available actions
  			lsp_zero.default_keymaps({buffer = bufnr})
		end)

		--- if you want to know more about mason.nvim
		--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
		require('mason').setup({})
		require('mason-lspconfig').setup({
			handlers = {
    				function(server_name)
      					require('lspconfig')[server_name].setup({})
    				end,
				lua_ls = function()
      					-- (Optional) configure lua language server
      					local lua_opts = lsp_zero.nvim_lua_ls()
      					require('lspconfig').lua_ls.setup(lua_opts)
    				end,
  			},
		})

		local cmp = require('cmp')
		local cmp_action = lsp_zero.cmp_action()

		cmp.setup({
  			mapping = cmp.mapping.preset.insert({
    				-- `Enter` key to confirm completion
    				['<CR>'] = cmp.mapping.confirm({select = false}),

    				-- Ctrl+Space to trigger completion menu
    				['<C-Space>'] = cmp.mapping.complete(),

    				-- Navigate between snippet placeholder
    				['<C-f>'] = cmp_action.luasnip_jump_forward(),
    				['<C-b>'] = cmp_action.luasnip_jump_backward(),

    				-- Scroll up and down in the completion documentation
    				['<C-u>'] = cmp.mapping.scroll_docs(-4),
    				['<C-d>'] = cmp.mapping.scroll_docs(4),
  			}),
  			snippet = {
    				expand = function(args)
      					require('luasnip').lsp_expand(args.body)
    				end,
  			},
		})	
        end
}
