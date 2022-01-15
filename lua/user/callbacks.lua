local M = {}

M.setup = function()
	lvim.builtin.autopairs.on_config_done = function(module)
    module.add_rules(require("nvim-autopairs.rules.endwise-ruby"))
		local Rule = require("nvim-autopairs.rule")

    -- ruby rules
		local endwise = require("nvim-autopairs.ts-rule").endwise
		module.add_rules({
			-- endwise("def", "end", "ruby","method"),
			-- endwise("module", "end", "ruby", "module"),
			-- endwise("do", "end", "ruby", "do_block"),
			-- endwise("if", "end", "ruby", "if"),
			-- endwise("unless", "end", "ruby", "unless"),
			-- endwise("case", "end", "ruby", "case"),
			-- endwise("while", "end", "ruby", "while"),
			-- endwise("until", "end", "ruby", "until"),
			-- endwise("begin", "end", "ruby", "begin"),
			-- endwise("class", "end", "ruby", nil),
		})

		module.add_rule(Rule("```", "```", "markdown"))
    module.add_rule(Rule("<%= ", "%>"))

		module.remove_rule("`")
		module.remove_rule("%")
		module.remove_rule("$")
		module.add_rule(
			Rule("`", "`", { "lua", "ruby", "javascript", "javascriptreact", "typescript", "typescriptreact" })
		)

		-- Javascript rules
		module.add_rule(Rule("<label ", "htmlFor=''></label>", "javascript"))
		module.add_rule(Rule("<input ", "type='text' />", "javascript"))
	end

	-- lvim.lsp.on_attach_callback = function(client, bufnr)
	-- 	require("lsp_signature").on_attach()
	-- end

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
