-- Настройки всплывающего окна с подсказкой возможных комбинаций клавиш

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true,               	-- показывает список ваших меток, не до конца понял, работает ли???
		registers = true, 						-- показывает ваш режим, NORMAL или INSERT
	},

	window = {
		border = "rounded", 					--none, single, double, shadow
		position = "bottom",					-- позиция снизу
		margin = { 1, 0, 1, 0 },      -- дополнительные отступы [вверх, справа, снизу, слева]
		padding = { 2, 2, 2, 2 }, 		-- дополнительные паддинги [вверх, справа, снизу, слева]
		winblend = 0,
	},
}

local opts = {
	mode = "n",											-- нормальный режим
	prefix = "<leader>",
	buffer = nil,										-- глобальные отображения указывают номер буфера для локальных отображений буфера
	silent = true,									-- использование `silent` при создании комбинаций клавиш
	noremap = true,									-- использование `noremap` при создании комбинаций клавиш
	nowait = true,									-- использование `nowait` при создании комбинаций клавиш
}

local mappings = {
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },

	-- проводник, открывается по клавишие Space + f
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

	-- работа с буферами, закрыть или закрыть все буфферы
	b = {
		name = "Buffer",
		c = { "<Cmd>bd!<Cr>", "Close current buffer" },
		D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
	},

	-- пакер для установки плагинов
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

	-- поиск с помощью Telescope
	s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)
