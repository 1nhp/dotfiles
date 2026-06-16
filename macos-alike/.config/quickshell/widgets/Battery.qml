import QtQuick
import qs.components.bar
import Quickshell.Services.UPower
import qs.utils
import qs.modules.Menus

Item {
    id: batteryWidget
    implicitWidth: batteryButton.implicitWidth
    implicitHeight: batteryButton.implicitHeight

    property var device: UPower.displayDevice
    property int percentage: device ? Math.round(device.percentage * 100) : 0
    property bool charging: device ? device.state === UPowerDeviceState.Charging || device.state === UPowerDeviceState.FullyCharged : false

    property string batteryIcon: {
        if (!device)
            return "􀛪";
        if (charging)
            return "􀨣";
        if (percentage > 77) // Max battery percentage change to your battery's maximum percentage
            return "􀛨";
        if (percentage > 60)
            return "􀺸";
        if (percentage > 40)
            return "􀺶";
        if (percentage > 20)
            return "􀛩";
        if (percentage > 5)
            return "􀛪";
        return "􀛪";
    }

    TopButton {
        id: batteryButton
        text: `${batteryIcon}`
        font.pixelSize: 14

        onPressedChanged: {
            if (!checked) {
                MenuManager.open(Menus.batteryMenuLoader);
            } else {
                MenuManager.close(Menus.batteryMenuLoader);
            }
        }
    }
}
