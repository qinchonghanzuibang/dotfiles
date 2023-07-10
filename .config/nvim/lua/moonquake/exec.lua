-- Compile and run Java with NeoVim
vim.api.nvim_set_keymap('n', '<C-b>', ':!javac % && java %:r && rm %:r.class<CR>', { noremap = true })

