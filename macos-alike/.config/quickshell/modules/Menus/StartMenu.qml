import QtQuick
import Quickshell
import qs.services
import qs.utils
import qs.components
import QtQuick.Layouts

PanelWindow {
    id: startMenuRoot
    visible: false
    color: "transparent"
    objectName: "StartMenu"

    implicitWidth: 220
    implicitHeight: 270

    anchors {
        top: true
        left: true
    }

    mask: Region {
        item: startMenu
    }

    Rectangle {
        id: startMenu
        width: 220
        height: 270
        color: Qt.rgba(0, 0, 0, 1)
        radius: 18
        border.color: "#101010"
        border.width: 1

        // FIXED: use a helper function for dialogs insted of downright writing more boilerplate

        DelayedExecutor {
            id: logOut
            delay: 200

            onTriggered: {
                startMenu.visible = false;
                ConfirmationDialogManager.show("Are you sure you want to quit all applications and log out now?", "If you do nothing we'll launch nukes to your houses.", function () {
                    Quickshell.execDetached(["hyprctl", "dispatch", "exit"]);
                }, "user");
            }
        }

        DelayedExecutor {
            id: sleep
            delay: 200

            onTriggered: {
                startMenu.visible = false;
                ConfirmationDialogManager.show("Are you sure you want to put your device to sleep mode?", "", function () {
                    Quickshell.execDetached(["systemctl", "suspend"]);
                });
            }
        }

        DelayedExecutor {
            id: restart
            delay: 200

            onTriggered: {
                startMenu.visible = false;
                ConfirmationDialogManager.show("Are you sure you want to restart your device?", "", function () {
                    Quickshell.execDetached(["restart"]);
                });
            }
        }

        DelayedExecutor {
            id: shutdown
            delay: 200

            onTriggered: {
                startMenu.visible = false;
                ConfirmationDialogManager.show("Are you sure you want to shutdown your device?", "", function () {
                    Quickshell.execDetached(["shutdown"]);
                });
            }
        }

        Rectangle {
            anchors.fill: parent
            anchors.margins: 2

            color: "transparent"
            border.color: "#5c5d61"
            border.width: 1
            radius: parent.radius - anchors.margins

            ColumnLayout {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 8
                spacing: 4

                ActionButton {
                    Layout.fillWidth: true
                    text: "About This Device"
                }

                Line {}

                ActionButton {
                    Layout.fillWidth: true
                    text: "System Settings"
                }
                ActionButton {
                    Layout.fillWidth: true
                    text: "Force Quit..."
                }

                Line {}

                ActionButton {
                    Layout.fillWidth: true
                    text: "Sleep"

                    onReleased: {
                        sleep.run();
                    }
                }
                ActionButton {
                    Layout.fillWidth: true
                    text: "Restart..."

                    onReleased: {
                        restart.run();
                    }
                }

                ActionButton {
                    Layout.fillWidth: true
                    text: "Shut Down..."

                    onReleased: {
                        shutdown.run();
                    }
                }

                Line {}

                ActionButton {
                    Layout.fillWidth: true
                    text: "Lock Screen"

                    onReleased: {
                        Globals.screenLocked = true;
                        console.log(Globals.screenLocked);
                    }
                }

                ActionButton {
                    Layout.fillWidth: true
                    text: "Log Out user..."

                    onReleased: {
                        logOut.run();
                    }
                }
            }
        }
    }
}
