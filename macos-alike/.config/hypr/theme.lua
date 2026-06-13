--
-- Theme
--

local border_color = { colors = { "#5c5d61", "#353535" }, angle = 90, }
local stop_button_color = "#fb424d"
local stop_button_border_color = "#b20000"

local minimize_button_color = "#f7be09"
local minimize_button_button_border_color = "#dba808"

local maximize_button_color = "#2fbf47"
local maximize_button_border_color = "#049712"

local additional_border_color = "#000322"

local window_title_color = "#101010"

hl.config({
    general = {
        gaps_in          = 10,
        gaps_out         = 30,

        border_size      = 1,

        col              = {
            active_border   = border_color,
            inactive_border = border_color,
        },

        resize_on_border = false,
        allow_tearing    = true,
        layout           = "dwindle",
    },

    decoration = {
        rounding         = 24,
        rounding_power   = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.8,

        shadow           = {
            enabled      = true,
            range        = 20,
            render_power = 1,
            color        = "#00000040",
        },

        blur             = {
            enabled           = true,
            size              = 10,
            passes            = 3,
            vibrancy          = 0.1696,
            popups            = true,
            new_optimizations = true,
            xray              = true
        },
    },

    animations = {
        enabled = true,
    },
})

if hl.plugin.borders_plus_plus then
    hl.config({
        plugin = {
            borders_plus_plus = {
                add_borders = 1,
                natural_rounding = true,

                col = {
                    border_1 = theme.additional_border_color,
                },
                border_size_1 = 1,
            },
        },
    })
end

-- Animations
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

return {
    stop_button_color = stop_button_color,
    minimize_button_color = minimize_button_color,
    maximize_button_color = maximize_button_color,
    stop_button_border_color = stop_button_border_color,
    minimize_button_border_color = minimize_button_button_border_color,
    maximize_button_border_color = maximize_button_border_color,



    additional_border_color = additional_border_color,
    window_title_color = window_title_color,
}
