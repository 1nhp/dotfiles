import QtQuick
import Quickshell
import qs.services
import Quickshell.Services.Pipewire

PanelWindow {
    id: volumeOSD
    visible: true
    color: "transparent"
    exclusiveZone: 0
    surfaceFormat: opaque

    anchors {
        bottom: true
    }

    width: 350
    height: 350

    property int volume: 0
    property bool muted: false

    Rectangle {

        anchors.margins: 50
        anchors.fill: parent
        radius: 12
        color: Qt.rgba(1, 1, 1, 0.3)

        Column {
            anchors.centerIn: parent
            spacing: 10

            Text {
                id: volumeText
                text: volumeIcon
                font.pixelSize: 130
                color: "white"
                width: 100
                horizontalAlignment: Text.AlignHCenter
                renderType: Text.NativeRendering
            }
        }

        Rectangle {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 10 // Optional padding
            width: 200
            height: 10
            radius: 4
            color: muted ? "transparent" : Qt.rgba(1, 1, 1, 0.2)

            Rectangle {
                width: parent.width * (volume / 100)
                height: parent.height
                radius: 4
                color: muted ? "transparent" : Qt.rgba(1, 1, 1, 1)

                Behavior on width {
                    NumberAnimation {
                        duration: 150
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }
    }

    Timer {
        id: hideTimer
        interval: 2000
        repeat: false
        running: false

        onTriggered: {
            volumeOSD.visible = false;
        }
    }

    function showOSD() {
        volumeOSD.visible = true;
        hideTimer.restart();
    }

    property string volumeIcon: {
        if (!volume)
            return "􀊣"; // fallback

        if (muted)
            return "􀊣"; // fallback

        if (volume < 20)
            return "􀊥";
        if (volume < 33)
            return "􀊧";
        if (volume < 66)
            return "􀊩";

        return "􀊩";
    }

    function hideOSD() {
        hideTimer.stop();
        volumeOSD.visible = false;
    }
}
