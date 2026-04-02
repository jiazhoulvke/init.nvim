-- helper {{{
local gmap = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
end
local is_mac = vim.fn.has("macunix") == 1
local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
-- }}}

-- 基础配置 {{{
vim.env.LANG = "zh_CN.UTF-8"
vim.env.LC_ALL = "zh_CN.UTF-8"

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.deprecate = function() end -- 屏蔽掉烦人的 api deprecated 提醒

vim.g.ex_terminal = "wezterm"  -- 定义默认的外部终端
-- 如果 windows 下安装了 bash，则使用 bash 作为默认 shell
if is_windows and vim.fn.executable("bash") == 1 then
	vim.o.shell = "bash"
	vim.o.shellcmdflag = "-s -i"
	vim.o.shellxquote = ""
	vim.o.shellquote = ""
	vim.o.shellpipe = "|"
	vim.o.shellredir = ">%s 2>&1"
end
-- }}}

-- 加载本地配置 {{{
local local_ok, local_init = pcall(require, "init_local")
if local_ok and local_init.setup then
	local_init.setup()
end

local status_ok, ts_manager = pcall(require, "utils.ts_manager")
if status_ok then
	ts_manager.setup()
end
-- }}}

-- UI {{{
-- 原生 tabline：仅当前标签页显示完整路径，其他只显示文件名
function _G.my_tabline()
	local tabline = ""
	local total = vim.fn.tabpagenr("$")
	local current_tab = vim.fn.tabpagenr()

	for i = 1, total do
		local winnr = vim.fn.tabpagewinnr(i)
		local bufnr = vim.fn.tabpagebuflist(i)[winnr]
		local bufname = vim.fn.bufname(bufnr)

		local name
		-- 当前 tab 显示完整路径，其他只显示文件名
		if i == current_tab then
			name = vim.fn.fnamemodify(bufname, ":p")
		else
			name = vim.fn.fnamemodify(bufname, ":t")
		end

		-- 空 buffer 处理
		if name == "" then
			name = "[No Name]"
		end

		-- 修改状态
		local modified = vim.bo[bufnr].modified and " ●" or ""

		-- 高亮
		local hl = i == current_tab and "%#TabLineSel#" or "%#TabLine#"

		-- 拼接
		tabline = tabline .. hl .. " " .. i .. " " .. name .. modified .. " "
	end

	return tabline .. "%#TabLineFill#"
end

vim.opt.tabline = "%!v:lua.my_tabline()"
-- }}}

