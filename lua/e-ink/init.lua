local M = {}
local generate_syntax = require("e-ink.syntax").generate_syntax

M.default_options = {
   fg_contrast = 0,
}
M.options = M.default_options

--- nvim-notify support
---@param message string notify message
---@param log_level string|nil vim.log.levels
---@return function vim.notify
local function notify(message, log_level)
   return vim.notify(message, log_level, { title = "e-ink.nvim" })
end

function M.load()
   vim.cmd([[highlight clear]])
   vim.opt.termguicolors = true
   vim.g.colors_name = "e-ink"

   if generate_syntax then
      return generate_syntax(M.options.fg_contrast)
   else
      return notify("colorscheme loading failed", "ERROR")
   end
end

function M.setup(user_options)
   user_options = user_options or {}
   M.options = vim.tbl_extend("keep", user_options, M.options)
end

return M
