local function setup()
    local keymap = vim.keymap.set

    vim.g.codeium_enabled = false
    keymap('n', '<leader><CR>', ':CodeiumToggle<CR>')

    -- -- Accept suggestion
    vim.keymap.set('i', '<C-a>', function() return vim.fn['codeium#Accept']() end,
        { expr = true, silent = true })

    -- Next suggestion
    keymap("i", "<C-]>", function() return vim.fn["codeium#CycleCompletions"](1) end,
        { expr = true, desc = "Codeium: Next suggestion" })

    -- -- Previous suggestion
    -- keymap("i", "<C-[>", function() return vim.fn["codeium#CycleCompletions"](-1) end,
    --     { expr = true, desc = "Codeium: Prev suggestion" })
    --
    -- -- Clear suggestions
    -- keymap("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end,
    --     { expr = true, desc = "Codeium: Clear suggestions" })
end

return {
    setup = setup
}
