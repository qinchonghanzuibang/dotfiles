require('code_runner').setup({
    term = {
        size = 25
    },
    mode = "float",
    float = {
        close_key = "<ESC>",
        -- Window border (see ':h nvim_open_win')
        border = "double",

        -- Num from `0 - 1` for measurements
        height = 0.6,
        width = 0.6,
        x = 0.5,
        y = 0.5,

        -- Highlight group for floating window/border (see ':h winhl')
        border_hl = "FloatBorder",
        float_hl = "Normal",

        -- Transparency (see ':h winblend')
        blend = 0,
    },
    filetype = {
        java = {
            "cd \"$dir\" &&",
            "javac \"$fileName\" &&",
            "java \"$fileNameWithoutExt\" &&",
            "rm $fileNameWithoutExt.class"
        },

        python = "python3 -u",
        c = {
            "cd \"$dir\" &&",
            "gcc \"$fileName\"",
            "-o \"$fileNameWithoutExt\" &&",
            "\"$dir/$fileNameWithoutExt\" &&",
            "rm \"$fileNameWithoutExt\""
        },

        cpp = {
            "cd \"$dir\" &&",
            "g++ \"$fileName\"",
            "-o \"$fileNameWithoutExt\" &&",
            "\"$dir/$fileNameWithoutExt\" &&",
            "rm \"$fileNameWithoutExt\""
        },
        javascript = {
            "cd \"$dir\" &&",
            "node \"$fileName\""
        },
    },
})

vim.keymap.set('n', '<C-b>', ':RunCode<CR>', { noremap = true, silent = false })
