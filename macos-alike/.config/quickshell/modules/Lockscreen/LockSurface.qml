import QtQuick
import QtQuick.Layouts
import qs.components
import qs.utils
import qs.services
import Quickshell
import Quickshell.Wayland
import Quickshell.Io

Rectangle {
    id: root
    required property LockContext context
    property string username
    color: "#252525"

    Rectangle {
        visible: true
        anchors.fill: parent
        color: "#252525"

        Process {
            id: userProc
            command: ["whoami"]
            stdout: StdioCollector {
                onStreamFinished: root.username = text.trim()
            }
        }

        Component.onCompleted: {
            userProc.running = true;
        }

        CustomText {
            id: date

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 120
            }
            font.pixelSize: 30

            text: {
                Date.day;
            }
        }

        CustomText {
            id: clock

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 150
            }
            font.pixelSize: 120

            text: {
                Date.time;
            }
        }

        ColumnLayout {
            spacing: 8

            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 20
            }

            CustomText {
                text: root.username
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 16
                bottomPadding: 10
            }

            RowLayout {
                spacing: 0

                CustomTextInput {
                    id: passwordBox

                    property real shakeOffset: 0
                    x: shakeOffset

                    implicitWidth: 170
                    implicitHeight: 32
                    leftPadding: 10
                    rightPadding: 10
                    enabled: !root.context.unlockInProgress

                    echoMode: TextInput.Password
                    placeholderText: "Enter Password"

                    onTextChanged: {
                        if (text !== root.context.currentText)
                            root.context.currentText = text;
                    }
                    onAccepted: root.context.tryUnlock()

                    SequentialAnimation {
                        id: bounceAnimation

                        NumberAnimation {
                            target: passwordBox
                            property: "shakeOffset"
                            from: 0
                            to: 12
                            duration: 60
                            easing.type: Easing.OutQuad
                        }
                        NumberAnimation {
                            target: passwordBox
                            property: "shakeOffset"
                            to: -10
                            duration: 60
                            easing.type: Easing.InOutQuad
                        }
                        NumberAnimation {
                            target: passwordBox
                            property: "shakeOffset"
                            to: 8
                            duration: 60
                            easing.type: Easing.InOutQuad
                        }
                        NumberAnimation {
                            target: passwordBox
                            property: "shakeOffset"
                            to: -6
                            duration: 60
                            easing.type: Easing.InOutQuad
                        }
                        NumberAnimation {
                            target: passwordBox
                            property: "shakeOffset"
                            to: 0
                            duration: 60
                            easing.type: Easing.InQuad
                        }
                    }

                    ActionButton {
                        id: unlockButton
                        onReleased: root.context.tryUnlock()
                        enabled: !root.context.unlockInProgress

                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 20
                        hoverBox: false

                        text: "􀁼"
                        textColor: unlockButton.down ? "#505050" : "#909090"
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
                        if (root.context.currentText === "")
                            passwordBox.clear();
                    }
                }
            }

            CustomText {
                id: loadingIcon
                layer.enabled: true
                layer.smooth: true

                NumberAnimation on rotation {
                    from: 0
                    to: 360
                    duration: 1000
                    loops: Animation.Infinite
                    running: root.context.unlockInProgress
                }
                text: "􀴽"
                color: "#808080"
                opacity: "0" ? root.context.unlockInProgress : "1"
                font.pixelSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
