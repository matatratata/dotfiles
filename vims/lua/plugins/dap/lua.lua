local M = {}

function M.setup()
	local dap = require("dap")
	dap.configurations.lua = {
		{
			type = "nlua",
			request = "attach",
			name = "Attach to running Neovim instance",
			host = function()
				local value = vim.fn.input("Host [172.19.64.1]: ")
				if value ~= "" then
					return value
				end
				return "172.19.64.1"
			end,
			port = function()
				local val = tonumber(vim.fn.input("Port: ", "8086"))
				assert(val, "Please provide a port number")
				return val
			end,
		},
	}

	dap.adapters.nlua = function(callback, config)
		callback({ type = "server", host = config.host, port = config.port })
	end
end

return M
