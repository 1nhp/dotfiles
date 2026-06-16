import qs.components.bar
import QtQuick
import Quickshell.Hyprland

TopText {
    id: windowTitleWidget
    text: Hyprland.activeToplevel ? Hyprland.activeToplevel.title : "Desktop"
}
