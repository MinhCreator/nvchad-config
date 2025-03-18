math.randomseed(os.time())

function pick_color()
    local r = math.random(0, 255)
    local g = math.random(0, 255)
    local b = math.random(0, 255)
    return string.format("#%02X%02X%02X", r, g, b)
end

function random_color()
    local hex_col_def = "#"

    for i = 1, 6 do
        hex_col_def = hex_col_def .. string.format("%X", math.random(0, 15))
    end

    return hex_col_def
end

local function getGreeting(name)
    local tableTime = os.date("*t")
    local hour = tableTime.hour
    local greetingsTable = {
        [1] = "  Sleep well",
        [2] = "  Good morning",
        [3] = "  Good afternoon",
        [4] = "  Good evening",
        [5] = "󰖔 Good night",
    }
    local greetingIndex = 0
    if hour == 23 or hour < 7 then
        greetingIndex = 1
    elseif hour < 12 then
        greetingIndex = 2
    elseif hour >= 12 and hour < 18 then
        greetingIndex = 3
    elseif hour >= 18 and hour < 21 then
        greetingIndex = 4
    elseif hour >= 21 then
        greetingIndex = 5
    end
    return greetingsTable[greetingIndex] --{ fg = pick_color() }
end

local userName = "MinhCreatorVN"
local greeting = "<|" .. getGreeting(userName) .. ", " .. userName .. "|>"

local function check_greeting_color()
    local gr = getGreeting(userName)

    if gr == "  Sleep well" then
        return "#F1B3BE"
    elseif gr == "  Good morning" then
        return "#FFE9A6"
    elseif gr == "  Good afternoon" then
        return "#F8AA27"
    elseif gr == "  Good evening" then
        return "#546BAB"
    elseif gr == "󰖔 Good night" then
        return "#2E4482"
    end
end

--local color = pick_color()
--

