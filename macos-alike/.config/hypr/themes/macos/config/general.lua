local colors = require("themes.macos.colors")

hl.config({
    general = {
        gaps_in          = 5,
        gaps_out         = 10,
        border_size      = 1,

        col              = {
            active_border   = colors.border_color,
            inactive_border = colors.border_color,
        },

        resize_on_border = false,
    },
})
