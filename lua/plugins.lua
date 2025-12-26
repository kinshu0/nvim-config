-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({

  { -- Telescope
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Telescope help tags" })
    end,
  },

  -- LSP config
  { "neovim/nvim-lspconfig" },

  { -- File tree
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
    end,
  },

  -- { -- pymple
  --   "alexpasmantier/pymple.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   build = ":PympleBuild",
  --   config = function()
  --     require("pymple").setup()
  --   end,
  -- },

  { -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate | :TSInstall lua python javascript typescript json yaml markdown",
  },

})
