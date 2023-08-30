-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local M = {}
M.formatting = astronvim.user_opts("lsp.formatting", { format_on_save = { enabled = false }, disabled = {} })
-- if type(M.formatting.format_on_save) == "boolean" then
--   M.formatting.format_on_save = { enabled = M.formatting.format_on_save }
-- end
M.format_opts = vim.deepcopy(M.formatting)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>bb"] = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
    -- close the current buffer
    ["<leader>x"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>a"] = { '<cmd>echo "0xe\'s space!" <cr>', desc = "0xe" },
    -- format the current buffer
    ["<leader>F"] = {
      function() vim.lsp.buf.format(M.format_opts) end,
      desc = "Format buffer",
    },
    ["<leader><Tab>"] = { "<cmd>b#<cr>", desc = "Previous buffer" },
    ["<leader>;"] = {
      function()
        if vim.bo.filetype == "text" then
          -- for text files do checkbox toggle
          vim.cmd ":ChecklistToggleCheckbox"
        else
          require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
        end
      end,
      desc = "Toggle comment line",
    },

    -- Navigate buffers
    ["<Tab>"] = { "<cmd>bnext<cr>" },
    ["<S-l>"] = { "<cmd>bnext<cr>" },
    ["<S-h>"] = { "<cmd>bprevious<cr>" },

    -- Move text up and down
    -- ["<A-j>"] = { "<cmd>m .+1<CR>==" },
    -- ["<A-k>"] = { "<cmd>m .-2<CR>==" },
    --
    -- hit enter to put blank line
    ["<Enter>"] = { "o<ESC>" },
    ["<S-Enter>"] = { "O<ESC>" },
    -- for the checklist plugin
    ["<leader>c"] = { "<cmd>ChecklistToggleCheckbox<cr>", desc = "Toggle" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    -- for the checklist plugin
    -- ["<leader>ct"] = { "<cmd>ChecklistToggleCheckbox<cr>", desc = "Toggle" },
    -- ["<leader>ce"] = { "<cmd>ChecklistEnableCheckbox<cr>", desc = "Enable" },
    -- ["<leader>cd"] = { "<cmd>ChecklistDisableCheckbox<cr>", desc = "Disable" },
    -- Stay in indent mode
    ["<"] = { "<gv^" },
    [">"] = { ">gv^" },

    -- No stupid paste after yanking
    ["p"] = { '"_dP' },
    -- Move text up and down
    -- ["<A-j>"] = {"<cmd>m '>+1<CR>gv=gv", opts)
    -- keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
    -- keymap("v", "p", '"_dP', opts)
    ["<leader>;"] = {
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      desc = "Toggle comment for selection",
    },
  },
}
