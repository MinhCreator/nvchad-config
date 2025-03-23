# 💤 Lazy Code Ver2
This my config LazyVim and I call that "Lazy Code version 2". If you refer original repo, you should checkout to nvchad webpage

<a href="https://dotfyle.com/MinhCreator/nvchad-config"><img src="https://dotfyle.com/MinhCreator/nvchad-config/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/MinhCreator/nvchad-config"><img src="https://dotfyle.com/MinhCreator/nvchad-config/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/MinhCreator/nvchad-config"><img src="https://dotfyle.com/MinhCreator/nvchad-config/badges/plugin-manager?style=flat" /></a>
---

## Original Repo
A starter template for [nvchad](https://nvchad.com/).
Refer to the [documentation](https://nvchad.com/docs/quickstart/install) to get started.

## ⚡️ Requirements

- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional)_**
- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- NodeJs to using npm this dependencies for [Mason.nvim](https://github.com/williamboman/mason.nvim) **_(optional)_**
- [fd](https://github.com/sharkdp/fd) for snacks plugin **_(optional)_**
- [Ripgrep](https://github.com/BurntSushi/ripgrep) is required for grep searching with Telescope **_(OPTIONAL)_**.
- GCC, Windows users must have [mingw](http://mingw-w64.org/downloads) installed and set on path.
- Make, Windows users must have [GnuWin32](https://sourceforge.net/projects/gnuwin32) installed and set on path.
# 🛠️ Installation

Install the [Lazy Code](https://github.com/MinhCreator/nvchad-config)

- For Linux/MacOS
- Make a backup of your current Neovim files:

  ```sh
  # required
  mv ~/.config/nvim{,.bak}

  # optional but recommended
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}
  ```

- Clone the starter

  ```sh
  git clone https://github.com/MinhCreator/nvchad-config ~/.config/nvim
  ```

- Remove the `.git` folder, so you can add it to your own repo later

  ```sh
  rm -rf ~/.config/nvim/.git
  ```

- Start Neovim!

  ```sh
  nvim
  ```

  Refer to the comments in the files on how to customize **Lazy Code**.


-
	Install the [Lazy Code](https://github.com/MinhCreator/nvchad-config)  for Windows via using [PowerShell](https://github.com/PowerShell/PowerShell)

- Make a backup of your current Neovim files:

  ```powershell
  # required
  Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

  # optional but recommended
  Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
  ```

- Clone the starter

  ```powershell
  git clone https://github.com/MinhCreator/nvchad-config $env:LOCALAPPDATA\nvim
  ```

- Remove the `.git` folder, so you can add it to your own repo later

  ```powershell
  Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
  ```

- Start Neovim!

  ```powershell
  nvim
  ```

  Refer to the comments in the files on how to customize **Lazy Code**.





	```sh
	docker run -w /root -it --rm alpine:edge sh -uelic '
	apk add git lazygit neovim ripgrep alpine-sdk --update
    git clone	https://github.com/MinhCreator/nvchad-config ~/.config/nvim
    cd ~/.config/nvim
	nvim'

	```	
	**Tip**:
		It is recommended to run `:LazyHealth` after installation.
		This will load all plugins and check if everything is working correctly.
## Plugins

### bars-and-lines

+ [utilyre/barbecue.nvim](https://dotfyle.com/plugins/utilyre/barbecue.nvim)
+ [SmiteshP/nvim-navic](https://dotfyle.com/plugins/SmiteshP/nvim-navic)
### code-runner

+ [Zeioth/compiler.nvim](https://dotfyle.com/plugins/Zeioth/compiler.nvim)
+ [stevearc/overseer.nvim](https://dotfyle.com/plugins/stevearc/overseer.nvim)
### color

+ [folke/twilight.nvim](https://dotfyle.com/plugins/folke/twilight.nvim)
### comment

+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
### completion

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### editing-support

+ [folke/snacks.nvim](https://dotfyle.com/plugins/folke/snacks.nvim)
### file-explorer

+ [nvim-tree/nvim-tree.lua](https://dotfyle.com/plugins/nvim-tree/nvim-tree.lua)
### formatting

+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### icon

+ [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
### lsp

+ [simrat39/symbols-outline.nvim](https://dotfyle.com/plugins/simrat39/symbols-outline.nvim)
+ [hedyhli/outline.nvim](https://dotfyle.com/plugins/hedyhli/outline.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### nvim-dev

+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### preconfigured

+ [LazyVim/LazyVim](https://dotfyle.com/plugins/LazyVim/LazyVim)
### session

+ [folke/persistence.nvim](https://dotfyle.com/plugins/folke/persistence.nvim)
### startup

+ [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### tabline

+ [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)
### utility

+ [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)
+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
+ [NvChad/ui](https://dotfyle.com/plugins/NvChad/ui)
+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
## Language Servers

+ cssls
+ emmet_ls
+ gdscript
+ html
+ lua_ls
+ pyright
