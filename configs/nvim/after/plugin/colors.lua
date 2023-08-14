-- vim.cmd("let g:gruvbox_transparent_bg = 1")
-- vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
function ColorSet(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)
end


-- Set colorscheme after options
-- vim.cmd('colorscheme rose-pine')
ColorSet()
