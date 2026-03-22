return {
  -- VS Code style tabs (Bufferline)
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "buffers",
        always_show_bufferline = true,
        separator_style = "slant",
        -- This offsets the tabs so they start ONLY where the code starts
        offsets = {
          {
            filetype = "neo-tree",
            text = "EXPLORER",
            text_align = "left",
            separator = true,
          },
        },
        show_buffer_close_icons = true,
        show_close_icon = true,
      },
    },
  },

  -- Fixed Lualine (No more warnings)
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto", -- Tells it to just follow Gruvbox
        globalstatus = true,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
    },
  },

  -- Dashboard & Terminal
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { preset = { header = [[
 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]] } },
      terminal = { win = { position = "bottom", height = 0.4 } },
    },
  },

  -- Transparency
  { "xiyaowong/transparent.nvim", lazy = false },
}