-- lazy.nvim {{{

-- 这里的代理地址可以根据需要更换
local github_mirror = "https://ghfast.top/https://github.com/"

-- 3. Bootstrap lazy.nvim (使用镜像)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		github_mirror .. "folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- }}}

-- 插件列表 {{{
require("lazy").setup({
	git = {
		filter = true,
		timeout = 120,
		url_format = "https://ghfast.top/https://github.com/%s",
	},
	spec = {
		{
			"saghen/blink.compat",
			-- use v2.* for blink.cmp v1.*
			version = "2.*",
			-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
			lazy = true,
			-- make sure to set opts so that lazy.nvim calls blink.compat's setup
			opts = {},
		},
		-- 补全 Blink.cmp {{{
		{
			"saghen/blink.cmp",
			dependencies = {
				"onsails/lspkind.nvim",
				"milanglacier/minuet-ai.nvim",
			},
			-- 国内环境下，lazy 默认 clone 可能会慢，确保 git 配置了镜像
			version = "*",
			-- 关键：如果不安装 cargo，使用预编译的二进制文件
			build = 'echo "Using pre-built binary"',
			opts = {
				keymap = {
					preset = "none", -- 我们自定义映射
					["<CR>"] = { "accept", "fallback" },
					["<Tab>"] = { "select_next", "fallback" },
					["<S-Tab>"] = { "select_prev", "fallback" },
					["<C-j>"] = { "select_next", "fallback" },
					["<C-k>"] = { "select_prev", "fallback" },
				},
				sources = {
					default = {
						"lsp",
						"path",
						"snippets",
						"buffer",
						"avante_commands",
						"avante_mentions",
						"avante_shortcuts",
						"avante_files",
					},
					providers = {
						avante_commands = {
							name = "avante_commands",
							module = "blink.compat.source",
							score_offset = 90, -- show at a higher priority than lsp
							opts = {},
						},
						avante_files = {
							name = "avante_files",
							module = "blink.compat.source",
							score_offset = 100, -- show at a higher priority than lsp
							opts = {},
						},
						avante_mentions = {
							name = "avante_mentions",
							module = "blink.compat.source",
							score_offset = 1000, -- show at a higher priority than lsp
							opts = {},
						},
						avante_shortcuts = {
							name = "avante_shortcuts",
							module = "blink.compat.source",
							score_offset = 1000, -- show at a higher priority than lsp
							opts = {},
						},
					},
				},
				cmdline = {
					enabled = false,
				},
				completion = {
					list = {
						selection = {
							preselect = false,
							auto_insert = true,
						},
					},
					menu = {
						border = "rounded",
						draw = {
							components = {
								kind_icon = {
									text = function(ctx)
										return require("lspkind").symbol_map[ctx.kind] or ""
									end,
								},
							},
						},
					},
					ghost_text = { enabled = true },
					documentation = { auto_show = true, window = { border = "rounded" } },
				},
			},
		},
		-- }}}

		-- conform.nvim 格式化 {{{
		{
			"stevearc/conform.nvim",
			config = function()
				require("conform").setup({
					formatters_by_ft = {
						lua = { "stylua" },
						go = { "goimports", "gofmt" },
					},
					default_format_opts = {
						lsp_format = "fallback",
					},
					format_on_save = {
						lsp_format = "fallback",
						timeout_ms = 500,
					},
				})
			end,
		},
		-- }}}

		-- avante.nvim {{{
		{
			"yetone/avante.nvim",
			build = vim.fn.has("win32") ~= 0 and "pwsh -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
				or "make",
			event = "VeryLazy",
			version = false, -- 永远不要将此值设置为 "*"！永远不要！
			---@module 'avante'
			---@type avante.Config
			opts = {
				input = {
					provider = "snacks",
				},
				selector = {
					provider = "snacks",
					provider_opts = {},
				},
				provider = "opencode",
				acp_providers = {
					["opencode"] = {
						command = "opencode",
						args = { "acp" },
					},
				},
				providers = {
					["llama"] = {
						__inherited_from = "openai",
						endpoint = "http://localhost:1234/v1",
						api_key_name = "LLAMA_API_KEY",
						model = "Qwen3.5",
						-- timeout = 30000, -- Timeout in milliseconds
					},
				},
			},
			dependencies = {
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				"folke/snacks.nvim",
				"nvim-tree/nvim-web-devicons",
				{
					-- 支持图像粘贴
					"HakonHarnes/img-clip.nvim",
					event = "VeryLazy",
					opts = {
						-- 推荐设置
						default = {
							embed_image_as_base64 = false,
							prompt_for_file_name = false,
							drag_and_drop = {
								insert_mode = true,
							},
							-- Windows 用户必需
							use_absolute_path = true,
						},
					},
				},
				{
					-- 如果您有 lazy=true，请确保正确设置
					"MeanderingProgrammer/render-markdown.nvim",
					opts = {
						file_types = { "markdown", "Avante" },
					},
					ft = { "markdown", "Avante" },
				},
			},
		},
		-- }}}

		-- 语法高亮 nvim-treesitter {{{
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				local configs = require("nvim-treesitter")
				configs.setup({
					ensure_installed = { "go", "python", "vim", "lua", "markdown", "javascript", "html", "css" },
					highlight = {
						enable = true,
						additional_vim_regex_highlighting = false,
					},
					indent = { enable = true },
				})
			end,
		},
		-- }}}

		-- 语言相关 {{{

		-- Golang {{{
		{
			"ray-x/go.nvim",
			dependencies = {
				"ray-x/guihua.lua",
			},
			config = function()
				require("go").setup()
			end,
			event = { "CmdlineEnter" },
			ft = { "go", "gomod" },
		},
		-- }}}

		-- Markdown {{{

		-- Markdown 编辑 mkdnflow.nvim {{{
		{
			"jakewvincent/mkdnflow.nvim",
			config = function()
				require("mkdnflow").setup({
					mappings = {
						MkdnToggleToDo = { { "n", "i" }, "<M-t>" },
						-- 禁用默认的缩进
						MkdnIncreaseHeading = false,
						MkdnDecreaseHeading = false,
						MkdnIndentListItem = false,
						MkdnDedentListItem = false,
					},
					on_attach = function(bufnr)
						vim.opt_local.expandtab = true
						vim.opt_local.shiftwidth = 2
						vim.opt_local.tabstop = 2
						vim.opt_local.softtabstop = 2
						vim.opt_local.autoindent = true
						vim.opt_local.smartindent = true

						local function get_current_line_info()
							local line = vim.api.nvim_get_current_line()
							local trimmed = line:gsub("^%s+", "")
							local first_char = trimmed:sub(1, 1)
							return line, trimmed, first_char
						end

						local function smart_tab()
							local _, trimmed, first_char = get_current_line_info()

							if first_char == "#" then
								vim.cmd("MkdnDecreaseHeading")
								return
							end

							local is_list = first_char == "-"
								or first_char == "*"
								or first_char == "+"
								or trimmed:match("^%d+%.")

							if is_list then
								vim.cmd("MkdnIndentListItem")
								return
							end

							vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "i")
						end

						local function smart_shift_tab()
							local _, trimmed, first_char = get_current_line_info()

							if first_char == "#" then
								vim.cmd("MkdnIncreaseHeading")
								return
							end

							local is_list = first_char == "-"
								or first_char == "*"
								or first_char == "+"
								or trimmed:match("^%d+%.")

							if is_list then
								vim.cmd("MkdnDedentListItem")
								return
							end

							vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "i")
						end

						local map = function(mode, lhs, rhs, desc)
							vim.keymap.set(
								mode,
								lhs,
								rhs,
								{ buffer = bufnr, desc = desc, noremap = true, silent = true, nowait = true }
							)
						end
						map({ "i" }, "<Tab>", smart_tab, "")
						map({ "i" }, "<S-Tab>", smart_shift_tab, "")
					end,
				})
			end,
		},
		-- }}}

		-- Markdown 渲染 render-markdown.nvim{{{
		{
			"MeanderingProgrammer/render-markdown.nvim",
			-- @module 'render-markdown'
			-- @type render.md.UserConfig
			opts = {
				heading = {
					enabled = true,
					sign = false,
					-- icons = { 'Ⅰ', 'Ⅱ', 'Ⅲ', 'Ⅳ', 'Ⅴ', 'Ⅵ' },
				},
				code = {
					style = "full",
					border = "thick",
				},
				-- table = {
				--     enabled = true,
				-- },
				checkbox = {
					enabled = true,
				},
			},
		},
		-- }}}

		-- quicknote.vim {{{
		{ "jiazhoulvke/quicknote.vim" },
		-- }}}

		-- }}}

		-- }}}

		-- playground.vim {{{
		{ "jiazhoulvke/playground.vim" },
		-- }}}

		-- dotvim.vim {{{
		{ "jiazhoulvke/dotvim.vim" },
		-- }}}

		-- 跳转 flash.nvim {{{
		{
			"folke/flash.nvim",
			event = "VeryLazy",
			opts = {},
			keys = {
				{
					"s",
					mode = { "n", "x", "o" },
					function()
						require("flash").jump()
					end,
					desc = "Flash",
				},
			},
		},
		-- }}}

		-- 主题 onedarkpro.nvim {{{
		{
			"olimorris/onedarkpro.nvim",
			priority = 1000,
			config = function()
				vim.cmd("colorscheme vaporwave")
			end,
		},
		-- }}}

		-- 改名 inc-rename.nvim {{{
		{ "smjonas/inc-rename.nvim",   opts = {} },
		-- }}}

		-- UI 增强 noice.nvim {{{
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			dependencies = {
				"MunifTanjim/nui.nvim",
				{
					"rcarriga/nvim-notify",
					config = function()
						local function view_notify_history()
							local notify = require("notify")
							local history = notify.history()
							local buf = vim.api.nvim_create_buf(false, true)
							vim.api.nvim_buf_set_name(buf, "Notifications_History")
							vim.bo[buf].filetype = "markdown"
							local lines = {}
							for _, item in ipairs(history) do
								local time = os.date("%H:%M:%S", item.time)
								local level = item.level
								for _, msg_line in ipairs(item.message) do
									table.insert(lines, string.format("[%s] [%s] %s", time, level, msg_line))
								end
							end
							vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
							vim.cmd("vsplit")
							vim.api.nvim_set_current_buf(buf)
						end
						vim.api.nvim_create_user_command("ShowNotifications", view_notify_history, {
							desc = "Show Notifications",
						})
					end,
				},
				"smjonas/inc-rename.nvim", -- 重命名
			},
			opts = {
				lsp = {
					-- 覆盖 LSP 的浮窗，使其更漂亮
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					hover = { enabled = true },
					signature = { enabled = true }, -- 函数参数提示
				},
				messages = {
					enabled = true, -- 启用消息管理器
					view = "notify", -- 默认将所有消息发送到右侧通知栏
				},
				popupmenu = {
					enabled = true, -- 使用 notice 的弹出菜单
					backend = "nui", -- 使用 nui 渲染
				},
				presets = {
					bottom_search = true, -- 搜索栏放在底部，否则默认会显示在上方
					command_palette = true, -- 命令输入框放在中上方
					long_message_to_split = true, -- 长消息自动拆分
					inc_rename = true, -- 是否集成增量重命名
					lsp_doc_border = true, -- 给 LSP 文档加边框
				},
				routes = {
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = " written",
						},
						opts = { skip = true },
					},
				},
			},
		},
		-- }}}

		-- Trouble {{{
		{
			"folke/trouble.nvim",
			opts = {
				height = 8,
			},
		},
		-- }}}

		-- 终端 {{{
		{
			"akinsho/toggleterm.nvim",
			opts = {
				direction = "float",
				float_opts = {
					border = "rounded",
					winblend = 0,
					width = math.floor(vim.o.columns * 0.85),
					height = math.floor(vim.o.lines * 0.8),
				},

				open_mapping = [[<C-\>]],
				hide_numbers = true,
				shade_terminals = false,
				start_in_insert = true,
				insert_mappings = true,
				presist_size = true,
				close_on_exit = true,
				shell = vim.o.shell,
			},
		},
		-- }}}

		-- 状态栏 lualine.nvim {{{
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require("lualine").setup({
					options = {
						theme = "vaporwave", -- 自动匹配你的 One Dark 主题
						component_separators = "|",
						section_separators = "",
					},
				})
			end,
		},
		-- }}}

		-- 文件树 nvim-tree.lua {{{
		{
			"nvim-tree/nvim-tree.lua",
			config = function()
				local function on_attach(bufnr)
					local api = require("nvim-tree.api")

					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						})
					end
					api.map.on_attach.default(bufnr)

					map("n", "h", api.node.navigate.parent_close, "Close Folder")
					map("n", "l", api.node.open.edit, "Open")
					map("n", "<CR>", api.node.open.edit, "Open")
					map("n", "v", api.node.open.vertical, "Vertical Open")
					map("n", "s", api.node.open.horizontal, "Horizontal Open")
					map("n", "x", api.tree.collapse_all, "Collapse All")
					map("n", "q", api.tree.close, "Quit")
					map("n", "?", api.tree.toggle_help, "Help")
				end
				require("nvim-tree").setup({
					sync_root_with_cwd = true,
					respect_buf_cwd = true,
					update_focused_file = {
						enable = true,
						update_root = true,
					},
					on_attach = on_attach,
				})
				gmap("n", "<leader>ee", ":NvimTreeToggle<CR>", "Nvim Tree")
			end,
		},
		-- }}}

		-- 模糊搜索 telescope.nvim {{{
		{
			"nvim-telescope/telescope.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				local actions = require("telescope.actions")
				require("telescope").setup({
					defaults = {
						mappings = {
							i = {
								["<C-j>"] = actions.move_selection_next,
								["<C-k>"] = actions.move_selection_previous,
							},
							n = {
								["<C-j>"] = actions.move_selection_next,
								["<C-k>"] = actions.move_selection_previous,
							},
						},
						sorting_strategy = "ascending", -- 搜索结果从上往下排
						layout_config = {
							horizontal = { prompt_position = "top" }, -- 输入框放顶部
						},
						path_display = { "filename_first" }, -- filename_first,smart,truncate
					},
				})

				local builtin = require("telescope.builtin")
				gmap("n", "<leader>ff", builtin.find_files, "Find files")
				gmap("n", "<leader>fF", "<cmd>Telescope find_files no_ignore=true hidden=true<cr>", "Find all files")
				gmap("n", "<leader>fg", builtin.live_grep, "Live search")
				gmap("n", "<leader>fb", function()
					builtin.buffers({ path_display = { "relative" } })
				end, "Find buffers")
				gmap("n", "<leader>fh", builtin.oldfiles, "Find history files")
			end,
		},
		-- }}}

		-- 批量替换 dyng/ctrlsf.vim {{{
		{
			"dyng/ctrlsf.vim",
			config = function()
				gmap("n", "<leader>fr", "<cmd>CtrlSF ", "multiple replace")
			end,
		},
		-- }}}

		-- 按键映射 which-key.nvim {{{
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
			keys = {
				{
					"<leader>?",
					function()
						require("which-key").show({ global = false })
					end,
					desc = "Buffer Local Keymaps (which-key)",
				},
			},
		},
		-- }}}

		-- 异步运行 asyncrun.vim {{{
		{
			"skywind3000/asyncrun.vim",
			config = function()
				vim.g.asyncrun_open = 6
				vim.g.asyncrun_rootmarks = { ".vim", "go.mod", ".git", ".svn", ".hg" }
			end,
		},
		-- }}}

		-- 编译系统 asynctasks.vim {{{
		{
			"skywind3000/asynctasks.vim",
			dependencies = {
				"skywind3000/asyncrun.vim",
				"nvim-telescope/telescope.nvim",
				"GustavoKatel/telescope-asynctasks.nvim",
			},
			config = function()
				vim.g.asynctasks_config_name = ".tasks.ini"
				vim.g.asynctasks_term_pos = "tab"
				vim.g.asynctasks_term_reuse = 1

				gmap("n", "<leader>ft", "<cmd>Telescope asynctasks all<cr>", "Task List")
			end,
		},
		-- }}}

		-- Git {{{
		{ "lewis6991/gitsigns.nvim",   config = true },
		{ "akinsho/git-conflict.nvim", config = true },
		{
			"NeogitOrg/neogit",
			lazy = true,
			dependencies = {
				"nvim-lua/plenary.nvim", -- required

				-- Only one of these is needed.
				{
					"sindrets/diffview.nvim",
					config = function()
						require("diffview").setup({
							keymaps = {
								view = {
									-- 在 Diff 视图中，使用 Ctrl-j/k 跳转到下一个/上一个改动块
									{ "n", "<C-j>", "j", { desc = "Next hunk" } }, -- 原生 j/k 在 diff 模式通常就是跳 hunk
									{ "n", "<C-k>", "k", { desc = "Prev hunk" } },
								},
								file_panel = {
									-- 在左侧文件列表里，也用 Ctrl-j/k 移动
									{
										"n",
										"<C-j>",
										"j",
										{ desc = "Next file" },
									},
									{
										"n",
										"<C-k>",
										"k",
										{ desc = "Prev file" },
									},
									{
										"n",
										"<CR>",
										require("diffview.config").actions.select_entry,
										{ desc = "Select file" },
									},
								},
							},
						})
					end,
				}, -- optional
				-- "esmuellert/codediff.nvim", -- optional

				-- Only one of these is needed.
				"nvim-telescope/telescope.nvim", -- optional
				-- "nvim-mini/mini.pick",           -- optional
				-- "folke/snacks.nvim",             -- optional
			},
			cmd = "Neogit",
			keys = {
				{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
			},
		},
		-- }}}

		-- 括号自动配对 nvim-autopairs {{{
		{ "windwp/nvim-autopairs",  config = true },
		-- }}}

		-- 标签修改 nvim-ts-autotag {{{
		{ "windwp/nvim-ts-autotag", config = true },
		-- }}}

		-- 交换位置 exchange {{{
		{ "tommcdo/vim-exchange" },
		-- }}}

		-- 保存状态 vim-stay {{{
		{ "zhimsel/vim-stay" },
		-- }}}

		-- 尊重文件原来的缩进格式 sleuth {{{
		{ "tpope/vim-sleuth" },
		-- }}}

		-- Dashboard {{{
		{
			"nvimdev/dashboard-nvim",
			dependencies = {
				{ "nvim-tree/nvim-web-devicons" },
				{
					-- 'ahmedkhalf/project.nvim',
					"jiazhoulvke/project.nvim",
					config = function()
						require("telescope").load_extension("projects")
						require("project_nvim").setup({})
					end,
				},
			},
			event = "VimEnter",
			config = function()
				require("dashboard").setup({
					theme = "hyper",
					config = {
						week_header = {
							enable = true,
						},
						shortcut = {
							{
								icon = " ",
								icon_hl = "@variable",
								desc = "New File",
								group = "Label",
								action = "enew",
								key = "n",
							},
							{
								icon = " ",
								icon_hl = "@variable",
								desc = "Files",
								group = "Label",
								action = "Telescope oldfiles",
								key = "f",
							},
							{
								icon = " ",
								icon_hl = "@variable",
								desc = "Projects",
								group = "Label",
								action = "Telescope projects",
								key = "p",
							},
							{
								icon = " ",
								icon_hl = "@variable",
								desc = "Config",
								group = "Label",
								action = "e $MYVIMRC",
								key = "c",
							},
							{
								icon = "󰅖  ",
								icon_hl = "@variable",
								desc = "Quit",
								group = "Label",
								action = "qa",
								key = "q",
							},
						},
					},
				})
			end,
		},
		-- }}}

		-- surround {{{
		{ "kylechui/nvim-surround", config = true },
		-- }}}

		-- Join {{{
		{ "sk1418/Join",            cmd = "Join" },
		-- }}}

		-- 递增插件 Ctrl-A Ctrl-X {{{
		{
			"monaqa/dial.nvim",
			config = function()
				local augend = require("dial.augend")
				require("dial.config").augends:register_group({
					default = {
						augend.integer.alias.decimal, -- 普通数字
						augend.integer.alias.hex, -- 十六进制 (Go 错误码常用)
						augend.date.alias["%Y/%m/%d"], -- 日期
						augend.constant.alias.bool, -- true <-> false 切换
						-- 自定义 Go 语言循环组
						augend.constant.new({
							elements = { "json", "xml", "yaml" },
							word = true,
							cyclic = true,
						}),
						-- 权限/可见性切换
						augend.constant.new({
							elements = { "public", "private", "protected" },
							word = true,
							cyclic = true,
						}),
						-- Go 常用时间单位切换
						augend.constant.new({
							elements = { "time.Millisecond", "time.Second", "time.Minute", "time.Hour" },
							word = false,
							cyclic = true,
						}),
					},
				})
			end,
			keys = {
				{
					"<C-a>",
					function()
						require("dial.map").manipulate("increment", "normal")
					end,
					mode = "n",
				},
				{
					"<C-x>",
					function()
						require("dial.map").manipulate("decrement", "normal")
					end,
					mode = "n",
				},
				{
					"g<C-a>",
					function()
						require("dial.map").manipulate("increment", "gnormal")
					end,
					mode = "n",
				},
				{
					"<C-a>",
					function()
						require("dial.map").manipulate("increment", "visual")
					end,
					mode = "v",
				},
				{
					"g<C-a>",
					function()
						require("dial.map").manipulate("increment", "gvisual")
					end,
					mode = "v",
				},
			},
		},
		-- }}}

		-- 管理员身份编辑 suda.vim {{{
		{
			"lambdalisue/suda.vim",
		},
		-- }}}

		-- tmux窗口切换 tmux-navigate {{{
		{
			"sunaku/tmux-navigate",
			enabled = not is_windows,
		},
		-- }}}

		-- 列编辑 VisIncr {{{
		{
			"vim-scripts/VisIncr",
		},
		-- }}}
	},
})

