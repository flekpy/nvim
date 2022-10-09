-- Здесь настраиваем nvim-tree, проводник

-- следующие параметры используются по умолчанию
-- каждая из них документирована в :help nvim-tree.OPTION_NAME

-- изменились настройки, глобальные переменные перенесены в другое место???
--[[ vim.g.nvim_tree_icons = { ]]
--[[   default = "", ]]
--[[   symlink = "", ]]
--[[   git = { ]]
--[[     unstaged = "", ]]
--[[     staged = "S", ]]
--[[     unmerged = "", ]]
--[[     renamed = "➜", ]]
--[[     deleted = "", ]]
--[[     untracked = "U", ]]
--[[     ignored = "◌", ]]
--[[   }, ]]
--[[   folder = { ]]
--[[     default = "", ]]
--[[     open = "", ]]
--[[     empty = "", ]]
--[[     empty_open = "", ]]
--[[     symlink = "", ]]
--[[   }, ]]
--[[ } ]]

-- 0 по умолчанию, включит подсветку файлов для атрибутов git, можно использовать без значков
--[[ vim.g.nvim_tree_git_hl = 1   ]]

-- это значение по умолчанию. смотри больше опций :help имя_опции 
--[[ vim.g.nvim_tree_root_folder_modifier = ':t' ]]

--[[ vim.g.nvim_tree_show_icons = { ]]
--[[   git = 1, ]]
--[[   folders = 1, ]]
--[[   files = 1, ]]
--[[   folder_arrows = 1, -- конфликтует с маркерами отступов рендеринга renderer.indent_markers ]]
--[[ } ]]


local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback
local icons = require "config.icons"
local utils = require "nvim-tree.utils"

---@diagnostic disable-next-line: unused-local
local function notify_level(level)
  return function(msg)
    vim.schedule(function()
      vim.api.nvim_echo({ { msg, "WarningMsg" } }, false, {})
    end)
  end
end

utils.notify.warn = notify_level(vim.log.levels.WARN)
utils.notify.error = notify_level(vim.log.levels.ERROR)
utils.notify.info = notify_level(vim.log.levels.INFO)
utils.notify.debug = notify_level(vim.log.levels.DEBUG)

nvim_tree.setup {
  -- disable_netrw = true,
  -- hijack_netrw = true,
  -- open_on_setup = false,
	
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },

  filters = {
    dotfiles = false,
    custom = { ".git" },
		exclude = { ".gitignore" },
  },

  -- auto_close = true,
  -- open_on_tab = false,
  -- hijack_cursor = false,

  update_cwd = true,

  -- update_to_buf_dir = {
    -- enable = true,
    -- auto_open = true,
  -- },
	
	renderer = {
		add_trailing = false,
		group_empty = false,
  	highlight_git = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":t",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
    	},
		},

		icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },

			 glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = icons.ui.ArrowOpen,
          arrow_closed = icons.ui.ArrowClosed,
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
			},
		},
	},

  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },

  --[[ system_open = { ]]
  --[[   cmd = nil, ]]
  --[[   args = {}, ]]
  --[[ }, ]]
	
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    --height = 30,
    hide_root_folder = false,
    side = "left",
    -- auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },

				-- 
        { key = "h", cb = tree_cb "close_node" },

				-- при нажатии клавиши v выбранный элемент откроется в вертикальном режиме
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
    number = false,
    relativenumber = false,
  },

  --[[ trash = { ]]
  --[[   cmd = "trash", ]]
  --[[   require_confirm = true, ]]
  --[[ }, ]]
	
  -- quit_on_open = 0,
  -- git_hl = 1,
  -- disable_window_picker = 0,
  -- root_folder_modifier = ":t",
  -- show_icons = {
   -- git = 1,
   -- folders = 1,
   -- files = 1,
   -- folder_arrows = 1,
   -- tree_width = 30,
  -- },
}

