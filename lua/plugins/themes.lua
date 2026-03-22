return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        palette_overrides = {
          bright_red = "#fb4934",
          bright_green = "#b8bb26",
          bright_yellow = "#fabd2f",
          bright_blue = "#83a598",
          bright_purple = "#d3869b",
          bright_aqua = "#8ec07c",
          bright_orange = "#fe8019",
          neutral_orange = "#d65d0e",
        },
        overrides = {
          -- This makes the actual code words colorful
          ["@variable"] = { fg = "#ebdbb2" },
          ["@function.call"] = { fg = "#fabd2f", bold = true },
          ["@operator"] = { fg = "#fe8019" }, -- Makes + - * / orange
          ["@keyword"] = { fg = "#fb4934", bold = true }, -- Makes 'int', 'return' red
          ["@constant"] = { fg = "#d3869b" }, -- Purple constants
          ["@type"] = { fg = "#8ec07c", bold = true }, -- Aqua types
          ["@parameter"] = { fg = "#83a598" }, -- Blue parameters
        },
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
