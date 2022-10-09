-- Настраиваем комбинации клавиш

local opts = { noremap = true, silent = true }

-- короткое название функции
local keymap = vim.api.nvim_set_keymap

-- переназначаем пробел в качестве ведущей клавиши
keymap("", "<Space>", "<Nop>", opts)

-- глобально ставим лидер клавишу в виде пробела
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Сохраняем файл по нажатию клавиш Ctrl + s
keymap("n", "<C-s>", ":w<CR>", opts)


-- Normal mode, Нормальный режим --
-- Навигация по буферам, Shift + l или Shift + h
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Перемещение текста вверх или вниз, не работает так как конфликтует с клавишей alt, нужно переназначить
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- при нажатии ESC, отменяем выделение текста после поиска
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)


-- Insert mode, Режим вставки --
-- возврат в нормальный режим по нажатию клавиш j + k
keymap("i", "jk", "<ESC>", opts)


-- Visual, визуальный режим --
-- перемещение выделенного текста вверх или вниз
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- остаёмся в режиме отступа
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
