local log = require("codeium.log")

local M = {}
local opts = {
	title = "Codeium",
}
local opts = {
	mute = true
}

local function notify_at_level(name, level)
	return function(message, ...)
		if (opts.mute) then return end;
		local passed = { ... }
		vim.notify(message, level, opts)
		if #passed ~= 0 then
			vim.notify(message, level, opts)
			log[name](message .. ": ", ...)
		end
	end
end

M.trace = notify_at_level("trace", vim.log.levels.TRACE)
M.debug = notify_at_level("debug", vim.log.levels.DEBUG)
M.info = notify_at_level("info", vim.log.levels.INFO)
M.warn = notify_at_level("warn", vim.log.levels.WARN)
M.error = notify_at_level("error", vim.log.levels.ERROR)
M.setopts = function(aOpts)
	opts.mute = aOpts.mute
end

return M
