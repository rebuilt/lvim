-- Modified from https://github.com/McAuleyPenney/tidy.nvim

local M = {}


function M.tidy_up()

    -- get tuple of cursor position before making changes
    local pos = vim.api.nvim_win_get_cursor( 0 )

    -- delete all whitespace, see source 1
    vim.cmd[[:keepjumps keeppatterns %s/\s\+$//e]]

    vim.api.nvim_win_set_cursor( 0, pos )
end


return M
