import QtQuick
import QtQuick.Controls
import Quickshell
import qs.components
import qs.modules
import qs.modules.Menus
import qs.utils
import Quickshell.Wayland

PanelWindow {
    id: launchpad

    visible: true
    color: Qt.rgba(0, 0, 0, 0.8)
    width: screen.width
    height: screen.height + 30
    focusable: true
    WlrLayershell.namespace: "launchpad"

    property string query: ""

    function launchSelected() {
        if (list.currentItem && list.currentItem.modelData) {
            list.currentItem.modelData.execute();
            MenuManager.close(Menus.launchpadLoader);
        }
    }

    Column {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: header
            width: parent.width
            height: 80
            color: "transparent"

            TextField {
                id: input
                anchors.centerIn: parent
                width: Math.min(300, parent.width * 0.6)
                height: Math.min(38, parent.height * 0.6)

                placeholderText: "􀊫 Search"
                font.pixelSize: 18
                color: "#909090"
                placeholderTextColor: "#909090"
                horizontalAlignment: TextInput.AlignHCenter

                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 40
                    color: "#303030"
                    border.color: "#707070"
                    radius: 4
                }

                focus: true

                onTextChanged: {
                    launchpad.query = text;
                    list.currentIndex = filtered.values.length > 0 ? 0 : -1;
                }

                Keys.onEscapePressed: MenuManager.close(Menus.launchpadLoader)

                Keys.onPressed: event => {
                    const ctrl = event.modifiers & Qt.ControlModifier;

                    if ([Qt.Key_Return, Qt.Key_Enter].includes(event.key)) {
                        event.accepted = true;
                        launchpad.launchSelected();
                    }
                }
            }
        }

        Item {
            id: gridArea
            width: parent.width
            height: parent.height - header.height
            clip: true

            Item {
                id: centerWrapper
                width: Math.min(parent.width, Math.floor(parent.width / 200) * 200)
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter

                GridView {
                    id: list
                    anchors.fill: parent

                    clip: true
                    model: filtered.values
                    cellWidth: 256
                    cellHeight: 256

                    keyNavigationWraps: true
                    highlightMoveDuration: 120

                    currentIndex: filtered.values.length > 0 ? 0 : -1

                    highlight: Rectangle {
                        radius: 6
                        opacity: 0.5
                        color: "#4572dc"
                    }

                    delegate: LaunchpadApp {}
                }
            }
        }
    }

    ScriptModel {
        id: allApps
        values: [...DesktopEntries.applications.values].filter(d => d.name).sort((a, b) => a.name.localeCompare(b.name))
    }

    ScriptModel {
        id: filtered
        values: {
            const q = launchpad.query.trim().toLowerCase();
            if (q === "")
                return allApps.values;

            return allApps.values.filter(d => (d.name || "").toLowerCase().includes(q) || (d.comment || "").toLowerCase().includes(q));
        }
    }
}
