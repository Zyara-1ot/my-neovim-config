local map = vim.keymap.set

-- 1. VS Code Style Copy & Paste
-- Copy in visual mode
map("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
-- Paste in normal and visual mode
map({"n", "v"}, "<C-v>", '"+p', { desc = "Paste from system clipboard" })
-- Paste in insert mode
map("i", "<C-v>", '<C-r>+', { desc = "Paste from system clipboard" })

-- 2. Bottom Terminal (Ctrl + \)
-- Opens/Toggles the terminal at the bottom like VS Code
map("n", "<C-\\>", function() 
  Snacks.terminal.toggle(nil, { 
    win = { 
      position = "bottom",
      height = 0.4 
    } 
  }) 
end, { desc = "Toggle Bottom Terminal" })

-- Allow closing the terminal with the same shortcut while inside it
map("t", "<C-\\>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Resize windows using Alt + Arrow Keys
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Also allow resizing from within the terminal
map("t", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase terminal height" })
map("t", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease terminal height" })

-- Theme Switcher (Browse through installed themes)
map("n", "<leader>th", function() Snacks.picker.colorschemes() end, { desc = "Change Theme" })
