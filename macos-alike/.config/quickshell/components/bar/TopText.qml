import QtQuick
import QtQuick.Controls
import qs.components.bar

Text {
    color: "white"
    font.family: "SF Pro Rounded"
    font.bold: true
    font.pixelSize: 14
    renderType: Text.NativeRendering
    anchors.verticalCenter: parent.verticalCenter
    verticalAlignment: Text.AlignVCenter
    text: root.text
}
