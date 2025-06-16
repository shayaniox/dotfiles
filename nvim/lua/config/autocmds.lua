-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

local c_group = augroup("c_filetype")
vim.api.nvim_create_autocmd(
    { "BufEnter" },
    { pattern = { "*.c", "*.h" }, command = "nnoremap <silent> <leader>m :!make<CR>", group = c_group }
)
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.c", "*.h" },
    command = "nnoremap <silent> <leader>re :lua vim.lsp.buf.rename()<CR>",
    group = c_group,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.c", "*.h" },
    command = "ab 00 '\\0'",
    group = c_group,
})
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {
        "*.h",
    },
    command = "setlocal ft=c",
})

local go_group = augroup("go_filetype")
vim.api.nvim_create_autocmd(
    { "BufEnter" },
    { pattern = { "*.go" }, command = "nnoremap <silent> <leader>r :GoRun %<CR>", group = go_group }
)
vim.api.nvim_create_autocmd(
    { "BufEnter" },
    { pattern = { "*.go" }, command = "nnoremap <silent> <leader>gt :GoTestFile<CR>", group = go_group }
)
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*.go" }, command = "abb :: :=", group = go_group })

local bash_group = augroup("bash_filetype")
vim.api.nvim_create_autocmd(
    { "BufEnter" },
    { pattern = { "*.sh" }, command = "nnoremap <silent> <leader>r :!bash %<CR>", group = bash_group }
)

-- local mysql_group = augroup("mysql_filetype")
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--     pattern = { "*.mysql", "*.sql", "*.plsql" },
--     command = "lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })",
--     group = mysql_group,
-- })

-- local format_sync_grp = augroup("GoImport")
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*.go",
--     callback = function()
--         require("go.format").goimport()
--     end,
--     group = format_sync_grp,
-- })

vim.api.nvim_create_augroup("lazyvim_neotree_group", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Open Neotree automatically",
    group = "lazyvim_neotree_group",
    callback = function()
        if vim.fn.argc() == 0 then
            vim.cmd("Neotree toggle")
        end
    end,
})

-- autocmd TermOpen * setlocal nonumber norelativenumber
vim.api.nvim_create_autocmd("TermOpen", {
    desc = "Disable line number for terminal window",
    command = "setlocal nonumber",
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("rust_disable_single_quote_pairs"),
    pattern = "rust",
    callback = function()
        vim.keymap.set("i", "'", "'", { buffer = 0 })
    end,
})
