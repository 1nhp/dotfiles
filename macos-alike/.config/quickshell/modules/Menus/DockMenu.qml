import QtQuick
import QtQuick.Controls
import Quickshell
import qs.services
import qs.utils
import qs.components
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Io

PanelWindow {
    id: dockMenuRoot
    visible: false
    color: "transparent"
    objectName: "DockMenu"
    exclusiveZone: -1

    HyprlandFocusGrab {
        id: grab
        windows: [dockMenuRoot]
        active: true

        onCleared: {
            MenuManager.close(Menus.dockMenuLoader);
        }
    }

    implicitWidth: 220
    implicitHeight: 400

    anchors {
        left: true
        bottom: true
        right: true
    }

    mask: Region {
        item: dockMenu
    }

    Process {
        id: killProcess
    }

    DelayedExecutor {
        id: quitApp
        delay: 100

        onTriggered: {
            killProcess.command = ["kill", Globals.dockpid];
            killProcess.running = true;
            dockMenuRoot.visible = false;
        }
    }

    SequentialAnimation {
        id: hideDock
        NumberAnimation {}
    }

    Rectangle {
        id: dockMenu
        width: 220
        height: 45
        color: Qt.rgba(0, 0, 0, 1)
        radius: 18
        border.color: "#101010"
        border.width: 1

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 90 // Optional padding from edge

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

                    text: "Quit"
                    onClicked: {
                        quitApp.run();
                    }
                }
            }
        }
    }
}
