-- main module file
local module = require("alpaca.module")

local M = {}
M.config = {
    -- default config
    prompt = "Explain this %s code step by step in detail:\\n%s"
}

-- setup is the public method to setup your plugin
M.setup = function(args)
    -- you can define your setup function here. Usually configurations can be merged, accepting outside params and
    -- you can also put some validation here for those.
    M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

-- "hello" is a public method for the plugin
---@param filetype string
M.explain = function(filetype)
    local start_sel = vim.fn.getpos('v')[2]
    local end_sel = vim.fn.getpos('.')[2]
    local lines_range = vim.api.nvim_buf_get_lines(0, start_sel - 1, end_sel, true)
    local lines = module.concat_lines(lines_range)
    return (string.format(M.config.prompt, filetype, lines))
end

return M
