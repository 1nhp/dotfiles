import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config

PanelWindow {
    id: dockRoot
    color: "transparent"
    focusable: false
    aboveWindows: true
    WlrLayershell.layer: WlrLayer.Top

    mask: Region {
        Region {
            x: dockBar.x
            y: dockBar.y
            width: dockBar.width
            height: dockBar.height
        }
        Region {
            x: 0
            y: dockRoot.height - 2
            width: dockRoot.width
            height: 2
        }
    }
    anchors {
        bottom: true
        left: true
        right: true
    }

    exclusiveZone: -1
    implicitHeight: 190

    DockPopup {
        id: dockPopup
    }

    property var orderedApps: []
    property bool dockVisible: true
    property bool mouseOverDockArea: triggerHover.hovered || dockHover.hovered

    function updateOrderedApps() {
        let apps = [];
        for (const app of DockApps.apps) {
            apps.push({
                icon: app.icon,
                name: app.name,
                cmd: app.cmd,
                order: app.order
            });
        }
        apps.sort((a, b) => a.order - b.order);
        orderedApps = apps;
    }

    function getToplevelsForApp(cmd) {
        const match = cmd.toLowerCase();
        let results = [];
        for (const tl of Hyprland.toplevels.values) {
            const appId = (tl.wayland?.appId ?? "").toLowerCase();
            if (appId.includes(match)) {
                results.push({
                    toplevel: tl,
                    pid: tl.lastIpcObject?.pid ?? -1
                });
            }
        }
        return results;
    }

    function showDockBar() {
        hideTimer.stop();

        if (!dockVisible) {
            dockVisible = true;
            hideDock.stop();
            showDock.start();
        }
    }

    function scheduleHide() {
        hideTimer.restart();
    }

    Component.onCompleted: {
        updateOrderedApps();
        scheduleHide();
    }

    Rectangle {
        id: triggerStrip
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2
        color: "transparent"

        HoverHandler {
            id: triggerHover
            onHoveredChanged: hovered ? showDockBar() : scheduleHide()
        }
    }

    Timer {
        id: hideTimer
        interval: 5000
        repeat: false

        onTriggered: {
            if (dockRoot.mouseOverDockArea)
                return;

            dockRoot.dockVisible = false;
            showDock.stop();
            hideDock.start();
        }
    }

    SequentialAnimation {
        id: hideDock
        NumberAnimation {
            target: dockBar
            property: "anchors.bottomMargin"
            from: 6
            to: -100
            duration: 300
            easing.type: Easing.InQuad
        }
    }

    SequentialAnimation {
        id: showDock
        NumberAnimation {
            target: dockBar
            property: "anchors.bottomMargin"
            from: -100
            to: 6
            duration: 300
            easing.type: Easing.OutQuad
        }
    }

    Rectangle {
        id: dockBar
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6

        implicitWidth: row.implicitWidth + 24
        implicitHeight: row.implicitHeight + 24

        color: "#101010"
        radius: 18
        border.color: "#5c5d61"
        border.width: 1

        HoverHandler {
            id: dockHover
            onHoveredChanged: hovered ? hideTimer.stop() : scheduleHide()
        }

        RowLayout {
            id: row

            Repeater {
                model: dockRoot.orderedApps

                delegate: DockButton {
                    appIcon: modelData.icon
                    appName: modelData.name
                    program: modelData.cmd
                    dock: dockRoot

                    toplevels: dockRoot.getToplevelsForApp(modelData.cmd)
                    isRunning: toplevels.length > 0

                    onIsRunningChanged: {
                        Hyprland.refreshToplevels();
                    }

                    pid: toplevels.length > 0 ? toplevels[0].pid : 0
                }
            }

            anchors.centerIn: parent
            spacing: 12
        }
    }
}
