-- treesitter parsers 手动管理
local M = {}

local fn = vim.fn
local api = vim.api

-- 获取 parsers.lua 路径
function M.get_pasers_lua_path()
    local paths = {
        fn.stdpath("data") .. "/lazy/nvim-treesitter/lua/nvim-treesitter/parsers.lua",
        fn.stdpath("config") .. "/lazy/nvim-treesitter/lua/nvim-treesitter/parsers.lua",
    }
    for _, path in ipairs(paths) do
        path = vim.fs.normalize(path)
        if fn.filereadable(path) == 1 then
            return path
        end
    end
    error("未找到 nvim-treesitter/parsers.lua，请确认插件已安装")
end

-- 获取平台信息
local function get_platform()
    local is_win = fn.has("win32") == 1
    return {
        is_win = is_win,
        ext = is_win and ".dll" or ".so",
        -- 基础编译器，后续会根据文件类型动态调整
        default_compiler = (fn.has("macunix") == 1) and "clang" or "gcc",
    }
end

--- 编译单个语言
-- local function compile_one(lang)
--     lang = lang:lower():gsub("%s+", "")
--
--     local parsers_path = M.get_pasers_lua_path()
--     local parsers = dofile(parsers_path)
--     local info = parsers[lang]
--
--     if not info or not info.install_info then
--         vim.notify("parsers.lua 中未找到语言: " .. lang, vim.log.levels.ERROR)
--         return
--     end
--
--     local install_info = info.install_info
--     local url = install_info.url
--     -- 某些库可能没有指定 revision
--     local revision = install_info.revision
--
--     -- 工作目录
--     local repo_dir = vim.fs.normalize(fn.stdpath("cache") .. "/ts-parsers/" .. lang)
--     local target_dir = vim.fs.normalize(fn.stdpath("data") .. "/site/parser")
--     fn.mkdir(repo_dir, "p")
--     fn.mkdir(target_dir, "p")
--
--     -- ==================== Git 操作 ====================
--     local is_git_repo = fn.isdirectory(repo_dir .. '/.git') == 1
--
--     -- 健壮性检查：如果文件夹存在但不是 git 仓库，强制删除重建
--     if fn.isdirectory(repo_dir) == 1 and not is_git_repo then
--         fn.delete(repo_dir, "rf")
--         fn.mkdir(repo_dir, "p")
--     end
--
--     local git_cmd
--     if not is_git_repo then
--         git_cmd = { "git", "clone", "--depth", "1", url, repo_dir }
--     else
--         git_cmd = { "git", "-C", repo_dir, "fetch", "--depth", "1" }
--     end
--
--     vim.notify("正在获取 " .. lang .. " 源码...", vim.log.levels.INFO)
--     local git_obj = vim.system(git_cmd, { text = true }):wait()
--
--     if git_obj.code ~= 0 then
--         vim.notify("Git 操作失败: " .. (git_obj.stderr or ""), vim.log.levels.ERROR)
--         return
--     end
--
--     -- 如果有特定版本要求
--     if revision then
--         vim.system({ "git", "-C", repo_dir, "checkout", revision }):wait()
--     end
--
--     -- ==================== 生成源码 (如果需要) ====================
--     if install_info.generate then
--         if fn.executable('tree-sitter') == 1 then
--             vim.system({ "tree-sitter", "generate" }, { cwd = repo_dir }):wait()
--         else
--             vim.notify("需执行 generate 但未找到 tree-sitter CLI", vim.log.levels.WARN)
--         end
--     end
--
--     -- ==================== 编译准备 ====================
--     local platform = get_platform()
--     local output = target_dir .. "/" .. lang .. platform.ext
--     local compiler = platform.default_compiler
--
--     -- 收集待编译文件
--     local compile_files = {}
--     -- 1. 添加主要的 parser.c (通常在 info.files 中定义)
--     local info_files = install_info.files or { "src/parser.c" }
--     for _, f in ipairs(info_files) do
--         table.insert(compile_files, repo_dir .. "/" .. f)
--     end
--
--     -- 2. 自动检测外部扫描器 (解决 Rust 等语言的 undefined reference 报错)
--     local scanner_c = repo_dir .. "/src/scanner.c"
--     local scanner_cc = repo_dir .. "/src/scanner.cc"
--
--     if fn.filereadable(scanner_c) == 1 then
--         table.insert(compile_files, scanner_c)
--     elseif fn.filereadable(scanner_cc) == 1 then
--         table.insert(compile_files, scanner_cc)
--         -- 发现 C++ 扫描器，切换到 g++ / clang++
--         compiler = (platform.default_compiler == "gcc") and "g++" or "clang++"
--     end
--
--     -- ==================== 执行编译 ====================
--     vim.notify("正在编译 " .. lang .. " parser...", vim.log.levels.INFO)
--
--     local compile_args = {
--         compiler,
--         "-shared",
--         "-Os",
--         "-I" .. repo_dir .. "/src",
--         "-fPIC",
--     }
--
--     -- Windows 特有参数优化
--     if platform.is_win then
--         table.insert(compile_args, "-Wl,--copy-dt-needed-entries")
--     end
--
--     -- 合并待编译文件和输出路径
--     for _, f in ipairs(compile_files) do table.insert(compile_args, f) end
--     table.insert(compile_args, "-o")
--     table.insert(compile_args, output)
--
--     local compile_obj = vim.system(compile_args, { text = true }):wait()
--
--     if compile_obj.code ~= 0 then
--         vim.notify("编译 " .. lang .. " 失败！\n" .. (compile_obj.stderr or ""), vim.log.levels.ERROR)
--     else
--         vim.notify("✅ 编译成功: " .. lang .. platform.ext, vim.log.levels.INFO)
--         -- 尝试立即注册（即使不重启也能生效）
--         vim.treesitter.language.register(lang, lang)
--     end
-- end
--
-- -- 命令入口
-- function M.compile(args)
--     local langs = vim.split(args.args or "", "%s+", { trimempty = true })
--     if #langs == 0 then
--         vim.notify("用法: :TSCompile <lang1> [lang2] ...", vim.log.levels.WARN)
--         return
--     end
--
--     for _, lang in ipairs(langs) do
--         local ok, err = pcall(compile_one, lang)
--         if not ok then
--             vim.notify("编译 " .. lang .. " 时发生致命错误: " .. tostring(err), vim.log.levels.ERROR)
--         end
--     end
-- end

