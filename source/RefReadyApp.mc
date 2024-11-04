import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class RefReadyApp extends Application.AppBase {

    private var _view;
    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        _view = new RefReadyView();
        return [ _view, new MatchDelegate() ];
    }

    function getView() as RefReadyView {
        return _view;
    }

    function updateView(newView as View) as Void{
        _view = newView;
    }
}

function getApp() as RefReadyApp {
    return Application.getApp() as RefReadyApp;
}

function getView() as RefReadyView {
    return getApp().getView();
}