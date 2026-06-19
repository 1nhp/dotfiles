pragma Singleton
import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.components.bar
import qs.components

import qs.widgets
import qs.modules.Lockscreen
import qs.services
import qs.utils

Item {
    LazyLoader {
        id: volumeMenuLoader
        sourceComponent: VolumeMenu {}
    }

    LazyLoader {
        id: batteryMenuLoader
        sourceComponent: BatteryMenu {}
    }

    LazyLoader {
        id: startMenuLoader
        sourceComponent: StartMenu {}
    }

    LazyLoader {
        id: dockMenuLoader
        sourceComponent: DockMenu {}
    }

    LazyLoader {
        id: launchpadLoader
        sourceComponent: Launchpad {}
    }

    property alias volumeMenuLoader: volumeMenuLoader
    property alias batteryMenuLoader: batteryMenuLoader
    property alias startMenuLoader: startMenuLoader
    property alias dockMenuLoader: dockMenuLoader
    property alias launchpadLoader: launchpadLoader
}
