import Quickshell.Services.Pipewire
import qs.components.bar
import QtQuick
import qs.utils
import qs.modules.Menus

Item {
    id: volumeWidget
    signal showVolumeMenu
    signal hideVolumeMenu

    implicitWidth: volumeButton.implicitWidth
    implicitHeight: volumeButton.implicitHeight

    property var activeSink: Pipewire.defaultAudioSink
    property int volume: Math.round((activeSink?.audio?.volume ?? 0) * 100)

    property string volumeIcon: {
        if (!activeSink?.audio)
            return "􀊣"; // fallback

        if (activeSink.audio.muted)
            return "􀊣";

        if (volume === 0)
            return "􀊥";
        if (volume < 33)
            return "􀊧";
        if (volume < 66)
            return "􀊩";

        return "􀊩";
    }

    TopButton {
        id: volumeButton
        text: `${volumeIcon}`
        font.pixelSize: 14
        onPressedChanged: {
            if (!checked) {
                MenuManager.open(Menus.volumeMenuLoader);
            } else {
                MenuManager.close(Menus.volumeMenuLoader);
            }
        }
    }
}
