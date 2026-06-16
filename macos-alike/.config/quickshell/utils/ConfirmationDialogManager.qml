pragma Singleton
import QtQuick
import qs.modules
import qs.modules.Menus
import qs.components

QtObject {
    function show(title, text, onAccept, type = "normal") {
        let dialog = dialogComponent.createObject();
        dialog.dialogText = text;
        dialog.dialogTitle = title;
        dialog.dialogType = type;
        dialog.accepted.connect(function () {
            if (onAccept)
                onAccept();
            dialog.destroy();
        });
        dialog.rejected.connect(function () {
            dialog.destroy();
        });
        dialog.visible = true;
    }

    property Component dialogComponent: Component {
        ConfirmationDialog {}
    }
}
