local terminal    = "alacritty"
local fileManager = "thunar"
local menu        = "hyprlauncher"

hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("alacritty")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = false,
    },
})

return {
    terminal = terminal,
    fileManager = fileManager,
    menu = menu,
}