-- }}}

-- LSP 服务器配置 {{{

-- servers {{{
local lsp_servers = {
	go = {
		{
			name = "gopls",
			cmd = "gopls", -- install: go install golang.org/x/tools/gopls@latest
			args = { "serve" },
			root_markers = { "go.mod", ".git" },
			auto_format = true,
			settings = {
				gopls = {
					directoryFilters = {
						"-vendor",
					},
					analyses = {
						unusedparams = true,
						shadow = false,
						ST1003 = false,
					},
					staticcheck = true,
					completeUnimported = true, -- 自动补全未导入的包
				},
			},
		},
	},
	c = {
		{
			name = "clangd",
			cmd = "clangd",
			-- clangd 的核心参数
			args = {
				"--background-index", -- 后台索引代码库
				"--clang-tidy",   -- 开启静态分析
				"--completion-style=bundled", -- 补全样式
				"--header-insertion=iwyu", -- 自动引入头文件
				"--fallback-style=google", -- 格式化降级方案
				"-j=4",           -- 限制线程数防止卡顿
			},
			root_markers = { ".git", "compile_commands.json", "CMakeLists.txt" },
		},
	},
	cpp = {
		{
			name = "clangd",
			cmd = "clangd",
			-- clangd 的核心参数
			args = {
				"--background-index", -- 后台索引代码库
				"--clang-tidy",   -- 开启静态分析
				"--completion-style=bundled", -- 补全样式
				"--header-insertion=iwyu", -- 自动引入头文件
				"--fallback-style=google", -- 格式化降级方案
				"-j=4",           -- 限制线程数防止卡顿
			},
			root_markers = { ".git", "compile_commands.json", "CMakeLists.txt" },
		},
	},
	python = {
		{
			name = "pyright",
			cmd = "pyright-langserver",
			args = { "--stdio" },
			root_markers = { "pyrightconfig.json", "setup.py", "requirements.txt", ".git" },
			settings = {
				python = {
					analysis = { autoSearchPaths = true, useLibraryCodeForTypes = true },
				},
			},
		},
	},
	javascript = {
		{
			name = "vtsls",
			cmd = "vtsls", -- install: npm install -g vtsls @vue/language-server vscode-langservers-extracted
			args = { "--stdio" },
			root_markers = { "package.json", ".git" },
		},
		{
			name = "typescript-language-server",
			cmd = "typescript-language-server",
			args = { "--stdio" },
			root_markers = { "package.json", "tsconfig.json" },
		},
	},
	typescript = {
		{
			name = "vtsls",
			cmd = "vtsls",
			args = { "--stdio" },
			root_markers = { "package.json", "tsconfig.json", ".git" },
		},
	},
	vue = {
		{
			name = "volar",
			cmd = "vue-language-server",
			args = { "--stdio" },
			root_markers = { "package.json", "tsconfig.json" },
		},
	},
	javascriptreact = {
		{ name = "vtsls", cmd = "vtsls", args = { "--stdio" }, root_markers = { "package.json", ".git" } },
	},
	typescriptreact = {
		{ name = "vtsls", cmd = "vtsls", args = { "--stdio" }, root_markers = { "package.json", ".git" } },
	},
	html = {
		{
			name = "html-ls",
			cmd = "html-languageserver",
			args = { "--stdio" },
			root_markers = { "index.html", "package.json" },
		},
	},
	css = {
		{ name = "css-ls", cmd = "css-languageserver", args = { "--stdio" }, root_markers = { "package.json" } },
	},
	markdown = {
		{
			name = "marksman",
			cmd = "marksman",
			root_markers = { ".git", ".marksman.toml" },
		},
	},
	xml = {
		{ name = "lemminx", cmd = "lemminx", root_markers = { "pom.xml", ".git" } },
	},
	vim = {
		{
			name = "vim-ls",
			cmd = "vim-language-server", -- install: npm install -g vim-language-server
			args = { "--stdio" },
			root_markers = { ".git" },
		},
	},
	lua = {
		{
			name = "lua-ls",
			cmd = "lua-language-server", -- install: https://github.com/LuaLS/lua-language-server/releases
			root_markers = { ".luarc.json", ".luarc.jsonc", ".git", "init.lua" },
			auto_format = true,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					completion = {
						callSnippet = "Replace",
					},
					diagnostics = {
						enable = true,
						-- 识别 Neovim 的全局变量 vim
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true), -- 加载 runtime 文件
						-- library = {}, -- 不加载第三方库
						checkThirdParty = false,
						maxReload = 500,
						preloadFileSize = 50,
						ignoreDir = {
							"node_modules",
							"dist",
							"build",
							"target",
							".git",
							"lazy-lock.json",
						},
					},
					hint = { enable = false },
					telemetry = { enable = false },
				},
			},
		},
	},
}
-- }}}

