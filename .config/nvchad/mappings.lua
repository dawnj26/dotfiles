---@type MappingsTable
local M = {}

M.general = {
  n = {
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    ["<leader>qs"] = {
      function()
        require("persistence").load()
      end,
      "Load last session",
      {},
    },
    ["<leader>e"] = { "<cmd> NvimTreeToggle<CR>", "Toggle NvimTree", {} },
    ["<leader>w-"] = { "<cmd>split<CR>", "Split window horizontally", {} },
    ["<leader>w|"] = { "<cmd>vsplit<CR>", "Split window vertically", {} },
    ["<leader>wd"] = { "<cmd>close<CR>", "Close window", {} },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.trouble = {
  n = {
    ["<leader>tt"] = {
      function()
        require("trouble").toggle()
      end,
      "Toggle trouble",
      {},
    },
    ["<leader>tw"] = {
      function()
        require("trouble").toggle "workspace_diagnostics"
      end,
      "Toggle workspace diagnostics",
      {},
    },
    ["<leader>td"] = {
      function()
        require("trouble").toggle "document_diagnostics"
      end,
      "Toggle document diagnostics",
      {},
    },
    ["<leader>tq"] = {
      function()
        require("trouble").toggle "quickfix"
      end,
      "Toggle quickfix",
      {},
    },
    ["<leader>tl"] = {
      function()
        require("trouble").toggle "loclist"
      end,
      "Toggle loclist",
      {},
    },
    ["gR"] = {
      function()
        require("trouble").lsp_references()
      end,
      "Lsp references",
      {},
    },
  },
}

M.harpoon = {
  n = {
    ["<leader>a"] = {
      function()
        require("harpoon"):list():append()
      end,
    },
    ["<C-e>"] = {
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
    },
    ["<A-1>"] = {
      function()
        require("harpoon"):list():select(1)
      end,
    },
    ["<A-2>"] = {
      function()
        require("harpoon"):list():select(2)
      end,
    },
    ["<A-3>"] = {
      function()
        require("harpoon"):list():select(3)
      end,
    },
    ["<A-4>"] = {
      function()
        require("harpoon"):list():select(4)
      end,
    },
    ["<C-S-P>"] = {
      function()
        require("harpoon"):list():prev()
      end,
    },
    ["<C-S-N>"] = {
      function()
        require("harpoon"):list():next()
      end,
    },
  },
}

M.tabufline = {
  n = {
    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
}


-- more keybinds!

return M
