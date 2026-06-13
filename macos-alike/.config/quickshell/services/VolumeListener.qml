import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Item {
    id: root

    signal showOSD(int volume, bool muted)

    property var activeSink: Pipewire.defaultAudioSink
    property int volume: 0
    property bool muted: false

    property int initSkip: 2

    PwObjectTracker {
        objects: [root.activeSink]
    }

    Connections {
        target: root.activeSink?.audio

        function onVolumeChanged() {
            if (!root.activeSink?.audio)
                return;
            const v = Math.round(root.activeSink.audio.volume * 100);
            root.volume = v;

            if (root.initSkip > 0) {
                root.initSkip--;
                return;
            }

            console.log(v);
            root.showOSD(v, muted);
        }

        function onMutedChanged() {
            if (!root.activeSink?.audio)
                return;
            muted = root.activeSink.audio.muted;
            const v = Math.round(root.activeSink.audio.volume * 100);

            root.volume = v;
            root.showOSD(v, muted);
        }
    }

    Component.onCompleted: {
        if (activeSink?.audio) {
            volume = Math.round(activeSink.audio.volume * 100);
        }
    }
}
