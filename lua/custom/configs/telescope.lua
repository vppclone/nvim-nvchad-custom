local actions = require "telescope.actions"
local fb_actions = require("telescope").extensions.file_browser.actions

local options = {
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["n"] = {
          ["c"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd "startinsert"
          end,
          ["<C-u>"] = function(prompt_bufnr)
            for _ = 1, 10 do
              actions.move_selection_previous(prompt_bufnr)
            end
          end,
          ["<C-d>"] = function(prompt_bufnr)
            for _ = 1, 10 do
              actions.move_selection_next(prompt_bufnr)
            end
          end,
          ["<PageUp>"] = actions.preview_scrolling_up,
          ["<PageDown>"] = actions.preview_scrolling_down,
        },
      },
    },
  },
}

return options

