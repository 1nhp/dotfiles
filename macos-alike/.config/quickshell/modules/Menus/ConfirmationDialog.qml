import QtQuick
import QtQuick.Layouts
import Quickshell
import QtQuick.Controls
import qs.components
import Quickshell.Hyprland

FloatingWindow {
    id: confirmationDialog
    implicitWidth: 300
    implicitHeight: 300
    color: "transparent"
    visible: true

    signal accepted
    signal rejected

    minimumSize: Qt.size(width, height)
    maximumSize: Qt.size(width, height)

    property string dialogTitle: "Are you sure?"
    property string dialogText: "If you do nothing we'll launch nukes to your houses."
    property string dialogType: "normal"

    Rectangle {
        id: dialogBox
        width: 300
        height: 300
        anchors.centerIn: parent
        color: Qt.rgba(0, 0, 0, 1)
        radius: 18
        border.width: 1

        // Inner border overlay
        Rectangle {
            anchors.fill: parent
            color: "transparent"
            radius: parent.radius
            focus: false
            clip: true
            ColumnLayout {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 18
                anchors.rightMargin: 18
                spacing: 14

                // TODO: Implement types as an if statement cause?

                Rectangle {
                    visible: confirmationDialog.dialogType === "user"
                    width: 100
                    height: 100
                    radius: width * 0.5
                    color: "white"

                    Image {
                        anchors.centerIn: parent
                        width: parent.width * 0.7
                        height: parent.height * 0.7
                        source: Qt.resolvedUrl("../../assets/user.png")
                        fillMode: Image.PreserveAspectFit
                    }
                }

                CustomText {
                    Layout.fillWidth: true
                    text: dialogTitle
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignLeft
                }

                CustomText {
                    Layout.fillWidth: true
                    text: dialogText
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignLeft
                    font.weight: Font.Medium
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    BigButton {
                        colorVariant: "grey"
                        Layout.fillWidth: true
                        Layout.preferredWidth: 0
                        text: "No"
                        onClicked: {
                            if (confirmationDialog.onRejected)
                                confirmationDialog.onRejected();
                        }
                    }
                    BigButton {
                        text: "Yes"
                        Layout.fillWidth: true
                        Layout.preferredWidth: 0
                        onClicked: {
                            if (confirmationDialog.onAccepted)
                                confirmationDialog.onAccepted();
                        }
                    }
                }
            }
        }
    }
}
