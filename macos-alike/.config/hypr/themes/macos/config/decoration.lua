hl.config({
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
