import Quickshell.Hyprland
import Quickshell
import qs.utils
import qs.modules
import qs.modules.Menus

ShellRoot {
    GlobalShortcut {
        name: "launchpad"
        description: "Open launchpad"

        onPressed: {
            console.log(Globals.menuOpen);
            if (Globals.menuOpen == "Launchpad") {
                MenuManager.close(Menus.launchpadLoader);
            } else {
                MenuManager.open(Menus.launchpadLoader);
            }
        }
    }
}
