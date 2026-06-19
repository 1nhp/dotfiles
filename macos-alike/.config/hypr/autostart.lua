hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("alacritty")
    hl.exec_cmd("quickshell")

    -- (Optional) Disable bios fan control for dell laptops
    -- Latitudes, XPS, etc.
    hl.exec_cmd("sudo dell-bios-fan-control 0")
    hl.exec_cmd("hyprctl setcursor MacOS 24")
    hl.exec_cmd("/usr/lib/xdg-desktop-portal --replace &") -- This needs to be running to fix xdg-desktop-portal issues
end)
