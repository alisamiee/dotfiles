return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        check_ts = true,         -- treesitter integration
        disable_filetype = { "TelescopePrompt" },
        disable_in_macro = true, -- disable when recording or executing a macro
        disable_in_visualblock = true, -- disable when insert after visual block mode
        -- ts_config = {
        --     lua = { "string", "source" }, -- it will not add a pair on that treesitter node
        --     javascript = { "string", "template_string" },
        --     java = false,              -- don't check treesitter on java
        -- },
        fast_wrap = {},
        -- fast_wrap = {
        --     map = '<M-e>',
        --     chars = { '{', '[', '(', '"', "'" },
        --     pattern = [=[[%'%"%>%]%)%}%,]]=],
        --     end_key = '$',
        --     keys = 'qwertyuiopzxcvbnmasdfghjkl',
        --     check_comma = true,
        --     highlight = 'Search',
        --     highlight_grey = 'Comment'
        -- },
    },
}