-- 自动化启动逻辑与 On_Attach

vim.diagnostic.config({
	virtual_text = { prefix = "●" },
	severiry_sort = true,
	float = { border = "rounded", source = true },
})

local function on_attach(client, bufnr, conf)
	local map = function(mode, lhs, rhs, desc)
		if rhs then
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
		end
	end

	map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
	map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
	-- map('n', '<leader>rn', vim.lsp.buf.rename, "Rename Symbol")
	map("n", "<leader>rn", ":IncRename ", "Rename Symbol")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")

	-- 查看诊断信息
	map("n", "ge", vim.diagnostic.open_float, "Show Diagnostic")
	map("n", "[d", vim.diagnostic.got_prev, "Go to Prev Diagnostic")
	map("n", "]d", vim.diagnostic.got_next, "Go to Next Diagnostic")

	if conf and conf.auto_format then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				-- local buf_filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr })
				vim.lsp.buf.format({
					bufnr = bufnr,
					async = false,
					timeout_ms = 2000,
				})
			end,
		})
	end
end

-- 核心启动器
local function try_start_lsp(ft)
	local configs = lsp_servers[ft]
	if not configs then
		return
	end

	for _, conf in ipairs(configs) do
		if vim.fn.executable(conf.cmd) == 1 then
			local caps = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.start({
				name = conf.name,
				cmd = vim.list_extend({ conf.cmd }, conf.args or {}),
				root_dir = vim.fs.root(0, conf.root_markers),
				capabilities = caps,
				on_attach = function(client, bufnr)
					on_attach(client, bufnr, conf)
				end,
				on_new_config = function(config, root_dir)
					local venv = root_dir .. "/venv"
					if vim.fn.isdirectory(venv) == 1 then
						config.settings.python.pythonPath = venv .. "/bin/python"
					end
				end,
				settings = conf.settings,
			})
			return true -- 成功启动一个就停止
		end
	end
