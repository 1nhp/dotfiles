pragma Singleton
import QtQuick
import qs.modules
import qs.modules.Menus
import qs.utils

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

    function openDockMenu(pid, program, anchorItem) {
        Globals.dockMenuProgram = program;
        Globals.dockpid = pid;
        open(Menus.dockMenuLoader);
        console.log("PID: " + pid);
    }
}
