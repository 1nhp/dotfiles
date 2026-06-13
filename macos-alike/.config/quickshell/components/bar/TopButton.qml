import QtQuick
import QtQuick.Controls

Button {
    id: root

    background: Rectangle {
        radius: 20
        color: root.down
            ? Qt.rgba(255, 255, 255, 0.15)
            : "transparent"
    }

    contentItem: TopText {
        text: root.text
        font.pixelSize: root.font.pixelSize
    }
}
