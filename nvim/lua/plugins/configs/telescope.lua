local actions = require "telescope.actions"

local file_ignore_patterns = {
  "^.git/",
  "^.log/",
  "^.github/",
  "/node_modules/",
  "package-lock.json",
}

local options = {
  defaults = {
    -- vimgrep_arguments = {
    --   "rg",
    --   "-L",
    --   "--color=never",
    --   "--no-heading",
    --   "--with-filename",
    --   "--line-number",
    --   "--column",
    --   "--smart-case",
    -- },

    initial_mode = "insert",
    sorting_strategy = "ascending",

    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },

    file_ignore_patterns = file_ignore_patterns,
    -- file_sorter = require("telescope.sorters").get_fuzzy_file,
    -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    -- path_display = { "truncate" },

    -- winblend = 0,
    -- border = {},
    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

    color_devicons = true,
    -- set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,

    -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- -- Developer configurations: Not meant for general override
    -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,

    mappings = {
      n = { ["q"] = require("telescope.actions").close },
      i = {
        ["<esc>"] = actions.close,
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result

        ["<M-BS>"] = function()
          vim.api.nvim_input "<c-s-w>"
        end,
      },
    },
  },

  extensions_list = { "themes", "terms", "file_browser", "workspaces" },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },

    file_browser = {
      hijack_netrw = true,
      hidden = true,
      respect_gitignore = false,
      file_ignore_patterns = {},

      mappings = {
        i = {
          ["<C-h>"] = require("telescope._extensions.file_browser.actions").goto_parent_dir,
          ["<C-r>"] = require("telescope._extensions.file_browser.actions").rename,
          ["<C-p>"] = require("telescope._extensions.file_browser.actions").move,
          ["<C-d>"] = require("telescope._extensions.file_browser.actions").remove,
        },
      },
    },
  },
}

return options
