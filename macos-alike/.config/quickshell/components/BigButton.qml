import QtQuick
import QtQuick.Controls
import qs.components

Button {
    id: root

    property string colorVariant: "blue"

    implicitHeight: 30
    implicitWidth: 160

    background: Rectangle {
        radius: 14
        color: {
            if (colorVariant === "blue") {
                if (!root.enabled)
                    return "#2a50a0";
                if (root.down)
                    return "#3a70c0";
                return "#4580dc";
            }
            if (colorVariant === "grey") {
                if (!root.enabled)
                    return "#202020";
                if (root.down)
                    return "#404040";
                return "#303030";
            }
            return "transparent";
        }
    }

    contentItem: CustomText {
        text: root.text
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        opacity: root.enabled ? 1.0 : 0.5
    }
}