M.setup = function()
    local parser_root = vim.fs.normalize(fn.stdpath("data") .. "/site/parser")

    if fn.isdirectory(parser_root) == 0 then return end

    local installed_languages = {}
    local files = fn.readdir(parser_root)

    for _, file in ipairs(files) do
        -- 兼容 .so 和 .dll 的匹配逻辑
        local lang = file:match("([^%.]+)%.dll$") or file:match("([^%.]+)%.so$")
        if lang then
            -- print('language ' .. lang .. ' loaded')
            table.insert(installed_languages, lang)
            vim.treesitter.language.register(lang, lang)
        end
    end

    if #installed_languages > 0 then 
        -- 创建自动命令组，防止重复加载
        local group = api.nvim_create_augroup("TSManagerGroup", { clear = true })
        api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = installed_languages,
            callback = function()
                local ok, _ = pcall(vim.treesitter.start)
                if not ok then return end

                vim.wo.foldmethod = "expr"
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo.foldlevel = 99
            end,
        })
    end

    -- 创建命令用于编译 parser
    -- vim.api.nvim_create_user_command('TSCompile', M.compile, {
    --     nargs = "+",
    --     complete = function()
    --         local parsers = dofile(require('utils.ts_manager').get_pasers_lua_path and
    --             require('utils.ts_manager').get_pasers_lua_path() or "")
    --         return vim.tbl_keys(parsers or {})
    --     end,
    --     desc = "compile tree-sitter parser",
    -- })
end

return M
