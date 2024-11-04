import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Timer;
import Toybox.Attention;

class playPeriod extends WatchUi.BehaviorDelegate {
    
    private static var totalSeconds;

    private static var endVibeData = 
        [
            new Attention.VibeProfile(40, 500),
            new Attention.VibeProfile(40, 500),
            new Attention.VibeProfile(40, 500)
        ];

    private var _isPaused = false;

    private var _currentUp = 0;
    private var _currentDown;
    private var _currentAdded = 0;
    private var _periodType;

    private var _timer = new Timer.Timer();
    private var _view;

    function initialize(halfLen, periodType){
        _currentDown = halfLen * 60; // Set the countdown time to the half length in seconds
        _periodType = periodType;
        _view = getView(); // Set _view to the current app view

        startCountdown(); // Start the countdown
    }

    function onSelect() as Boolean{
        _isPaused = !_isPaused;
        return true;
    }
    
    function updateTimers(){
        
        if (_isPaused){
            _currentAdded++;    // Increase added time counter
        }
        else{
            _currentDown--;     // Decrease remaining time counter
        }

        _currentUp++;
        _view.setUpTimerValue(_currentUp);
        _view.setDownTimerValue(_currentDown);
        _view.setAddedTimerValue(_currentAdded);

        WatchUi.requestUpdate();
    }

    function startCountdown() {
        
        _isPaused = false;

        _timer.start(method(:updateTimers), 1000, true); // Call update function every 1000ms (1s)
    }
}