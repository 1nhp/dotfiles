import QtQuick
import Quickshell
import qs.components.bar

Item {
    implicitWidth: clockText.implicitWidth
    implicitHeight: clockText.implicitHeight

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    TopText {
        id: clockText
        text: Qt.formatDateTime(clock.date, "ddd MMM d HH:mm")
    }
}
