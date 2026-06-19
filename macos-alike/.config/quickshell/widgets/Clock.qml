import QtQuick
import Quickshell
import qs.components.bar
import qs.services

Item {
    implicitWidth: clockText.implicitWidth
    implicitHeight: clockText.implicitHeight

    TopText {
        id: clockText
        text: Date.time_date
    }
}
