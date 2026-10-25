# Neovim Config

Minimal Neovim setup with LSP, fuzzy finding, and file tree.

## Requirements

- Neovim 0.10+
- pyright (Python language server)
- ripgrep (for live grep search)
- fd (optional, for faster file finding)

## Installation

### On macOS

```bash
# Install Neovim
brew install neovim

# Install dependencies
brew install pyright ripgrep fd

# Clone or copy this config to ~/.config/nvim
# Then launch nvim - plugins will auto-install on first run
nvim
```

### On Linux

```bash
# Install pyright
pip install pyright

# Install ripgrep and fd
sudo apt install ripgrep fd-find  # Ubuntu/Debian
# or
sudo dnf install ripgrep fd-find  # Fedora

# Clone or copy this config to ~/.config/nvim
# Then launch nvim - plugins will auto-install on first run
nvim
```

## Plugins

- **lazy.nvim** - Plugin manager (auto-bootstraps)
- **Telescope** - Fuzzy finder for files, text, buffers
- **nvim-tree** - File explorer
- **nvim-lspconfig** - LSP support
- **nvim-treesitter** - Better syntax highlighting

## Keybindings

### Telescope
- `<leader>ff` - Find files
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Browse open buffers
- `<leader>fh` - Search help tags

### File Tree
- `<leader>e` - Toggle nvim-tree

### LSP (when attached to Python files)
- `gd` - Go to definition
- `grr` - Find references
- `grn` - Rename symbol
- `K` - Show hover documentation

## Session Management

Sessions auto-save as `.Session.vim` in your working directory when you exit Neovim (if opened with no arguments). They auto-load when you open Neovim in that directory again.
