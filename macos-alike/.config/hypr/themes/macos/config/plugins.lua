if hl.plugin.borders_plus_plus then
    hl.config({
        plugin = {
            borders_plus_plus = {
                add_borders = 1,
                natural_rounding = true,

                col = {
                    border_1 = colors.additional_border_color,
                },
                border_size_1 = 1,
            },
        },
    })
end

local theme = require("themes.macos.colors")

if hl.plugin.hyprbars then
    hl.config({
        plugin = {
            hyprbars = {
                bar_height = 28,
                on_double_click = "hyprctl dispatch \"hl.dsp.window.fullscreen()\"",
                bar_color = theme.window_title_color,
                bar_buttons_alignment = "left",
                bar_padding = 14,
                bar_button_padding = 12,
                bar_blur = true,
                bar_part_of_window = true,
                bar_title_enabled = false,
                icon_on_hover = true,
                bar_precedence_over_border = true
            },
        },
    })

    hl.plugin.hyprbars.add_button({
        bg_color = theme.stop_button_color,
        fg_color = "#000000",
        border_color = theme.stop_button_border_color,
        border_size = 1,
        size = 14,
        icon = "􀆄",
        action = "hyprctl dispatch \"hl.dsp.window.close()\""
    })

    hl.plugin.hyprbars.add_button({
        bg_color = theme.minimize_button_color,
        fg_color = "#000000",
        border_color = theme.minimize_button_border_color,
        border_size = 1,
        size = 14,
        icon = "􀅽",
        action =
        'hyprctl dispatch "hl.dsp.window.float()" && hyprctl dispatch "hl.dsp.window.move({x = -150, y = -150, true})" && hyprctl dispatch "hl.dsp.window.resize({x = 910, y = 100, true})"'
    })

    hl.plugin.hyprbars.add_button({
        bg_color = theme.maximize_button_color,
        fg_color = "#000000",
        border_color = theme.maximize_button_border_color,
        border_size = 1,
        size = 14,
        icon = "􃏠",
        action = "hyprctl dispatch \"hl.dsp.window.fullscreen()\"",
    })
end
