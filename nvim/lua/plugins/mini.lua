require("mini.surround").setup()
require("mini.icons").setup()
local snippets = require("mini.snippets")
snippets.setup({
    snippets = {
        snippets.gen_loader.from_file(vim.fn.stdpath('config') .. '/snippets/global.json'),
        snippets.gen_loader.from_lang({ lang_patterns = { ['.*'] = { 'snippets/%s/*.json' } } }),
    },
})
require("mini.completion").setup()
require("mini.pick").setup()
require("mini.git").setup()
require("mini.diff").setup({
    view = {
        style = "number",
--        signs = {
--            add = "▎",
--            change = "▎",
--            delete = "▁",
--        },
    },
})
vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { link = "GruvboxPurple" })
require("mini.statusline").setup({
    content = {
        active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git           = MiniStatusline.section_git({ trunc_width = 40 })
            local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
            local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
            local filename      = "%t%m%r"
            local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location      = "%l|%c"

            return MiniStatusline.combine_groups({
                { hl = mode_hl,                     strings = { mode:upper() } },
                { hl = 'MiniStatuslineDevinfo',     strings = { git, diff, diagnostics, lsp } },
                "%<",
                { hl = 'MiniStatuslineFilename',    strings = { filename } },
                '%=',
                { hl = 'MiniStatuslineFileinfo',    strings = { fileinfo } },
                { hl = mode_hl,                     strings = { location } },
            })
        end
        },
        inactive = nil,
})
