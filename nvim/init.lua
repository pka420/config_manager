require("pka42")

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

