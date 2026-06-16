import Quickshell.Services.Pipewire
import QtQuick
import qs.modules
import qs.services
import qs.utils

Item {
    id: root

    property var activeSink: Pipewire.defaultAudioSink
    property int volume: 0
    property bool muted: false
    property bool ready: false

    PwObjectTracker {
        objects: [root.activeSink]
    }

    signal showOSD(int volume, bool muted)

    Timer {
        id: initTimer
        interval: 300
        repeat: false
        onTriggered: root.ready = true
    }

    Component.onCompleted: {
        syncFromSinkAndShowOSD();
        initTimer.start();
    }

    function syncFromSinkAndShowOSD() {
        if (!activeSink?.audio)
            return;

        const newVolume = Math.round(activeSink.audio.volume * 100);
        const newMuted = activeSink.audio.muted;

        if (newVolume === volume && newMuted === muted)
            return;

        volume = newVolume;
        muted = newMuted;

        if (!root.ready || Globals.menuOpen == "VolumeMenu")
            return;
        root.showOSD(root.volume, root.muted);
    }

    onActiveSinkChanged: syncFromSinkAndShowOSD()

    Connections {
        id: audioConn
        target: root.activeSink ? root.activeSink.audio : null

        function onVolumeChanged() {
            syncFromSinkAndShowOSD();
        }
        function onMutedChanged() {
            syncFromSinkAndShowOSD();
        }
    }
}
