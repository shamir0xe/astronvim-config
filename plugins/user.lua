-- TODO: test
-- FIX: test
-- BUG:asd aksd
-- WARNING: skdj asldkaj
-- TEST: asd ajsldkajsd
return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- { "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      search = {
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--hidden",
        },
      },
    },
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      {
        "<leader>T",
        "<cmd>TodoTelescope<cr>",
        desc = "Open TODOs in the Telescope",
      },
    },
    {
      "bignimbus/pop-punk.vim",
    },
    {
      "kartikp10/noctis.nvim",
      dependencies = { "rktjmp/lush.nvim" },
    },
    {
      "dasupradyumna/midnight.nvim",
    },
    {
      "pineapplegiant/spaceduck",
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      opts = {
        flavour = "mocha",
        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
      },
    },
    {
      "evansalter/vim-checklist",
      event = "User AstroFile",
    },
    {
      "mzlogin/vim-markdown-toc",
      cmd = { "GenTocGFM", "GenTocRedcapet", "GenTocGitLab", "GenTocMarked" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- ,
    -- {
    --   "pangloss/vim-javascript",
    --   -- ft = { "javascript", "jsx", "ts" },
    -- },
    -- {
    --   "mxw/vim-jsx",
    --   -- ft = { "javascript", "jsx", "ts" },
    -- },
    -- {
    --   "tyrannicaltoucan/vim-quantum",
    --   -- ft = { "javascript", "jsx", "ts" },
    -- },
  },
}
