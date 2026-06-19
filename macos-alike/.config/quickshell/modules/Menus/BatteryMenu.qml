import QtQuick
import Quickshell
import qs.services
import Quickshell.Hyprland
import qs.utils
import qs.components
import Quickshell.Io
import Quickshell.Services.UPower
import QtQuick.Layouts

PanelWindow {
    id: batteryMenuRoot
    visible: false
    color: "transparent"
    objectName: "BatteryMenu"

    implicitWidth: 290
    implicitHeight: 150

    anchors {
        top: true
        right: true
    }

    mask: Region {
        item: batteryMenu
    }

    property var device: UPower.displayDevice
    property int percentage: device ? Math.round(device.percentage * 100) : 0
    property int timeToFull: device ? device.timeToFull : 0
    property int timeToEmpty: device ? device.timeToEmpty : 0

    // Charging: count down to full; discharging: count down to empty
    property int totalSeconds: charging ? timeToFull : timeToEmpty
    property int hours: Math.floor(totalSeconds / 3600)
    property int minutes: Math.floor((totalSeconds % 3600) / 60)

    property bool charging: device ? device.state === UPowerDeviceState.Charging || device.state === UPowerDeviceState.FullyCharged : false

    // Check profile vendors
    property string profile: PowerProfile.toString(PowerProfiles.profile)

    margins.top: 10

    Rectangle {
        id: batteryMenu
        width: 270
        height: 150
        color: Qt.rgba(0, 0, 0, 1)
        radius: 18
        border.color: "#101010"   // Border color
        border.width: 1          // Border thickness

        Rectangle {
            anchors.fill: parent
            anchors.margins: 2

            color: "transparent"
            border.color: "#5c5d61"
            border.width: 1
            radius: parent.radius - anchors.margins

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                RowLayout {
                    Layout.fillWidth: true

                    CustomText {
                        text: "Battery"
                        font.pixelSize: 14
                        bottomPadding: 5
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    CustomText {
                        text: `${percentage}%`
                        font.pixelSize: 14
                        color: "#848e97"
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop

                    CustomText {
                        text: {
                            if (charging) {
                                return "Power Source: Power Adapter";
                            } else {
                                return "Power Source: Battery";
                            }
                        }

                        color: "#848e97"
                        font.pixelSize: 14
                    }

                    CustomText {
                        text: {
                            if (device.state === UPowerDeviceState.FullyCharged) {
                                return "Fully Charged";
                            } else if (device.state === UPowerDeviceState.Charging) {
                                return totalSeconds > 0 ? "Charging — " + hours + "h " + minutes + "m to full" : "Charging...";
                            } else {
                                return totalSeconds > 0 ? hours + "h " + minutes + "m remaining" : "...";
                            }
                        }
                        color: "#848e97"
                        font.pixelSize: 14
                    }

                    Line {}

                    Process {
                        id: lowPowerMode
                        command: ["powerprofilesctl", "set", "power-saver"]
                    }
                    Process {
                        id: performanceMode
                        command: ["powerprofilesctl", "set", "performance"]
                    }

                    CustomText {
                        text: "Energy Mode"
                        color: "#848e97"
                        font.pixelSize: 14
                    }

                    ActionButton {
                        id: lowPowerButton
                        text: "􀛩Low Power"
                        checkable: true
                        font.pixelSize: 14
                        Layout.fillWidth: true

                        checked: profile === "PowerSaver"

                        onReleased: {
                            if (checked) {
                                lowPowerMode.running = true;
                            } else {
                                console.log(profile);
                                lowPowerMode.running = false;
                                performanceMode.running = true;
                            }
                        }
                    }
                }
            }
        }
    }
}
