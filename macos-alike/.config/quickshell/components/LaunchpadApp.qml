import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import qs.components
import Qt5Compat.GraphicalEffects

Button {
    id: entry
    required property var modelData
    required property int index
    implicitWidth: 200
    implicitHeight: 170

    background: null
    onClicked: {
        list.currentIndex = entry.index;
        launchpad.launchSelected();
    }

    Column {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 10
        width: parent.width

        IconImage {
            id: appIcon
            source: Quickshell.iconPath(modelData.icon, true)
            width: 96
            height: 96
            asynchronous: true
            anchors.horizontalCenter: parent.horizontalCenter

            BrightnessContrast {
                anchors.fill: appIcon
                source: appIcon
                brightness: entry.down ? -0.2 : 0
            }
        }

        CustomText {
            width: parent.width
            color: "white"
            text: modelData.name
            font.pixelSize: 18

            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
        }
    }

    Keys.onReturnPressed: launchpad.launchSelected()
}
