import qs.components.bar
import QtQuick
import qs.utils
import qs.modules.Menus

TopButton {
    id: startButtonWidget
    signal showStartMenu
    signal hideStartMenu
    leftPadding: 22
    rightPadding: 22

    Image {
        source: Qt.resolvedUrl("../assets/cachyos.png")
        width: 24
        height: 24
        fillMode: Image.PreserveAspectFit
        anchors.centerIn: parent
    }

    font.pixelSize: 23
    checkable: true
    topPadding: -4

    onPressedChanged: {
        if (!checked) {
            MenuManager.open(Menus.startMenuLoader);
        } else {
            MenuManager.close(Menus.startMenuLoader);
        }
    }
}
