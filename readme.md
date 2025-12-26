# Neovim Config

Minimalist setup for Python development.

## Requirements

- Neovim 0.11+
- Python, Node.js, Rust

## Install

```bash
# Neovim 0.11+
curl -Lo https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.bashrc
source ~/.bashrc

# Dependencies (Ubuntu/Debian)
sudo apt install build-essential fd-find ripgrep
sudo ln -s $(which fdfind) /usr/local/bin/fd

# Rust + grip-grab (for pymple)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
cargo install grip-grab

# Python LSP
pip install pyright

# Copy config
cp -r . ~/.config/nvim

# Launch nvim - plugins auto-install
nvim
