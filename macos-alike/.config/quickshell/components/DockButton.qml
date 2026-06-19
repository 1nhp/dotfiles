import QtQuick
import QtQuick.Controls.Basic
import Quickshell
import Qt5Compat.GraphicalEffects
import qs.utils
import qs.modules.Menus

Button {
    id: root
    background: Rectangle {
        color: "transparent"
    }

    property var dock

    property var textColor: "white"
    property string appIcon: "Alacritty"
    property string appName: "Alacritty"
    property int order: 0
    property string program: "alacritty"
    property bool isRunning: false
    property bool busy: false
    property var toplevels: []

    property int pid: 0

    implicitWidth: 54
    implicitHeight: 54
    padding: 0

    TapHandler {
        acceptedButtons: Qt.RightButton

        onSingleTapped: {
            MenuManager.openDockMenu(pid, program);
        }
    }

    TapHandler {
        acceptedButtons: Qt.LeftButton

        onSingleTapped: {
            if (!isRunning && !busy) {
                busy = true;
            }

            if (!isRunning) {
                bounceAnimation.start();
                Quickshell.execDetached(program);
            }
        }
    }

    onHoveredChanged: {
        if (hovered) {
            dockPopup.show(appName, root);
            console.log(pid);
        } else {
            dockPopup.hide(appName, root);
        }
    }

    onIsRunningChanged: {
        if (isRunning) {
            busy = false;
        }

        bounceAnimation.stop();
        iconImg.y = 0;
    }

    SequentialAnimation {
        id: bounceAnimation
        loops: Animation.Infinite

        NumberAnimation {
            target: iconImg
            property: "y"
            from: 0
            to: -24
            duration: 400
            easing.type: Easing.OutQuad
        }
        NumberAnimation {
            target: iconImg
            property: "y"
            to: 0
            duration: 400
            easing.type: Easing.InQuad
        }
    }

    contentItem: Image {
        id: iconImg
        source: Quickshell.iconPath(root.appIcon, true)
        fillMode: Image.PreserveAspectFit

        BrightnessContrast {
            anchors.fill: iconImg
            source: iconImg
            brightness: root.down ? -0.2 : 0
        }
    }

    Rectangle {
        visible: isRunning
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -8
        width: 6
        height: 4
        radius: 2
        color: "#ffffff"
    }
}
