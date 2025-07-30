return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
            ⠀⠀⠀⠀⠀⣀⣤⣴⣶⣶⣿⣿⣿⣿⣷⣶⣦⣤⡀
            ⠀⠀⣠⣶⣿⣿⣿⣿⣿⠿⠟⠛⠛⠛⠛⠿⠿⣿⣿⣷⣄
            ⠀⣼⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠟
            ⢸⣿⣿⣿⣿⣿⠁
            ⢸⣿⣿⣿⣿⣿⡀⠀⣀⣤⣤⣴⣶⣶⣤⣤⣤⡀⠀⠀⠀⠀⣴⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡀
            ⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⣼⣿⣿⣷⣄⠀⢀⣀⣀⣀⡀⠀⣀⣴⣿⣿⡇
            ⠀⠀⢙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
            ⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
            ⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇
            ⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏
            ⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⣀⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠁
            ⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⠉⠉
            ⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⠟⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇
            ⠀⠀⠘⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟
            ⠀⠀⠀⢻⣿⣿⣿⣿⣿⠃⠀⠀⠀⢸⣿⣿⣿⣿⣿⠏⠀⠀⠹⣿⣿⣿⣿⣿⠁
            ⠀⠀⠀⠈⣿⣿⣿⣿⣿⠀⠀⠀⠀⠈⣿⣿⣿⣿⡏⠀⠀⠀⠀⣿⣿⣿⣿⡏
            ⠀⠀⠀⠀⠹⣿⣿⣿⣿⠀⠀⠀⠀⠀⢿⣿⣿⣿⠁⠀⠀⠀⢠⣿⣿⣿⡿
            ⠀⠀⠀⠀⠀⢻⣿⣿⡏⠀⠀⠀⠀⠀⢸⣿⣿⡟⠀⠀⠀⠀⢸⣿⣿⣿⠃
            ⠀⠀⠀⠀⠀⠈⢿⣿⠇⠀⠀⠀⠀⠀⠀⢿⡿⠁⠀⠀⠀⠀⠈⢿⡿⠃
    ]]

    dashboard.section.header.val = vim.split(logo, "\n")

    dashboard.section.buttons.val = {
      dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
      dashboard.button("r", "󰄉 " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", " " .. " Config", ":e ~/.config/nvim<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }

    dashboard.section.footer.val = "meow"

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true

    return dashboard
  end,
  config = function (_, dashboard)
    require("alpha").setup(dashboard.opts)
  end
}
