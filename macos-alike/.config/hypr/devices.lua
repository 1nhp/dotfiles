--
-- MONITORS
--

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

hl.config({
    general = {
        allow_tearing = true,
    },
})

--
-- INPUT
--

hl.config({
    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",

        follow_mouse = 1,

        sensitivity  = 0.1,

        touchpad     = {
            natural_scroll = true,
        },
    },
})

-- Touchpad gestures
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Mouse configuration
hl.device({
    name        = "ur-mouse",
    sensitivity = -0.5,
})
