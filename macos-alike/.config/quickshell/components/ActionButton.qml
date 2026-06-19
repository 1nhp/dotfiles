import QtQuick
import QtQuick.Controls
import qs.components

Button {
    id: root
    font.pixelSize: 14
    property bool hoverBox: true
    property var textColor: "white"

    background: Rectangle {
        radius: 8

        color: {
            if (hoverBox && root.enabled) {
                if (root.checkable) {
                    return root.checked ? "#4572dc" : "transparent";
                }

                if (root.down)
                    return "transparent";

                if (root.hovered)
                    return "#4572dc";

                return "transparent";
            }
            return "transparent";
        }
    }

    contentItem: CustomText {
        text: root.text
        width: root.width
        font.pixelSize: root.font.pixelSize
        color: root.enabled ? textColor : "#505050"
    }
}
