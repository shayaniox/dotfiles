return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<leader>db", "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line", mode = { "n" } },
            { "<leader>dr", "<cmd> DapContinue <CR>", "Start or continue the debugger", mode = { "n" } },
            { "<leader>dt", "<cmd> DapUiToggle <CR>", "Toggle the debugger ui", mode = { "n" } },
            { "<F5>", "<cmd> DapContinue <CR>", "Start or continue the debugger", mode = { "n" } },
            { "<S-F5>", "<cmd> DapStop <CR>", "Stop current debug session", mode = { "n" } },
            { "<C-S-F5>", "<cmd> DapRerun <CR>", "Rerun current debug session", mode = { "n" } },
            { "<F10>", "<cmd> DapStepOver <CR>", "Step over the current line", mode = { "n" } },
            { "<F11>", "<cmd> DapStepInto <CR>", "Step into the current function", mode = { "n" } },
            { "<F12>", "<cmd> DapStepOut <CR>", "Step out the current function", mode = { "n" } },
            {
                "<leader>dc",
                "<cmd> lua require('dapui').open({reset = true}) <CR>",
                "Reset the dap ui",
                mode = { "n" },
            },
            {
                "<leader>dus",
                function()
                    local widgets = require("dap.ui.widgets")
                    local sidebar = widgets.sidebar(widgets.scopes)
                    sidebar.open()
                end,
                "Open debugging sidebar",
                mode = { "n" },
            },
        },
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
        end,
        keys = {
            {
                "<leader>dgt",
                function()
                    require("dap-go").debug_test()
                end,
                "Debug go test",
            },
            {
                "<leader>dgl",
                function()
                    require("dap-go").debug_last()
                end,
                "Debug last go test",
            },
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
            ensure_installed = {
                "codelldb",
            },
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        opts = {
            enabled = true, -- enable this plugin (the default)
            enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
            highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
            highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
            show_stop_reason = true, -- show stop reason when stopped for exceptions
            commented = false, -- prefix virtual text with comment string
            only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
            all_references = false, -- show virtual text on all all references of the variable (not only definitions)
            clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
            --- A callback that determines how a variable is displayed or whether it should be omitted
            display_callback = function(variable, buf, stackframe, node, options)
                if options.virt_text_pos == "inline" then
                    return " = " .. variable.value
                else
                    return variable.name .. " = " .. variable.value
                end
            end,
            -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
            virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

            -- experimental features:
            all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
            virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
            virt_text_win_col = nil,
        },
    },
}
