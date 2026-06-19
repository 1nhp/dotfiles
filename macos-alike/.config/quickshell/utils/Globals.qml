pragma Singleton
import QtQuick

QtObject {
    property bool screenLocked: false
    property var menuOpen: ""

    // Dock
    property int dockpid: -1
    property string dockMenuProgram: ""
}
