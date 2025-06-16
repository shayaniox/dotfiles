return {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    opts = function(_, opts)
        opts.close_if_last_window = true
        opts.window = {
            mappings = {
                ["<space>"] = "none",
            },
            width = 20,
        }
        opts.filesystem = {
            bind_to_cwd = false,
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        }
    end,
}
