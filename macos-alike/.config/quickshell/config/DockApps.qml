// DockApps.qml
pragma Singleton
import QtQuick

QtObject {
    readonly property var apps: [
        {
            name: "Firefox",
            icon: "firefox",
            cmd: "firefox",
            order: 0
        },
        {
            name: "Discord",
            icon: "discord",
            cmd: "discord",
            order: 1
        },
        {
            name: "Audacity",
            icon: "audacity",
            cmd: "audacity",
            order: 2
        },
        {
            name: "GIMP",
            icon: "gimp",
            cmd: "gimp",
            order: 3
        },
        {
            name: "OBS Studio",
            icon: "com.obsproject.Studio",
            cmd: "obs",
            order: 4
        },
        {
            name: "Obsidian",
            icon: "obsidian",
            cmd: "obsidian",
            order: 5
        },
        {
            name: "Libreoffice",
            icon: "libreoffice-main",
            cmd: "libreoffice",
            order: 5
        },
        {
            name: "Steam",
            icon: "steam",
            cmd: "steam",
            order: 6
        },
        {
            name: "Eden",
            icon: "eden",
            cmd: "eden",
            order: 7
        },
        {
            name: "Dolphin Emulator",
            icon: "dolphin-emu",
            cmd: "dolphin-emu",
            order: 8
        },
        {
            name: "RPCS3",
            icon: "rpcs3",
            cmd: "rpcs3",
            order: 9
        },
    ]
}
