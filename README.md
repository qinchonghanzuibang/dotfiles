# Dotfiles

This repository stores a small, explicit set of macOS command-line configuration files. The live files are copied without reformatting or rewriting; `manifest.txt` is the management allowlist.

## Managed files

- `.zshrc`
- `.zprofile`
- `.tmux.conf`
- `.gitconfig`
- `.condarc`
- `.config/git/ignore`
- `.config/ghostty/config`
- `.config/starship.toml`
- `.config/nvim`

Some manifest entries may be absent. `sync` warns and preserves the repository copy when a live source is missing, while `install` warns and skips a missing repository source. Generated `.DS_Store` files are excluded from managed directory transfers and comparisons.

## Usage

Inspect differences without changing anything:

```zsh
./dotfiles status
./dotfiles install --dry-run
./dotfiles sync --dry-run
./dotfiles restore latest --dry-run
```

Install repository files into the target home:

```zsh
./dotfiles install
```

Every install completes a backup before its first destination write. Backups default to `~/.dotfiles-backups/<timestamp>/`, preserve managed relative paths, and record destinations newly created by that install. Override the location with `DOTFILES_BACKUP_ROOT`.

Copy the managed live files back into `home/` exactly:

```zsh
./dotfiles sync
```

Restore a particular install backup, or the latest backup. Restore replaces paths that existed before the install and removes paths that install recorded as newly created:

```zsh
./dotfiles restore ~/.dotfiles-backups/20260101-120000
./dotfiles restore latest
```

Remove only `.DS_Store` and `Icon` carriage-return files from the repository:

```zsh
./dotfiles clean
```

`--dry-run` is completely non-mutating. For isolated testing, point every operation at a temporary home:

```zsh
test_home="$(mktemp -d)"
DOTFILES_HOME="$test_home" \
DOTFILES_BACKUP_ROOT="$test_home/backups" \
./dotfiles install
```

## Packages and prerequisites

Install the curated Homebrew bundle with:

```zsh
brew bundle --file ./Brewfile
```

The Zsh configuration expects [Oh My Zsh](https://ohmyz.sh/). Its `git`, `macos`, `brew`, `gh`, `sudo`, and `extract` plugins ship with Oh My Zsh. Install the third-party `zsh-autosuggestions` and `zsh-syntax-highlighting` plugins under the Oh My Zsh custom plugin directory before starting a shell with this configuration.

Miniforge is installed separately because the captured shell configuration references the local Miniforge installation. Conda environments and application state are deliberately excluded.

SSH material, tokens, passwords, proxy credentials, shell histories, caches, generated application state, Conda environments, and other secrets are not managed. Localhost proxy settings are permitted, but no remote credentials belong in this repository.
