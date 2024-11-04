import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Timer;
import Toybox.Attention;

class MatchDelegate extends WatchUi.BehaviorDelegate {
    private static var halfLength = 1;
    private static var totalSeconds;

    private static var endVibeData = 
        [
            new Attention.VibeProfile(40, 500),
            new Attention.VibeProfile(40, 500),
            new Attention.VibeProfile(40, 500)
        ];
    
    private static var startVibeData = 
        [
            new Attention.VibeProfile(40, 500),
            new Attention.VibeProfile(70, 500),
            new Attention.VibeProfile(40, 500)
        ];
    private var _inProgress = false;
    private var _isPaused = false;
    private var _period;

    private var _currentUp;
    private var _currentDown;
    private var _currentAdded;

    private var _timer = new Timer.Timer(); 
    private var _view = getView();
    private var _playPeriod;
    private var _currentPeriodType;

    function initialize() {
        BehaviorDelegate.initialize();
        _currentPeriodType = periods.FirstHalf;
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new RefReadyMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onSelect() as Boolean {
        if (_playPeriod == null) {
            _playPeriod = new playPeriod(halfLength, _currentPeriodType);
        }
        else{
            _playPeriod.onSelect();
        }
        // TODO: set view to playPeriodView
        return true;
    }

    function onBack() as Boolean{
        // TODO: set view to match menu
    }

}