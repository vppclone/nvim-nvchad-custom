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
    ["r"] = { "<C-r>", "Redo", opts },
    ["<C-d>"] = { "*N", "Send current word to search", opts },
    -- windows
    ["ss"] = { "<cmd> split <CR>", "Window left", opts },
    ["sv"] = { "<cmd> vsplit <CR>", "Window left", opts },
    ["sh"] = { "<C-w>h", "Window left", opts },
    ["sl"] = { "<C-w>l", "Window right", opts },
    ["sj"] = { "<C-w>j", "Window down", opts },
    ["sk"] = { "<C-w>k", "Window up", opts },
    -- move lines
    ["<A-j>"] = { "<cmd>m .+1<cr>==", "Move down", opts },
    ["<A-k>"] = { "<cmd>m .-2<cr>==", "Move up", opts },
    -- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
    -- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
    -- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
    -- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
    -- Clear search with <esc>
    -- map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
    -- map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
    -- map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
    -- map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
    -- map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
    -- map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
    -- map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
    -- better indenting
    -- map("v", "<", "<gv")
    -- map("v", ">", ">gv")
    -- map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["/"] = { '"fy/\\V<C-R>f<CR>N', "Sync behavior with /", opts },
  },
}

M.tab = {
  n = {
    ["ta"] = { "<cmd> $tabnew<CR>", "Tab New", opts },
    ["tx"] = { "<cmd> tabclose<CR>", "Tab Exit", opts },
    ["to"] = { "<cmd> tabonly<CR>", "Tab Only", opts },
    ["tmp"] = { "<cmd> -tabmove<CR>", "Tab move prev", opts },
    ["tmn"] = { "<cmd> +tabmove<CR>", "Tab move next", opts },
    ["tn"] = { "<cmd> tabn<CR>", "Tab next", opts },
    ["tp"] = { "<cmd> tabp<CR>", "Tab prev", opts },
  },
}

M.buffer = {
  n = {
    ["<leader>kw"] = {
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
    },
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

M.window_like = {
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
      function()
        require("notify").dismiss {
          silent = true,
          pending = true,
        }
      end,
      desc = "Dismiss all Notifications",
    },
  },
}
return M
