-- Настройка treesitter
-- все модули отключены по умолчанию, в этом файле активируем необходимые

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	ensure_installed = "all",						-- список имён парсеров, можно выбрать некоторые или все
	sync_install = false,								-- устанавливает парсеры синхронно
	ingore_install = { "phpdoc" },			-- список парсеров которые стоит игнорировать

	autopairs = {
		enable = true,
	},

	autotag = {
		enable = true,
	},

	highlight = {
		enable = true,										-- октлючаем все расширения wtf?
		disable = { "" },									-- список языков которые будут отключены, как отключить смотри доку

		-- Установка этого значения в true приведет к одновременному запуску `:h syntax` и tree-sitter
		-- Установите это значение в `true`, если вы зависите от включения 'syntax' (например, для отступов)
		-- Использование этой опции может замедлить работу редактора, и вы можете увидеть некоторые дублирующие выделения
		-- Вместо true может быть список языков
		additional_vim_regex_highlighting = true,
	},

	-- включаем отступы
	indent = { enable = true, disable = { "yaml" } },

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},

}
