-- Здесь устанавливаем новые плагины

local fn = vim.fn

-- Автоматическая установка пакера === packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP =fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "После установки пакера закройте neovim и откройте снова"
  vim.cmd [[packadd packer.nvim]]
end

-- Автокоманда перезагружающая neovim при каждом сохранении файла plugins.lua
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Защищенный вызов, чтобы не возникало ошибок при первом использовании
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Заставляем packer использовать всплывающее модальное окно
--  не уверен что оно правильно отрабывает, нужно протестировать
packer.init {
	profile = {
		enable = true,
		threshold = 0, -- кол-во в милисекундах, которое должно пройти время загрузки плагина, чтобы он был включен в профиль
	},

  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Здесь устанавливаем свои плагины 
return packer.startup(function(use)

	-- установщик/менеджер плагинов/пакетов
  use "wbthomason/packer.nvim"

	-- полезные функции lua используемы многими плагинами
	use "nvim-lua/plenary.nvim"

	-- приветственное окно
	use "goolord/alpha-nvim"

	-- показывает модальное окно с возможными комбинациями клавиш
	use "folke/which-key.nvim"

	-- плагин для Гита
	use "lewis6991/gitsigns.nvim"

	-- Indent line, вертикальные линии, отступы строки
	use "lukas-reineke/indent-blankline.nvim"

	-- позволяет легко делать комментарии в коде
	use "numToStr/Comment.nvim"

	-- установка коммента в зависимости от положения курсора
	-- местоположение проверяется с помощью запросов к деревьям
	-- в зависимости требует treesitter
	use "JoosepAlviste/nvim-ts-context-commentstring"

	-- Treesitter, может построить конкретное синтаксическое дерево для исходного файла 
	-- и эффективно обновлять синтаксическое дерево по мере редактирования исходного файла
	-- :TSUpdate === обновляем все парсеры
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}

	-- строка состояния
	use "nvim-lualine/lualine.nvim"

	-- Telescope, нечеткий поиск по спискам, в зависимости нужен nvim-plenary
	use "nvim-telescope/telescope.nvim"

	-- Nvim-tree, проводник, для отображения иконок может потребоваться nvim-web-devicons
	use "kyazdani42/nvim-tree.lua"

	-- буферная строка с интеграцией вкладок
	use "akinsho/bufferline.nvim"

	-- плагин автодополнения, исходники автодополнения устанавливаются из внешних репозиториев
	use "hrsh7th/nvim-cmp"
	-- источник nvim-cmp для буферных слов
	use "hrsh7th/cmp-buffer"
	-- use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"

	-- поддерживает больше типов на автодополнения
	use "hrsh7th/cmp-nvim-lsp"

	-- автопары (), {}, [], "", '', интегрируется с cmp так и с treesitter
	use "windwp/nvim-autopairs"

	-- ts-autotag автозакрытие/переименование тегов html, tsx
	use "windwp/nvim-ts-autotag"

	-- prettier красиво форматирование кода, встроенный клиент LSP
	use "MunifTanjim/prettier.nvim"

	-- LSP
	-- nvim-lspconfig обеспечивает общую конфигурацию для различных языковых серверов
	use "neovim/nvim-lspconfig"

	-- lsp-saga поддерживает команды lspsaga с завершением или использование
	use "glepnir/lspsaga.nvim"
	-- LSP

	-- null-ls упрощает процесс создания, совместного использования и настройки источников LSP
	use "jose-elias-alvarez/null-ls.nvim"

	-- lspkind добавляет пиктограммы, похожие на vscode, во встроенный lsp neovim
	-- не требует настройки
	use "onsails/lspkind-nvim"

	-- luasnip добавляет сниппеты, снипеттный движок
	use "L3MON4D3/LuaSnip"

  -- Цветовые темы, Colorscheme
  use {
    --[[ "sainnhe/everforest", ]]
		"doums/darcula",
    config = function()
      vim.cmd "colorscheme darcula"
    end,
  }

	-- Ленивая загрузка с использованием события event
	-- чтобы проверить статус загрузки плагина можно вбить комманду :PackerStatus
	-- nvim-web-devicons плагин предоставляет иконки + цвета
	use {
		"kyazdani42/nvim-web-devicons",
		module = "nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup { default = true }
		end,
	}
	-- Ленивая загрузка с использованием событий event

-- Автоматическая установка конфигурации после клонирования packer-a
-- Поместить в конец, после всех плагинов
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

