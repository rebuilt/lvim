local M = {}

M.setup = function()
  lvim.builtin.autopairs.on_config_done = function(module)
    module.add_rules(require("nvim-autopairs.rules.endwise-ruby"))
    module.add_rules(require("nvim-autopairs.rules.endwise-lua"))
    local Rule = require("nvim-autopairs.rule")

    module.add_rule(Rule("```", "```", "markdown"))

    module.remove_rule("`")
    module.remove_rule("%")
    module.remove_rule("$")
    module.add_rule(
      Rule("`", "`", { "lua", "ruby", "javascript", "javascriptreact", "typescript", "typescriptreact" })
    )
    -- Javascript rules
    module.add_rule(Rule("<label ", "htmlFor=''></label>", "javascript"))
    module.add_rule(Rule("<input ", "type='text' />", "javascript"))

    -- local endwise = require("nvim-autopairs.ts-rule").endwise
    -- module.add_rules(endwise(" do$", "end", "elixir", nil))

    local endwise = require("nvim-autopairs.ts-rule").endwise
    -- module.add_rules(require("nvim-autopairs.rules.endwise-lua"))

    module.add_rules(
      {
        endwise(" do$", "end", "elixir", nil),
        endwise(" fn ", "end", "elixir", nil),
        endwise(" def ", "end", "elixir", nil),
        endwise(" defp ", "end", "elixir", nil)
      }
    )
  end
end

return M
