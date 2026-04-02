-- treesitter parsers 管理
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
end

return M
