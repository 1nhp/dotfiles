-- Animations
hl.curve("easeInQuad", { type = "bezier", points = { { 0.11, 0 }, { 0.5, 0 } } })
hl.curve("easeOutQuad", { type = "bezier", points = { { 0.5, 1 }, { 0.89, 1 } } })
hl.curve("easeInOutQuad", { type = "bezier", points = { { 0.45, 0 }, { 0.55, 1 } } })

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 2,
    bezier = "easeOutQuad",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 5,
    bezier = "easeInQuad",
})

hl.animation({ leaf = "fadeIn", enabled = true, speed = 1, bezier = "easeOutQuad" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 2.5, bezier = "easeOutQuad" })
hl.animation({ leaf = "fade", enabled = true, speed = 1.5, bezier = "easeOutQuad" })

hl.animation({ leaf = "layers", enabled = true, speed = 1.81, bezier = "easeInQuad" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "easeInOutQuad" })
