require "config.plugins"            -- установка плагинов
require "config.alpha"              -- настроики приветственного окна
require "config.options"            -- базовые настройки neovim
require "config.keymaps"            -- настройка комбинаций клавиш
require "config.whichkey"           -- настройка плагина который показывает возможные комбинации клавиш
require "config.comment"						-- настройка плагина для комментирования строк
require "config.treesitter"					-- настройка treesitter-a, интерфейс для работы с деревьями
require "config.lualine"						-- настройка строки состояния 
require "config.telescope"					-- настройка телескопа, поиск по файлам
require "config.nvim-tree"					-- настройка проводника
require "config.bufferline"					-- буферная строка, вкладки
require "config.cmp"								-- cmp, автодополнения
require "config.autopairs"					-- автопары (), {}, []
require "config.lsp.lspconfig"			-- lspconfig, настройка языковых серверов
require "config.lspkind"						-- пиктограммы для lsp
require "config.lsp.null-ls"				-- null-ls, форматирование, линтинг 
require "config.prettier"						-- красивое форматирование кода prettier
