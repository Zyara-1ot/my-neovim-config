-- Custom Violetta Highlights
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Search", { bg = "#4b0082", fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "CurSearch", { bg = "#9400d3", fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#3b005f" }) -- Deep violet selection
  end,
})
