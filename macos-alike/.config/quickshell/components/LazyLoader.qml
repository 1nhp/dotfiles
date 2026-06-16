import QtQuick
import qs.utils

Item {
    id: root

    property Component sourceComponent
    property alias item: loader.item

    function open() {
        loader.active = true;
        console.log("[LazyLoader] Menu " + item + " opened");
        if (loader.item)
            loader.item.visible = true;
        Globals.menuOpen = loader.item.objectName;
    }

    function close() {
        console.log("[LazyLoader] Menu " + item + " closed");
        loader.active = false;
        Globals.menuOpen = null;
    }

    Loader {
        id: loader
        active: false
        sourceComponent: root.sourceComponent
    }
}