return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,

    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        -- Define and set highlight groups for each logo line
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#EF476F" }) --{ fg = color }) --
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#F78C6B" }) --{ fg = color }) --
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#FFD166" }) --{ fg = color }) --
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#06D6A0" }) --{ fg = color }) --
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#118AB2" }) --{ fg = color }) --
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#073B4C" }) --{ fg = color }) --
        vim.api.nvim_set_hl(0, "CodeEditor", { fg = "#fa3628" })           --{ fg = pick_color()  })
        vim.api.nvim_set_hl(0, "getGreeting", { fg = check_greeting_color() })
        dashboard.section.header.type = "group"
        dashboard.section.header.val = {
            {
                type = "text",
                val = "   ██╗      █████╗ ███████╗██╗   ██╗     ██████╗ ██████╗ ██████╗ ███████╗  ",
                opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
            },
            {
                type = "text",
                val = "   ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝    ██╔════╝██╔═══██╗██╔══██╗██╔════╝  ",
                opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
            },
            {
                type = "text",
                val = "   ██║     ███████║  ███╔╝  ╚████╔╝     ██║     ██║   ██║██║  ██║█████╗    ",
                opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
            },
            {
                type = "text",
                val = "   ██║     ██╔══██║ ███╔╝    ╚██╔╝      ██║     ██║   ██║██║  ██║██╔══╝    ",
                opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
            },
            {
                type = "text",
                val = "   ███████╗██║  ██║███████╗   ██║       ╚██████╗╚██████╔╝██████╔╝███████╗  ",
                opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
            },
            {
                type = "text",
                val = "   ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝        ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝  ",
                opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
            },
            {
                type = "text",
                val = "<-|[  Fastest Code Editor  ]|->",
                opts = { hl = "CodeEditor", shrink_margin = false, position = "center" },
            },

            {
                type = "text",
                val = greeting,
                opts = {
                    position = "center",
                    hl = "getGreeting",
                },
            },

            {
                type = "padding",
                val = 1,
            },
            --{
            --type = "text",
            --val = "𝙾𝚑 𝚝𝚑𝚎 𝚓𝚘𝚢 𝚘𝚏 𝚑𝚊𝚟𝚒𝚗𝚐 𝚢𝚘𝚞𝚛 𝚘𝚠𝚗 𝚌𝚞𝚜𝚝𝚘𝚖 𝚝𝚎𝚡𝚝 𝚎𝚍𝚒𝚝𝚘𝚛 :)",
            --opts = { hl = "NeovimDashboardUsername", shrink_margin = false, position = "center" },
            --},
        }
        -- stylua: ignore


        dashboard.section.buttons.val = {
            dashboard.button("n", " " .. " New file", "<cmd> ene | startinsert <cr>"),
            dashboard.button("f", " " .. " Search", "<cmd>Telescope find_files <cr>"),
            dashboard.button("g", " " .. " Find text", "<cmd>Telescope live_grep <cr>"),
            dashboard.button("w", " " .. " Notification histories", "<cmd> Telescope notify <cr>"),
            dashboard.button("s", " " .. " session", "<cmd> lua require('persistence').load() <cr>"),
            dashboard.button("r", " " .. " Recent files", "<cmd>Telescope oldfiles <cr>"),
            dashboard.button("c", " " .. " Configure",
                "<cmd>lua require('telescope.builtin').find_files({prompt_title = 'Config File', cwd = vim.fn.stdpath('config')})<cr>"),
            dashboard.button("t", " " .. " Theme", "<cmd> lua require('nvchad.themes').open()<cr>"),
            dashboard.button("m", "󰙭 " .. " Mason component", "<cmd> Mason <cr>"),
            dashboard.button("l", " " .. " Check Update", "<cmd> Lazy <cr>"),
            dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
            --dashboard.button("t", "T " .. " Terminal",    "<cmd> term <cr>"),
            --dashboard.button("Z", " " .. " Open Directories", "<cmd> search_dirs<cr>"),
            --dashboard.button("c", " " .. " Configure",          "<cmd> lua LazyVim.pick.config_files()() <cr>"),
            --dashboard.button("s", " " .. " Recovery Session", [[<cmd> lua require("persistence").load() <cr>]]),
            --dashboard.button("r", " " .. " Recent files", "<cmd> lua LazyVim.pick('oldfiles')() <cr>"),
        }
        --vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#311B92" }) -- Dark Indigo
        vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#33abea" })  -- blue -{ fg = "#fafafa" })  -- white
        vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#fa3628" }) -- red
        vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#6A9C89" })   --"#edd691" 6A9C89})
        -- Footer
        local function footer()
            -- local stats = require("lazy").stats()
            local total_plugins = require("lazy").stats().count
            local datetime = os.date("  %d/%m/%Y   %H:%M")
            -- local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            local version = vim.version()
            local nvim_version_info = "\n           󱓞 Version "
                .. version.major
                .. "."
                .. version.minor
                .. "."
                .. version.patch

            return " Loaded " ..
                "  " .. total_plugins .. " plugins" .. datetime .. nvim_version_info
        end

        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"
        dashboard.section.footer.val = footer()
        --dashboard.section.footer.opts.hl = "Constant"
        dashboard.opts.layout[1].val = 3
        return dashboard
    end,
    config = function(_, dashboard)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                once = true,
                pattern = "AlphaReady",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        require("alpha").setup(dashboard.opts)

        --vim.api.nvim_create_autocmd("User", {
        --  once = true,
        --  pattern = "LazyVimStarted",
        --  callback = function()
        --    local stats = require("lazy").stats()
        --    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        --    dashboard.section.footer.val = "⚡ Lazy neovim loaded "
        --      .. stats.loaded
        --      .. "/"
        --      .. stats.count
        --      .. " plugins in "
        --      .. ms
        --      .. "ms"
        --    pcall(vim.cmd.AlphaRedraw)
        --  end,
        --})
    end,
}
