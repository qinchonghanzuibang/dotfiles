require('code_runner').setup({
    term = {
        size = 25
    },
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt &&",
      "rm $fileNameWithoutExt.class"
    },
    python = "python3 -u",
    c = {
      "cd $dir &&",
      "gcc $fileName",
      "-o $fileNameWithoutExt &&",
      "$dir/$fileNameWithoutExt &&",
      "rm $fileNameWithoutExt"
    },
    cpp = {
      "cd $dir &&",
      "g++ $fileName",
      "-o $fileNameWithoutExt &&",
      "$dir/$fileNameWithoutExt &&",
      "rm $fileNameWithoutExt"
    },
  },
})

vim.keymap.set('n', '<C-b>', ':RunCode<CR>', { noremap = true, silent = false })
