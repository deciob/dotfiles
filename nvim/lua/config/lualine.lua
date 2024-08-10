-- Lua

--require('lualine').setup {}

-- Possible lualine-giblame setup
--vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
--local git_blame = require('gitblame')
--
--require('lualine').setup {
--    sections = {
--        lualine_c = {
--            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
--        }
--    }
--}
--
--

local default = require('lualine').get_config()

local custom = {
    sections = {
        lualine_c = { { 'filename', path = 1 } },
    },
}

require('lualine').setup(vim.tbl_deep_extend('force', default, custom))
