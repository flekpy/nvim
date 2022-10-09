-- Здесь настраиваем строку состояния

local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
	options = {
		icons_enabled = true,															-- включаем отображение иконок
		theme = "everforest",															-- в стиле какой темы будет строка состояния
		section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''},
		disabled_filetypes = {}
	},

	sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{
      'filename',
      file_status = true, 				-- включаем отображение статуса файла (readonly status, modified status)
      path = 0 										-- 0 = просто имя файла, 1 = относительный путь, 2 = абсолютный путь 
    }},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true, 				-- включаем отображение статуса файла (readonly status, modified status)
      path = 1 										-- 0 = просто имя файла, 1 = относительный путь, 2 = абсолютный путь 
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {},
  extensions = {'fugitive'}
}
