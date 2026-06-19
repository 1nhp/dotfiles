import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.widgets
import qs.modules
import qs.modules.Menus
import qs.modules.Lockscreen
import qs.services
import qs.utils
import Quickshell.Hyprland
import Quickshell.Wayland

PanelWindow {
    color: "black"
    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: 28
    WlrLayershell.namespace: "bar"

    Keybinds {}

    Dock {}
    LockScreen {}

    VolumeOSD {
        id: volumeOSD
    }
    VolumeListener {
        id: listener

        onShowOSD: function (volume, muted) {
            volumeOSD.volume = volume;
            volumeOSD.muted = muted;
            volumeOSD.showOSD();
        }
    }

    RowLayout {
        height: parent.height

        StartButton {}
        WindowTitle {}
    }

    RowLayout {
        anchors.right: parent.right
        spacing: 8
        height: parent.height

        Battery {}
        Volume {}
        Clock {}

        Rectangle {
            width: 4
            color: "transparent"
        }
    }
}
