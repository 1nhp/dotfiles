local terminal    = "alacritty"
local fileManager = "thunar"
local menu        = "hyprlauncher"

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
