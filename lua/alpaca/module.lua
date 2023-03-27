-- module represents a lua module for the plugin
local M = {}

M.concat_lines = function(lines_range)
    local lines = ""
    for _, value in pairs(lines_range) do
        if value ~= nil and value ~= "" then
            lines = lines .. value .. '\\n'
        end
    end
    return lines
end

return M
