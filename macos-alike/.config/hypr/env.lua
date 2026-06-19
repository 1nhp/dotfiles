local terminal    = "alacritty"
local fileManager = "thunar"
local menu        = "quickshell -p ~/.config/quickshell/modules/Launchpad.qml"

hl.config({
    misc = {
        force_default_wallpaper = false,
        disable_hyprland_logo   = false,
    },
})

return {
    terminal = terminal,
    fileManager = fileManager,
    menu = menu,
}
