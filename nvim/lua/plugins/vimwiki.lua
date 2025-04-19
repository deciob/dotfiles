return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/vimwiki",
				syntax = "default",
				ext = ".wiki",
			},
		}
		-- Enable syntax highlighting in code blocks
		vim.g.vimwiki_highlightcodeblocks = 1

		-- Set up custom syntax highlighting for code blocks
		vim.cmd([[
  function! VimwikiHighlight()
    syntax include @Python syntax/python.vim
    syntax region pythonCode start="{{{python" end="}}}" contains=@Python
    syntax include @Lua syntax/lua.vim
    syntax region luaCode start="{{{lua" end="}}}" contains=@Lua
    syntax include @Vim syntax/vim.vim
    syntax region vimCode start="{{{vim" end="}}}" contains=@Vim
    syntax include @CSS syntax/css.vim
    syntax region cssCode start="{{{css" end="}}}" contains=@CSS
    syntax include @HTML syntax/html.vim
    syntax region htmlCode start="{{{html" end="}}}" contains=@HTML
  endfunction

  autocmd FileType vimwiki call VimwikiHighlight()
  ]])
	end,
}
