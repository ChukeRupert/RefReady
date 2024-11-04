import Toybox.Lang;
import Toybox.WatchUi;

class RefReadyDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new RefReadyMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}