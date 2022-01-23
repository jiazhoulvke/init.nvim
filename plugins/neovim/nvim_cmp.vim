" 代码补全

Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-buffer' " nvim-cmp source for buffer words
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lua' " nvim-cmp source for nvim lua
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'neovim/nvim-lspconfig' " Collection of configurations for built-in LSP client

" nvim-cmp: {{{

" 补全菜单高亮 {{{
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
" }}}

lua << EOF
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

-- icons {{{
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}
-- }}}

-- cmp config {{{
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require 'cmp'
cmp.setup {
	formatting = {
		format = function(entry, vim_item)
			local prsnt, lspkind = pcall(require, "lspkind")
			if not prsnt then
				-- Kind icons
				vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
				-- Source
				vim_item.menu = ({
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
					nvim_lua = "[Lua]",
					latex_symbols = "[LaTeX]",
				})[entry.source.name]
				return vim_item
			else
				return lspkind.cmp_format()
			end
		end
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	mapping = {
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<M-p>'] = cmp.mapping.scroll_docs(-4),
		['<M-n>'] = cmp.mapping.scroll_docs(4),
		['<M-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.close(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		['<S-Tab>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = 'orgmode' },
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{
			name = 'buffer',
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end
			}
		},
	},
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources(
		{ { name = 'path' } }, 
		{ { name = 'cmdline' } }
	)
})
-- }}}

-- lsp config {{{
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- on_attach {{{
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	-- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)
	buf_set_keymap('n', '<leader>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end
-- }}}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

-- language servers {{{

-- clangd {{{
-- sudo apt install clangd-12
if vim.fn.executable('clangd') == 1 then
	lspconfig['clangd'].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
	}
end
-- }}}

-- gopls {{{
-- go install golang.org/x/tools/gopls@latest
if vim.fn.executable('gopls') == 1 then
	lspconfig['gopls'].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
	}
end
-- }}}

-- dartls {{{
-- dart-sdk/bin/snapshots/analysis_server.dart.snapshot
if vim.fn.exists('g:dartls_path') == 1 then
	lspconfig['dartls'].setup {
		cmd = {"dart", vim.api.nvim_get_var('dartls_path'), "--lsp"},
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
	}
end
-- }}}

-- intelephense or phpactor {{{
if vim.fn.executable('intelephense') == 1 and vim.fn.exists('g:use_phpactor') == 0 then
	-- npm install -g intelephense
	lspconfig['intelephense'].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
	}
elseif vim.fn.executable('phpactor') then
	-- https://phpactor.readthedocs.io/en/master/usage/standalone.html
	lspconfig['phpactor'].setup{
		cmd = { "phpactor", "language-server" },
		filetypes = { "php" },
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
	}
end
-- }}}

-- sumneko_lua {{{
-- https://github.com/sumneko/lua-language-server/wiki/Precompiled-Binaries
local lua_runtime_path = vim.split(package.path, ';')
table.insert(lua_runtime_path, "lua/?.lua")
table.insert(lua_runtime_path, "lua/?/init.lua")

lspconfig['sumneko_lua'].setup {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = lua_runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			telemetry = {
				enable = false,
			},
		}
	}
}

-- }}}

-- pylsp {{{
-- pipx install 'python-lsp-server[all]'
if vim.fn.executable('pylsp') == 1 then
	lspconfig['pylsp'].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
	}
end
-- }}}

-- vimls {{{
-- npm install -g vim-language-server
if vim.fn.executable('vim-language-server') == 1 then
	lspconfig['vimls'].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
	}
end
-- }}}

-- cmake {{{
-- pip install cmake-language-server
if vim.fn.executable('cmake-language-server') == 1 then
	lspconfig['cmake'].setup {}
end
-- }}}

-- bashls {{{
-- npm install -g vim-language-server
if vim.fn.executable('bash-language-server') == 1 then
	lspconfig['bashls'].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
	}
end
-- }}}

-- vscode-html-language-server for html,css,json {{{
-- npm i -g vscode-langservers-extracted

if vim.fn.executable('vscode-html-language-server') == 1 then
	lspconfig.html.setup{
		capabilities = capabilities,
	}
end

if vim.fn.executable('vscode-css-language-server') == 1 then
	lspconfig.cssls.setup{
		capabilities = capabilities,
	}
end

if vim.fn.executable('vscode-json-language-server') == 1 then
	lspconfig.jsonls.setup{
		capabilities = capabilities,
	}
end
-- }}}

-- }}}

-- }}}

EOF
"" }}}

" vsnip: {{{
let g:vsnip_snippet_dir = $HOME."/.config/nvim/vsnip"
" }}}
