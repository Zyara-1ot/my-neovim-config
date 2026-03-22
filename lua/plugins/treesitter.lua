return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "cpp", "c", "lua", "bash" },
      highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
}
