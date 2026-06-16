pragma Singleton
import QtQuick

QtObject {
    property var activeMenu: null

    function open(menu, isPopup = true) {
        if (isPopup && activeMenu && activeMenu !== menu)
            activeMenu.close();

        activeMenu = menu;
        menu.open();
    }

    function close(menu, isPopup = true) {
        if (isPopup && activeMenu === menu)
            activeMenu = null;

        menu.close();
    }
}
