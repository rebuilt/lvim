local M = {}

M.setup = function()
	lvim.builtin.autopairs.on_config_done = function(module)
		-- print(vim.inspect(module))
		local endwise = require("nvim-autopairs.ts-rule").endwise
		-- local npairs = require("nvim-autopairs")
		module.add_rules({
			endwise("def", "end", "ruby", nil),
		})
		-- Rule('def%s.+$', 'end', 'ruby')
		--        :use_regex(true)
		--        :end_wise(cond.not_after_regex_check('.'))

		module.remove_rule("`")
		module.remove_rule("%")
		module.remove_rule("$")
		local Rule = require("nvim-autopairs.rule")
		module.add_rule(
			Rule("`", "`", { "lua", "ruby", "javascript", "javascriptreact", "typescript", "typescriptreact" })
		)
		module.add_rule(Rule("```", "```", "markdown"))

		-- Javascript rules
		module.add_rule(Rule("<label ", "htmlFor=''></label>", "javascript"))
		module.add_rule(Rule("<input ", "type='text' />", "javascript"))
	end

	lvim.lsp.on_attach_callback = function(client, bufnr)
		require("lsp_signature").on_attach()
	end

	lvim.builtin.telescope.on_config_done = function(module)
		module.load_extension("fzy_native")
	end

	-- lvim.builtin.bufferline.on_config_done = function()
	-- 	vim.cmd([[
	--     highlight BufferCurrent             guibg=#5fd7ff guifg=#282a2e
	--     highlight link BufferCurrentMod     BufferCurrent
	--     highlight link BufferCurrentSign    BufferCurrent
	--     highlight BufferCurrentTarget       guibg=#d7ff5f
	--     highlight BufferInactive            guibg=#0087d7 guifg=#ffffff
	--     highlight link BufferInactiveMod    BufferInactive
	--     highlight link BufferInactiveSign   BufferInactive
	--     highlight link BufferInactiveTarget BufferCurrentTarget
	--     highlight link BufferVisible        BufferInactive
	--     highlight link BufferVisibleMod     BufferVisible
	--     highlight link BufferVisibleSign    BufferVisible
	--     highlight link BufferVisibleTarget  BufferInactiveTarget
	--     highlight BufferTabpages            guibg=#ff0000 guifg=#ff0000
	--     highlight BufferCurrent             guibg=#5fd7ff guifg=#282a2e
	--     ]])
	-- end
end

return M
