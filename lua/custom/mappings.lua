---@type MappingsTable
local M = {}

local opts = {
  nowait = true,
  noremap = true,
}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<leader>e"] = "",
    ["<leader>ra"] = "",
    ["H"] = "",
    ["L"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts },
    ["r"] = { "<C-r>", "Redo", opts },
    ["<C-d>"] = { "*N", "Send current word to search", opts },
    -- windows
    ["ss"] = { "<cmd> split <CR>", "Window left" },
    ["sv"] = { "<cmd> vsplit <CR>", "Window left" },
    ["sh"] = { "<C-w>h", "Window left" },
    ["sl"] = { "<C-w>l", "Window right" },
    ["sj"] = { "<C-w>j", "Window down" },
    ["sk"] = { "<C-w>k", "Window up" },
    -- tab
    ["ta"] = { "<cmd> $tabnew<CR>", "Tab New", opts },
    ["tx"] = { "<cmd> tabclose<CR>", "Tab Exit", opts },
    ["to"] = { "<cmd> tabonly<CR>", "Tab Only", opts },
    ["tmp"] = { "<cmd> -tabmove<CR>", "Tab move prev", opts },
    ["tmn"] = { "<cmd> +tabmove<CR>", "Tab move next", opts },
    ["tn"] = { "<cmd> tabn<CR>", "Tab next", opts },
    ["tp"] = { "<cmd> tabp<CR>", "Tab prev", opts },
    -- Buffer
    ["<leader>kw"] = {
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["/"] = { '"fy/\\V<C-R>f<CR>N', "Sync behavior with /", opts },
  },
}

M.lspconfig = {
  plugin = true,
  n = {
    ["<C-k>"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },
    ["<C-j>"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },
    ["<leader>cr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
  },
}

M.telescope = {
  plugin = true,
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<C-g>"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["sf"] = {
      function()
        local telescope = require "telescope"

        local function telescope_buffer_dir()
          return vim.fn.expand "%:p:h"
        end

        telescope.extensions.file_browser.file_browser {
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          groupted = false,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 40 },
        }
      end,
      "Open file browser",
    },
  },
}

M.window = {
  n = {
    ["<C-c>"] = { "yy", "Copy not yank", opts },
    ["<C-x>"] = { "dd", "Cut not delete line", opts },
    ["<C-v>"] = { "p", "Paste but v?", opts },
    ["<C-a>"] = { "gg<S-v>G", "Select all", opts },
  },
  i = {
    ["<C-v>"] = { "<C-r>*", "Paste in insert (finally window can be useful)", opts },
  },
  v = {
    ["<C-c>"] = { "y", "Copy not yank", opts },
    ["<C-x>"] = { "d", "Cut not delete line", opts },
    ["<C-v>"] = { "p", "Paste but v?", opts },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.UI = {
  n = {
    ["<leader>un"] = {
      function ()
        require("notify").dismiss({
          silent = true,
          pending = true
        })
      end,
      desc = "Dismiss all Notifications"
    }
  }
}
return M
