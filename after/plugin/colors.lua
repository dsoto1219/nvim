local onedark_status_ok, _ = pcall(require, 'onedark')
if onedark_status_ok then
	vim.cmd.colorscheme('onedark')
end
