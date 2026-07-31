Install:
  mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
  cp -R nvim-config ~/.config/nvim
  nvim

First launch:
  lazy.nvim installs plugins automatically.
  Mason and Treesitter install language tools/parsers in the background.

Useful commands:
  :Lazy
  :Mason
  :checkhealth
  :TSUpdate
  :ConformInfo
