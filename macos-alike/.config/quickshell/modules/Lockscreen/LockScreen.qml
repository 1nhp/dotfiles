import Quickshell
import Quickshell.Wayland
import qs.utils

ShellRoot {
    id: root

    LockContext {
        id: lockContext

        onUnlocked: {
            Globals.screenLocked = false;
        }
    }

    WlSessionLock {
        id: lock
        locked: Globals.screenLocked

        WlSessionLockSurface {
            LockSurface {
                anchors.fill: parent
                context: lockContext
            }
        }
    }
}