end

-- 绑定事件
vim.api.nvim_create_autocmd("FileType", {
	pattern = vim.tbl_keys(lsp_servers),
	callback = function(args)
		try_start_lsp(args.match)
	end,
})
-- }}}

-- 按键映射 {{{

-- 剪贴板 {{{
gmap("v", "<C-c>", '"+y', "copy to system clipboard")
gmap("v", "<C-x>", '"+x', "cut to system clipboard")
gmap("v", "<C-v>", '"+gp', "paste system clipboard")
gmap("c", "<C-v>", "<C-r>+", "paste system clipboard")
gmap("i", "<C-v>", "<C-r>+", "paste system clipboard")
gmap("i", "<C-S-v>", "<cmd>set paste<cr><C-r>+<cmd>set nopaste<cr>", "paste system clipboard preserving formatting")
-- }}}

-- 编辑 {{{
gmap("i", "<C-k>", "<C-o>D", "delete to end of line")
gmap("i", "<C-S-k>", "<C-o>dd", "delete current line")
gmap("n", "<Tab>", "v>", "indent")
gmap("n", "<S-Tab>", "v<", "dedent")
gmap("n", "<leader><leader>", "<cmd>nohlsearch<cr>", "nohlsearch")
-- }}}

-- 浏览 {{{
gmap("n", "<M-d>", "<C-f>zz", "Page Down")
gmap("n", "<M-e>", "<C-b>zz", "Page Up")
-- }}}

-- 文件操作 {{{
gmap({ "n", "i" }, "<A-s>", "<cmd>update<cr>", "Save")
gmap({ "n", "i" }, "<A-c>", "<cmd>close<cr>", "Close")
gmap({ "n", "i" }, "<A-q>", "<cmd>conf qa<cr>", "Quit")
gmap({ "n" }, "<leader>Cc", "<cmd>edit $MYVIMRC<cr>", "Edit $MYVIMRC")
-- }}}

-- Buffer {{{
-- 进入当前buffer所在目录
gmap("n", "<leader>cd", "<cmd>cd %:p:h<cr>", "enter current buffer folder")
-- 复制当前buffer的完整路径到剪贴板
gmap("n", "<C-c>", '<cmd>:let @+=expand("%:p")<cr>', "copy buffer full path to system clipboard")
-- 删除 ^M
gmap("n", "<leader>xm", "<cmd>:%s/\\r$//<cr>", "remove ^M")
-- 删除空行
gmap("n", "<leader>xbl", "<cmd>:g/^\\s*$/d<cr>", "remove blank lines")
-- 在资源管理器中打开当前文件
-- 打开系统文件管理器，并智能选中当前文件（无文件则打开 cwd）
local function open_file_manager_with_selection()
	local file = vim.fn.expand("%:p")

	-- 判断当前 buffer 是否有有效文件路径
	local has_valid_file = file ~= "" and vim.fn.filereadable(file) == 1

	if is_windows then
		if has_valid_file then
			-- Windows: 打开并选中当前文件
			vim.fn.system(string.format("start explorer /select,%s", file))
		else
			-- 无文件: 打开当前工作目录
			vim.fn.system("start explorer .")
		end
	elseif is_mac then
		if has_valid_file then
			vim.fn.system(string.format("open -R %s", file))
		else
			vim.fn.system("open .")
		end
	else
		-- Linux 无法选中文件，只打开目录
		local dir = has_valid_file and vim.fn.expand("%:p:h") or "."
		vim.fn.system(string.format("xdg-open %s", dir))
	end
end

gmap("n", "<leader>eo", open_file_manager_with_selection, "View file in file manager")
gmap("n", "<leader>et", function()
	if vim.fn.executable(vim.g.ex_terminal) == 0 then
		return
	end
	if vim.g.ex_terminal == "wezterm" then
		vim.fn.jobstart({ vim.g.ex_terminal, "start", "--cwd", vim.fn.getcwd(0) })
	end
end, "Open external terminal")
-- }}}

-- 窗口 {{{
gmap({ "n", "i" }, "<M-h>", "<C-w>h", "goto left window")
gmap({ "n", "i" }, "<M-l>", "<C-w>l", "goto right window")
gmap({ "n", "i" }, "<M-k>", "<C-w>k", "goto up window")
gmap({ "n", "i" }, "<M-j>", "<C-w>j", "goto down window")
-- }}}

-- 标签 {{{
gmap("n", "<leader>1", "1gt", "goto tab 1")
gmap("n", "<leader>2", "2gt", "goto tab 2")
gmap("n", "<leader>3", "3gt", "goto tab 3")
gmap("n", "<leader>4", "4gt", "goto tab 4")
gmap("n", "<leader>5", "5gt", "goto tab 5")
gmap("n", "<leader>6", "6gt", "goto tab 6")
gmap("n", "<leader>7", "7gt", "goto tab 7")
gmap("n", "<leader>8", "8gt", "goto tab 8")
gmap("n", "<leader>9", "9gt", "goto tab 9")
gmap("n", "<leader>0", "10gt", "goto tab 10")
-- }}}

gmap("n", "<leader>gh", "<cmd>Dashboard<cr>", "Dashboard")

-- }}}

-- vim: foldmethod=marker tabstop=2 shiftwidth=2
