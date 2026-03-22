<div align="center">

# Rainbow Gruvbox Neovim

**Neovim setup built on LazyVim with deep Gruvbox contrast and full rainbow syntax highlighting.**

![Neovim](https://img.shields.io/badge/Neovim-0.9%2B-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![macOS](https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)

</div>

---

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Quick Install](#quick-install)
- [Phase 1 - The Foundation (LazyVim)](#phase-1---the-foundation-lazyvim)
- [Phase 2 - Theme & Visual Overhaul](#phase-2---theme--visual-overhaul)
- [Phase 3 - Rainbow Syntax Highlighting](#phase-3---rainbow-syntax-highlighting)
- [Phase 4 - VS Code-Style Keymaps](#phase-4---vs-code-style-keymaps)
- [File Structure](#file-structure)
- [Color Reference](#color-reference)
- [Keybind Reference](#keybind-reference)

---

## Features

- **LazyVim base** - blazing-fast startup with lazy plugin loading
- **Gruvbox Hard** - the darkest, highest-contrast Gruvbox mode
- **Rainbow syntax** - every code element has its own distinct color (functions, types, operators, variables)
- **Treesitter-powered** - accurate, grammar-aware highlighting for C, C++, and Lua
- **Integrated terminal** - toggle a bottom terminal without leaving Neovim
- **System clipboard** - `Ctrl+C` / `Ctrl+V` work just like everywhere else
- **Slick tabline** - bufferline with slanted "Glass" separators
- **VS Code muscle memory** - familiar keybinds so the transition is painless
- **Cross-platform** - works on Linux, macOS, and Windows

---

## Requirements

These dependencies are required on **all platforms**:

| Dependency | Version | Notes |
|---|---|---|
| [Neovim](https://neovim.io/) | `>= 0.9` | Core editor |
| [Git](https://git-scm.com/) | Any recent | For cloning and plugin management |
| [Node.js](https://nodejs.org/) | Any LTS | Required by some LSP servers |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Any | Powers fuzzy file search |
| [gcc](https://gcc.gnu.org/) or [clang](https://clang.llvm.org/) | Any | For Treesitter to compile parsers |
| [GitHub CLI (`gh`)](https://cli.github.com/) | Any | For GitHub authentication (optional but recommended) |
| [Nerd Font](https://www.nerdfonts.com/) | Any | Required for icons in the UI, set it as your terminal font |

### Linux (Fedora)

```bash
sudo dnf install neovim git nodejs ripgrep gcc gh
```

For other distros, replace `dnf` with your package manager (`apt`, `pacman`, etc.).

### macOS

The easiest way is with [Homebrew](https://brew.sh/). If you don't have it:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then install everything:

```bash
brew install neovim git node ripgrep gcc gh
```

> **macOS tip:** Use [iTerm2](https://iterm2.com/) or the built-in Terminal with your Nerd Font set as the font for the best experience.

### Windows

The easiest way is with [Scoop](https://scoop.sh/) - open PowerShell and run:

```powershell
# Install Scoop if you don't have it
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# Install everything
scoop install neovim git nodejs ripgrep gcc gh
```

Or with [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/):

```powershell
winget install Neovim.Neovim Git.Git OpenJS.NodeJS BurntSushi.ripgrep.MSVC GitHub.cli
```

> **Windows tip:** Use [Windows Terminal](https://aka.ms/terminal) with your Nerd Font set as the font for the best experience.

---

## Quick Install

### Linux

```bash
# Step 1: Back up any existing Neovim config (safety first!)
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null; true

# Step 2: Clone this repository as your Neovim config
git clone https://github.com/Zyara-1ot/my-neovim-config.git ~/.config/nvim

# Step 3: Open Neovim - it will auto-install all plugins
nvim
```

### macOS

```bash
# Step 1: Back up any existing Neovim config (safety first!)
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null; true

# Step 2: Clone this repository as your Neovim config
git clone https://github.com/Zyara-1ot/my-neovim-config.git ~/.config/nvim

# Step 3: Open Neovim - it will auto-install all plugins
nvim
```

### Windows (PowerShell)

```powershell
# Step 1: Back up any existing Neovim config
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak -ErrorAction SilentlyContinue

# Step 2: Clone this repository as your Neovim config
git clone https://github.com/Zyara-1ot/my-neovim-config.git $env:LOCALAPPDATA\nvim

# Step 3: Open Neovim - it will auto-install all plugins
nvim
```

> On Windows, Neovim config lives at `%LOCALAPPDATA%\nvim` instead of `~/.config/nvim`. Everything **inside** the config folder is identical - only the root location is different.

On first launch on any OS, Lazy.nvim will bootstrap itself and install every plugin automatically. This may take 1-2 minutes. Once done, restart Neovim and everything will be ready.

---

## Phase 1 - The Foundation (LazyVim)

We chose [LazyVim](https://www.lazyvim.org/) as our base because it provides a complete, opinionated Neovim setup with excellent defaults, while still being fully customizable.

### Step 1: Clean up any old config

**Linux / macOS:**
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

**Windows (PowerShell):**
```powershell
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
```

### Step 2: Clone the LazyVim starter template

**Linux / macOS:**
```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
```

**Windows (PowerShell):**
```powershell
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
```

This gives us a ready-to-run Neovim config with Lazy.nvim, sensible defaults, and a clean plugin structure.

### Step 3: Detach from the upstream git

**Linux / macOS:**
```bash
rm -rf ~/.config/nvim/.git
```

**Windows (PowerShell):**
```powershell
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
```

Removing `.git` disconnects this folder from the LazyVim starter's history so you can track your own changes freely.

### Step 4: Initialize your own repo (optional but recommended)

This is identical on all platforms:

```bash
git init
git add .
git commit -m "Initial LazyVim base"
```

---

## Phase 2 - Theme & Visual Overhaul

Everything in this phase is **pure Lua - identical on Linux, macOS, and Windows.**

### 1. Install `gruvbox.nvim`

Create or edit `lua/plugins/themes.lua`:

```lua
return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",  -- "hard" = darkest background, maximum contrast
        transparent_mode = false,
        -- Color overrides are added in Phase 3 below
      })
      vim.o.background = "dark"
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
```

**Why `contrast = "hard"`?** The standard Gruvbox background is `#282828`. Hard contrast drops it to `#1d2021`, making all the text colors pop significantly more - especially useful on bright monitors.

### 2. Set up `bufferline.nvim` (Premium Tabline)

Create or edit `lua/plugins/ui.lua`:

```lua
return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        separator_style = "slant",  -- Slanted "Glass" separators
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
      },
    },
  },
}
```

The `"slant"` separator style gives the tabline a modern, layered look where each tab appears to slide behind the next.

---

## Phase 3 - Rainbow Syntax Highlighting

Standard Neovim highlights most code in white or gray. We force every meaningful part of the code to have its own color, making it easier to read at a glance. **This phase is entirely cross-platform.**

### 1. Configure Treesitter

Treesitter parses code as a proper syntax tree (not just regex), giving us accurate, context-aware highlighting. Edit `lua/plugins/treesitter.lua`:

```lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "vim",
        "vimdoc",
        "python",
        "bash",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    },
  },
}
```

Treesitter compiles parsers using a C compiler. Make sure one is installed:

- **Linux (Fedora):** `sudo dnf install gcc`
- **macOS:** `brew install gcc` (or just install Xcode Command Line Tools: `xcode-select --install`)
- **Windows:** `scoop install gcc` (MinGW)

### 2. Override Colors with the "Rainbow" Palette

In `lua/plugins/themes.lua`, expand your Gruvbox setup to include color mappings:

```lua
require("gruvbox").setup({
  contrast = "hard",
  overrides = {
    -- Functions: bright, eye-catching yellow
    ["@function"]            = { fg = "#fabd2f", bold = true },
    ["@function.call"]       = { fg = "#fabd2f" },
    ["@method"]              = { fg = "#fabd2f", bold = true },
    ["@method.call"]         = { fg = "#fabd2f" },

    -- Operators (+, -, *, =, etc.): punchy orange
    ["@operator"]            = { fg = "#fe8019" },

    -- Variables: warm cream - present but not distracting
    ["@variable"]            = { fg = "#ebdbb2" },
    ["@variable.builtin"]    = { fg = "#ebdbb2", italic = true },

    -- Types (int, double, string, etc.): cool aqua green
    ["@type"]                = { fg = "#8ec07c" },
    ["@type.builtin"]        = { fg = "#8ec07c", italic = true },

    -- Keywords (if, for, while, return): Gruvbox purple
    ["@keyword"]             = { fg = "#d3869b", bold = true },

    -- Strings: muted green so they don't shout
    ["@string"]              = { fg = "#b8bb26" },

    -- Comments: faded, non-intrusive
    ["@comment"]             = { fg = "#928374", italic = true },

    -- Constants & numbers: bright blue
    ["@constant"]            = { fg = "#83a598" },
    ["@number"]              = { fg = "#83a598" },
  },
})
```

### Color Philosophy

Each color was chosen to carry semantic meaning:

| Color | Hex | Used for | Why |
|---|---|---|---|
| Bright Yellow | `#fabd2f` | Functions | The most important thing - should jump out |
| Bright Orange | `#fe8019` | Operators | Active, doing something - energetic |
| Warm Cream | `#ebdbb2` | Variables | Neutral, readable - the "body text" |
| Aqua Green | `#8ec07c` | Types | Cool and distinct from functions |
| Purple | `#d3869b` | Keywords | Structural, memorable |
| Blue | `#83a598` | Constants | Stable, fixed values |

---

## Phase 4 - VS Code-Style Keymaps

Switching from VS Code is painful if your muscle memory keeps firing. These keymaps close that gap. All of this Lua config is **identical on all platforms** - only the clipboard setup has small platform differences.

Create or edit `lua/config/keymaps.lua`:

### 1. Integrated Terminal Toggle

```lua
-- Toggle bottom terminal with Ctrl+\
vim.keymap.set("n", "<C-\\>", function()
  vim.cmd("botright split | terminal")
  vim.cmd("resize 15")  -- Set terminal height to 15 lines
end, { desc = "Toggle bottom terminal" })

-- Resize terminal with Alt+Up / Alt+Down
vim.keymap.set("t", "<A-Up>", "<C-\\><C-n>:resize +2<CR>i", { desc = "Increase terminal height" })
vim.keymap.set("t", "<A-Down>", "<C-\\><C-n>:resize -2<CR>i", { desc = "Decrease terminal height" })

-- Exit terminal mode easily with Escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
```

On Linux/macOS this opens Bash/Zsh. On Windows it opens PowerShell or CMD depending on your default shell - works the same either way.

### 2. System Clipboard (Ctrl+C / Ctrl+V)

The Lua keymaps are identical on all platforms:

```lua
-- Ctrl+C: copy selection to system clipboard (works in visual mode)
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })

-- Ctrl+V: paste from system clipboard (works in normal and insert mode)
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("i", "<C-v>", '<C-r>+', { desc = "Paste from system clipboard (insert)" })
```

Also add this to `lua/config/options.lua` to always sync the clipboard automatically:

```lua
vim.opt.clipboard = "unnamedplus"
```

> **macOS:** Clipboard works out of the box, no extra setup needed.
>
> **Windows:** Clipboard works out of the box, no extra setup needed.
>
> **Linux:** Neovim needs a clipboard provider:
> - X11: `sudo dnf install xclip`
> - Wayland: `sudo dnf install wl-clipboard`

### 3. Tab / Buffer Navigation (Shift+L / Shift+H)

```lua
-- Shift+L: next buffer (like Ctrl+Tab in VS Code)
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })

-- Shift+H: previous buffer (like Ctrl+Shift+Tab in VS Code)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
```

---

## File Structure

The internal folder structure is **identical on all platforms**. Only the root config path differs:

| OS | Config Path |
|---|---|
| Linux | `~/.config/nvim/` |
| macOS | `~/.config/nvim/` |
| Windows | `%LOCALAPPDATA%\nvim\` |

```
nvim/
├── init.lua                   # Entry point - bootstraps Lazy.nvim
├── lua/
│   ├── config/
│   │   ├── autocmds.lua       # Auto commands (e.g., format on save)
│   │   ├── keymaps.lua        # All custom keybindings (Phase 4)
│   │   ├── lazy.lua           # Lazy.nvim setup
│   │   └── options.lua        # Neovim options (line numbers, clipboard, etc.)
│   └── plugins/
│       ├── themes.lua         # Gruvbox + rainbow color overrides (Phase 2 & 3)
│       ├── treesitter.lua     # Treesitter parser config (Phase 3)
│       └── ui.lua             # Bufferline and other UI plugins (Phase 2)
└── README.md                  # This file
```

---

## Color Reference

Full Gruvbox Hard palette used in this config:

| Name | Hex |
|---|---|
| Background (Hard) | `#1d2021` |
| Background | `#282828` |
| Foreground | `#ebdbb2` |
| Bright Yellow | `#fabd2f` |
| Bright Orange | `#fe8019` |
| Aqua Green | `#8ec07c` |
| Purple | `#d3869b` |
| Blue | `#83a598` |
| Green | `#b8bb26` |
| Comment Gray | `#928374` |

---

## Keybind Reference

These shortcuts were specifically added to bridge the gap between Neovim and a modern IDE workflow.

| Category | Shortcut | Mode | Action |
|---|---|---|---|
| Terminal | `Ctrl + \` | Normal | Toggle bottom terminal |
| Terminal | `Alt + Up` | Terminal | Increase terminal height |
| Terminal | `Alt + Down` | Terminal | Decrease terminal height |
| Terminal | `Esc` | Terminal | Exit terminal mode to normal mode |
| Clipboard | `Ctrl + C` | Visual | Copy selection to system clipboard |
| Clipboard | `Ctrl + V` | Normal | Paste from system clipboard |
| Clipboard | `Ctrl + V` | Insert | Paste from system clipboard (Insert mode) |
| Navigation | `Shift + L` | Normal | Switch to the next tab (Buffer) |
| Navigation | `Shift + H` | Normal | Switch to the previous tab (Buffer) |
| Explorer | `<leader>e` | Normal | Toggle Neo-tree (File Explorer) |

---

## Credits

Built on top of these excellent projects:

- [LazyVim](https://www.lazyvim.org/) - Neovim base config
- [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) - Theme
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax parsing
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - Tabline
- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager

---

<div align="center">
Made with love on Fedora Linux - Works on macOS and Windows too
</div>
