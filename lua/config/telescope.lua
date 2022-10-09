-- Здесь настраиваем telescope, который позволяет искать файлы

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {

	defaults = {
		-- конфигурация по умолчанию для телескопа выполняется здесь

		prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
		
		mappings = {

			-- комбинации клавиш в режиме вставке, Insert mode
			i = {
				-- сопоставления клавиш
				-- здесь описаны те клавиши которыми чаще всего пользуюсь
				-- имеются клавиши по дефолту которые здесь не описаны

				-- следующий элемент в истории поиска 
				["<C-n>"] = actions.cycle_history_next,

				-- предыдущий элемент в истории поиска
        ["<C-p>"] = actions.cycle_history_prev,

				-- двигаемся вниз Ctrl + j
				["<C-j>"] = actions.move_selection_next,

				-- двигаемся вверх Ctrl + k
				["<C-k>"] = actions.move_selection_previous,

				-- закрываем модальное окно поиска Ctrl + c
				["<C-c>"] = actions.close,



				-- подтвердить выбор, Enter
				["<CR>"] = actions.select_default,

				-- открыть найденный файл в горизонтальном режиме Ctrl + x
				["<C-x>"] = actions.select_horizontal,

				-- открыть найденный файл в вертикальном режиме Ctrl + v
				["<C-v>"] = actions.select_vertical,

				-- открыть найденный файл в новом буфере, в новой вкладке, Ctrl + t
				["<C-t>"] = actions.select_tab,

				-- не работают, возможно требуются дополнительные плагины для работы
				--[[ ["<C-u>"] = actions.preview_scrolling_up, ]]
    		--[[ ["<C-d>"] = actions.preview_scrolling_down, ]]

				-- выделяет файл и переключается на следующий, пока не понятно для чего выделение происходит???
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				-- выделяет файл и переключается на предыдущий, пока не понятно для чего выделение происходит???
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

				-- показывает возможные комбинации клавиш Shift + / === Shift + ?
				["<C-/>"] = actions.which_key, 
			},

			-- комбинации клавиш в нормальном режиме, Normal mode
			n = {


				-- закрываем модальное окно поиска Esc
				["<esc>"] = actions.close,
				
				-- подтвердить выбор, Enter
        ["<CR>"] = actions.select_default,

				-- открыть найденный файл в горизонтальном режиме Ctrl + x
        ["<C-x>"] = actions.select_horizontal,

				-- открыть найденный файл в вертикальном режиме Ctrl + v
        ["<C-v>"] = actions.select_vertical,

				-- открыть найденный файл в новом буфере, в новой вкладке, Ctrl + t
        ["<C-t>"] = actions.select_tab,

				-- выделяет файл и переключается на следующий, пока не понятно для чего выделение происходит???
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				-- выделяет файл и переключается на предыдущий, пока не понятно для чего выделение происходит???
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

				-- перемещаемся вниз j
				["j"] = actions.move_selection_next,
				
				-- перемещаемся вверх k
        ["k"] = actions.move_selection_previous,

				-- перемещаемся вверх Shift + h === H
        ["H"] = actions.move_to_top,

				-- перемещаемся в середину Shift + m === M
        ["M"] = actions.move_to_middle,

				-- перемещаемся вниз Shift + l === L
        ["L"] = actions.move_to_bottom,

				-- показывает возможные комбинации клавиш Shift + / === Shift + ?
				["?"] = actions.which_key,
			},
		},

	},

	pickers = {
		-- Конфигурация по умолчанию для встроенных пикеров находится здесь

		-- picker_name = {
    	-- picker_config_key = value,
    	-- ...
    -- }

		-- Теперь ключ picker_config_key будет применяться каждый раз, когда вы вызываете эту функцию
	},

	extensions = {
		-- Конфигурация вашего расширения находится здесь

		-- extension_name = {
    --   extension_config_key = value,
    -- }

		-- пожалуйста, ознакомьтесь с readme расширения, которое вы хотите настроить
	},
}
