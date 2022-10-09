-- Здесь настраиваем cmp, автодополнение
-- дефолтный конфиг

local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({

		-- выбираем предыдущий элемент в подсказке Ctrl + k
		["<C-k>"] = cmp.mapping.select_prev_item(),

		-- выбираем следующий элемент в подсказке Ctrl + j
		["<C-j>"] = cmp.mapping.select_next_item(),

		-- пока не понятно как работает
    --[[ ['<C-d>'] = cmp.mapping.scroll_docs(-4), ]]
    --[[ ['<C-f>'] = cmp.mapping.scroll_docs(4), ]]
    --[[ ['<C-Space>'] = cmp.mapping.complete(), ]]


		-- принимать текущий выбранный элемент, Enter
		-- установить select в false, чтобы подтверждать только явно выбранные элементы
		['<CR>'] = cmp.mapping.confirm({ select = true }),


		-- выкл подсказки с автодополнением
    ['<C-e>'] = cmp.mapping.close(),

    --[[ ['<CR>'] = cmp.mapping.confirm({ ]]
    --[[   behavior = cmp.ConfirmBehavior.Replace, ]]
    --[[   select = true ]]
    --[[ }), ]]

  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  }
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

-- " Use <Tab> and <S-Tab> to navigate through popup menu
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
