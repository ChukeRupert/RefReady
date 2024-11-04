import Toybox.Graphics;
import Toybox.WatchUi;

class RefReadyView extends WatchUi.View {

    private var _countupTimerElement;
    private var _countdownTimerElement;
    private var _addedTimeElement;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));

        _countupTimerElement = findDrawableById("countup_timer");
        _countdownTimerElement = findDrawableById("countdown_timer");
        _addedTimeElement = findDrawableById("curr_time");

    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    function setUpTimerValue(value) as Void {
        var minutes = value/60;
        
        var seconds = value%60;
        var secondsFormatted = seconds > 9 ? seconds.toString() : "0" + seconds.toString();

        var formattedValue = minutes.toString() + ":" + secondsFormatted;

        _countupTimerElement.setText(formattedValue);

        //WatchUi.requestUpdate();
    }
    
    function setDownTimerValue(value) as Void {
        var minutes = value/60;
        
        var seconds = value%60;
        var secondsFormatted = seconds > 9 ? seconds.toString() : "0" + seconds.toString();

        var formattedValue = minutes.toString() + ":" + secondsFormatted;

        _countdownTimerElement.setText(formattedValue);

        //WatchUi.requestUpdate();
    }

    function setAddedTimerValue(value) as Void {
        var minutes = value/60;
        
        var seconds = value%60;
        var secondsFormatted = seconds > 9 ? seconds.toString() : "0" + seconds.toString();

        var formattedValue = minutes.toString() + ":" + secondsFormatted;

        _addedTimeElement.setText(formattedValue);

        //WatchUi.requestUpdate();
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
