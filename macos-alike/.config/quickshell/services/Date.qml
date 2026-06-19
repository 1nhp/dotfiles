pragma Singleton
import Quickshell
import QtQuick

Item {
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    property string time: Qt.formatDateTime(clock.date, "hh:mm")
    property string time_date: Qt.formatDateTime(clock.date, "ddd MMM d HH:mm")
    property string day: Qt.formatDateTime(clock.date, "ddd MMM d")
}
