local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

  [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ]],
  [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ]],
  [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ]],
  [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ]],
  [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ]],
  [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ]],
}

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button(
    "c",
    "  Configuration",
    ":cd ~/.config/nvim<CR>:so save.vim<CR>"
  ),
  dashboard.button(
    "p1",
    "󰊖  Game Lib",
    ":cd ~/Code/game-lib<CR>:so save.vim<CR>"
  ),
  dashboard.button(
    "p2",
    "  Server Lib",
    ":cd ~/Code/server-lib<CR>:so save.vim<CR>"
  ),
  dashboard.button(
    "p3",
    "  Game Template",
    ":cd ~/Code/game-template<CR>:so save.vim<CR>"
  ),
  dashboard.button(
    "p4",
    "  Ping Tool",
    ":cd ~/Code/ping-tool<CR>:so save.vim<CR>"
  ),
  dashboard.button(
    "p5",
    "  Simple Incremental",
    ":cd ~/Code/Idle/simple-incremental-1<CR>:so save.vim<CR>"
  ),
  dashboard.button(
    "p6",
    "󰉛  Food Assistant",
    ":cd ~/Code/Misc/yemek-oneri<CR>:so save.vim<CR>"
  ),
  dashboard.button(
    "p7",
    "󰢷  Barutcu",
    ":cd ~/Code/Medex/barutcu<CR>:so save.vim<CR>"
  ),
  dashboard.button(
    "p8",
    "  Medex Lisans",
    ":cd ~/Code/Medex/firat-lisans<CR>:so save.vim<CR>"
  ),
  dashboard.button(
    "p9",
    "󰑔  Remote App",
    ":cd ~/Code/Medex/remote<CR>:so save.vim<CR>"
  ),

  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
  return ""
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
