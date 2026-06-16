pragma Singleton
import QtQuick
import Quickshell.Services.Pipewire
import qs.utils

QtObject {
    id: volumeControl
    property var activeSink: Pipewire.defaultAudioSink
    property real volume: activeSink?.audio?.volume ?? 0

    function setVolume(targetLevel) {
        activeSink.audio.volume = Math.max(0, Math.min(1, targetLevel));
    }
}
