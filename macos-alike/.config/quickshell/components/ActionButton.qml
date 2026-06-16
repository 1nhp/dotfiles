import QtQuick
import QtQuick.Controls
import qs.components

Button {
    id: root

    background: Rectangle {
        radius: 8

        color: {
            if (root.checkable) {
                return root.checked ? "#4572dc" : "transparent";
            }

            if (root.down)
                return "transparent";

            if (root.hovered)
                return "#4572dc";

            return "transparent";
        }
    }

    contentItem: CustomText {
        text: root.text
        width: root.width
        font.pixelSize: 14
    }
}
