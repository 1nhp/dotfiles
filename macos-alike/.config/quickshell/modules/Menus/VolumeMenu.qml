import QtQuick
import Quickshell
import qs.services
import Quickshell.Services.Pipewire
import qs.utils
import qs.components
import Quickshell.Io

PanelWindow {
    id: volumeMenu
    objectName: "VolumeMenu"

    visible: false
    color: "transparent"

    implicitWidth: 290
    implicitHeight: 100
    margins.top: 10

    anchors {
        top: true
        right: true
    }

    property int volume: Math.round(Pipewire.defaultAudioSink.audio.volume * 100)

    Connections {
        target: Pipewire.defaultAudioSink.audio

        function onVolumeChanged() {
            volume = Math.round(Pipewire.defaultAudioSink.audio.volume * 100);
        }
    }

    Rectangle {
        width: 270
        height: 100
        color: Qt.rgba(0, 0, 0, 1)
        radius: 18
        border.color: "#101010"
        border.width: 1

        Rectangle {
            anchors.fill: parent
            anchors.margins: 2

            color: "transparent"
            border.color: "#5c5d61"
            border.width: 1
            radius: parent.radius - anchors.margins

            Column {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 12

                Text {
                    text: "Sound"
                    color: "white"
                    font.pixelSize: 16
                    font.family: "SF Pro Display"
                    font.bold: true
                    renderType: Text.NativeRendering
                }

                Row {
                    spacing: 6

                    Text {
                        text: "􀊩"
                        color: "white"
                        topPadding: -3
                        renderType: Text.NativeRendering
                    }

                    Rectangle {
                        id: sliderBg
                        width: 220
                        height: 8
                        radius: 4
                        color: Qt.rgba(1, 1, 1, 0.2)

                        Rectangle {
                            id: fill
                            width: parent.width * (volume / 100)
                            height: parent.height
                            radius: 4
                            color: "white"

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

                Process {
                    id: soundSettings
                    command: ["alacritty", "-e", "pulsemixer"]
                }

                DelayedExecutor {
                    id: macAction
                    delay: 200

                    onTriggered: {
                        soundSettings.running = true;
                        volumeMenu.visible = false;
                    }
                }

                ActionButton {
                    text: "Sound settings.."
                    font.pixelSize: 14
                    width: 250
                    onReleased: {
                        onReleased: macAction.run();
                    }
                }
            }
        }
    }
}
