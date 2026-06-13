import Quickshell
import Quickshell.Services.Pipewire
import qs.components.bar
import QtQuick

Item {
    implicitWidth: volumeText.implicitWidth
    implicitHeight: volumeText.implicitHeight
    anchors.verticalCenter: parent.verticalCenter
    anchors.rightMargin: 10

    property var activeSink: Pipewire.defaultAudioSink

    PwObjectTracker {
        objects: [activeSink]
    }

    property int volume: Math.round((activeSink?.audio?.volume ?? 0) * 100)

    property string volumeIcon: {
        if (!activeSink?.audio)
            return "􀊣" // fallback

        if (activeSink.audio.muted)
            return "􀊣"

        if (volume === 0)
            return "􀊥"
        if (volume < 33)
            return "􀊧"
        if (volume < 66)
            return "􀊩"

        return "􀊩"
    }

    TopText {
        id: volumeText
        text: `${volumeIcon}`
    }

}
