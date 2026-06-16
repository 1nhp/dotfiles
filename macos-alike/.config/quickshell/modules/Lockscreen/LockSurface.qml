import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Fusion
import Quickshell.Wayland
import qs.components
import qs.utils

Rectangle {
    id: root
    required property LockContext context
    readonly property ColorGroup colors: Window.active ? palette.active : palette.inactive
    color: "#252525"

    BigButton {
        focusPolicy: Qt.NoFocus
        opacity: 0
        onHoveredChanged: Globals.screenLocked = false
    }

    CustomText {
        id: clock

        property var date: new Date()

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 100
        }

        font.pixelSize: 120

        Timer {
            running: true
            repeat: true
            interval: 1000
            onTriggered: clock.date = new Date()
        }
        text: {
            const hours = this.date.getHours().toString().padStart(2, '0');
            const minutes = this.date.getMinutes().toString().padStart(2, '0');
            return `${hours}:${minutes}`;
        }
    }
    ColumnLayout {
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 85
        }
        RowLayout {
            CustomTextInput {
                id: passwordBox
                implicitWidth: 160
                implicitHeight: 28
                leftPadding: 10
                rightPadding: 10
                focus: true
                enabled: !root.context.unlockInProgress
                onTextChanged: root.context.currentText = this.text
                onAccepted: root.context.tryUnlock()
                echoMode: TextInput.Password
                placeholderText: "Enter Password"

                SequentialAnimation {
                    id: bounceAnimation
                    NumberAnimation {
                        target: passwordBox
                        property: "x"
                        to: passwordBox.x + 12
                        duration: 60
                        easing.type: Easing.OutQuad
                    }
                    NumberAnimation {
                        target: passwordBox
                        property: "x"
                        to: passwordBox.x - 10
                        duration: 60
                        easing.type: Easing.InOutQuad
                    }
                    NumberAnimation {
                        target: passwordBox
                        property: "x"
                        to: passwordBox.x + 8
                        duration: 60
                        easing.type: Easing.InOutQuad
                    }
                    NumberAnimation {
                        target: passwordBox
                        property: "x"
                        to: passwordBox.x - 6
                        duration: 60
                        easing.type: Easing.InOutQuad
                    }
                    NumberAnimation {
                        target: passwordBox
                        property: "x"
                        to: passwordBox.x + 0
                        duration: 60
                        easing.type: Easing.InQuad
                    }
                }

                Connections {
                    target: root.context
                    function onShowFailureChanged() {
                        if (root.context.showFailure) {
                            bounceAnimation.start();
                            passwordBox.clear();
                        }
                    }
                    function onCurrentTextChanged() {
                        passwordBox.text = root.context.currentText;
                    }
                }
            }
        }
    }
}
