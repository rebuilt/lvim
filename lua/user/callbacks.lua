local M = {}

M.setup = function()
	lvim.builtin.autopairs.on_config_done = function(module)
		-- print(vim.inspect(module))
		local endwise = require("nvim-autopairs.ts-rule").endwise
		-- local npairs = require("nvim-autopairs")
		module.add_rules({
			endwise("def", "end", nil, nil),
		})
		-- Rule('def%s.+$', 'end', 'ruby')
		--        :use_regex(true)
		--        :end_wise(cond.not_after_regex_check('.'))

		module.remove_rule("`")
		local Rule = require("nvim-autopairs.rule")
		module.add_rule(Rule("`", "`", { "lua", "ruby", "javascript" }))
		module.add_rule(Rule("```", "```", "markdown"))
	end

	lvim.lsp.on_attach_callback = function(client, bufnr)
		require("lsp_signature").on_attach()
	end

	lvim.builtin.telescope.on_config_done = function(module)
		module.load_extension("fzy_native")
	end

	lvim.builtin.galaxyline.on_config_done = function(module)
		local section = module.section
		local lsp_status = require("lsp-status")
		lsp_status.config({
			indicator_errors = "E",
			indicator_warnings = "W",
			indicator_info = "i",
			indicator_hint = "?",
			indicator_ok = "Ok",
			diagnostics = false,
			status_symbol = "",
		})
		lsp_status.register_progress()
		table.insert(section.left, {
			LspStatus = {
				provider = function()
					return lsp_status.status()
				end,
				-- event = "BufEnter",
				separator = "",
				separator_highlight = { "NONE", "#262626" },
				highlight = { "#c8c9c1", "#262626" },
			},
		})
	end
end

return M
