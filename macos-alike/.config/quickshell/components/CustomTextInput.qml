import QtQuick
import QtQuick.Controls
import qs.components

TextField {
    id: textInput

    inputMethodHints: Qt.ImhSensitiveData
    color: "#505050"
    font.family: "SF Pro Rounded"
    font.bold: true
    font.pixelSize: 14
    renderType: Text.NativeRendering
    placeholderTextColor: "#505050"

    background: Rectangle {

        implicitWidth: 200
        implicitHeight: 40
        color: "#171715"
        border.color: "transparent"
        radius: 64
    }
}
