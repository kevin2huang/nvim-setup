return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    config = function()
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-x>"] = actions.delete_buffer,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
            },
          },
          file_ignore_patterns = { "node_modules", "yarn.lock", "package-lock.json", ".git", ".next", "dist" },
          hidden = true,
        }
      })

      require("telescope").load_extension("fzf")
      local builtin = require("telescope.builtin")

      vim.keymap.set(
        "n",
        "<C-p>",
        builtin.find_files,
        { desc = "Telescope find files" }
      )
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        find_files = {
          theme = "ivy"
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_ivy({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
