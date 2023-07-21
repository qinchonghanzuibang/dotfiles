require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.6,
        width = 0.6,
    },
})

-- Example keybindings
vim.keymap.set('n', '<leader>tt', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<leader>tt', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
