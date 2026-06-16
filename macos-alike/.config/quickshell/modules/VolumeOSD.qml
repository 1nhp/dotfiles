import QtQuick
import Quickshell
import qs.services
import qs.utils

PanelWindow {
    id: volumeOSD
    visible: false
    color: "transparent"
    exclusiveZone: -1

    anchors {
        bottom: true
    }

    implicitWidth: 350
    implicitHeight: 350

    property int volume: 0
    property bool muted: false

    Rectangle {
        anchors.margins: 50
        anchors.fill: parent
        radius: 12
        color: Qt.rgba(0, 0, 0, 0.7)

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
            id: sliderBg
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 10
            width: 200
            height: 8
            radius: 4
            color: muted ? "transparent" : Qt.rgba(1, 1, 1, 0.2)

            Rectangle {
                id: fill
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

            MouseArea {
                anchors.fill: parent

                onPressed: function (mouse) {
                    if (pressed)
                        updateVolume(mouse);
                }
                onPositionChanged: function (mouse) {
                    if (pressed)
                        updateVolume(mouse);
                }

                function updateVolume(mouse) {
                    let percent = mouse.x / sliderBg.width;
                    percent = Math.max(0, Math.min(1, percent));
                    volume = Math.round(percent * 100);
                    VolumeControl.setVolume(percent);
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
