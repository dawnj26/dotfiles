return {
  {
    "LudoPinelli/comment-box.nvim",
    -- keys = {
    --   { "<leader>cbb", "<Cmd>CBccbox<CR>", desc = "Box title" },
    --   { "<leader>cbt", "<Cmd>CBllline<CR>", desc = "Titled line" },
    --   { "<leader>cbl", "<Cmd>CBline<CR>", desc = "Simple line" },
    --   { "<leader>cbm", "<Cmd>CBllbox14<CR>", desc = "Marked" },
    --   { "<leader>cbd", "<Cmd>CBd<CR>", desc = "Remove a box" },
    -- },
    init = function()
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- Titles
      keymap({ "n", "v" }, "<Leader>cbb", "<Cmd>CBccbox<CR>", opts)
      -- Named parts
      keymap({ "n", "v" }, "<Leader>cbt", "<Cmd>CBllline<CR>", opts)
      -- Simple line
      keymap("n", "<Leader>cbl", "<Cmd>CBline<CR>", opts)
      -- keymap("i", "<M-l>", "<Cmd>CBline<CR>", opts) -- To use in Insert Mode
      -- Marked comments
      keymap({ "n", "v" }, "<Leader>cbm", "<Cmd>CBllbox14<CR>", opts)
      -- Removing a box is simple enough with the command (CBd), but if you
      -- use it a lot:
      keymap({ "n", "v" }, "<Leader>cbd", "<Cmd>CBd<CR>", opts)
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function(_, opts)
      local harpoon = require("harpoon")
      harpoon:setup({})

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end

      vim.keymap.set("n", "<A-f>", function()
        toggle_telescope(harpoon:list())
      end, { desc = "Open harpoon window" })

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end)
      vim.keymap.set("n", "<A-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set("n", "<A-1>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<A-2>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<A-3>", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<A-4>", function()
        harpoon:list():select(4)
      end)
      vim.keymap.set("n", "<A-5>", function()
        harpoon:list():select(5)
      end)
      vim.keymap.set("n", "<A-6>", function()
        harpoon:list():select(6)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-S-P>", function()
        harpoon:list():prev()
      end)
      vim.keymap.set("n", "<C-S-N>", function()
        harpoon:list():next()
      end)
    end,
  },
}
