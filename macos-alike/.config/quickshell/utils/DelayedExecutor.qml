import QtQuick

Item {
    id: root

    property int delay: 100
    signal triggered

    function run() {
        timer.restart();
    }

    Timer {
        id: timer
        interval: root.delay
        repeat: false
        onTriggered: root.triggered()
    }
}
