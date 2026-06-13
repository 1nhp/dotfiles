import Quickshell
import QtQuick
import QtQuick.Controls
import qs.components.bar
import qs.widgets
import qs.modules
import qs.services

import Quickshell.Hyprland

// Bar
PanelWindow {
    color: "transparent"
    VolumeOSD {
        id: volumeOSD
        visible: true
    }

    VolumeListener {
        id: listener

        onShowOSD: function (volume, muted) {
            volumeOSD.volume = volume;
            volumeOSD.muted = muted;
            volumeOSD.showOSD();
        }
    }

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 32

    Item {

        // Left top buttons container
        Row {
            anchors.left: parent.left
            spacing: 0
            TopButton {
                text: ""
                font.pixelSize: 23
                padding: 15
                height: 30
            }

            TopText {
                topPadding: 2
                text: Hyprland.activeToplevel ? Hyprland.activeToplevel.title : "Desktop"
            }
        }
    }

    // Right top buttons container
    Row {
        anchors.right: parent.right
        spacing: 14
        rightPadding: 10
        height: parent.height

        Volume {}
        Clock {}
    }
}
