package {
  import flash.events.*;

  // A class representing the custom "toggle" event
  public class ToggleEvent extends Event {

    public static const TOGGLE:String = "toggle";
    public var isOn:Boolean;
    
    // Constructor
    public function ToggleEvent (type:String,bubbles:Boolean = false,cancelable:Boolean = false,isOn:Boolean = false) {
      
		// Pass constructor parameters to the superclass constructor
      super(type, bubbles, cancelable);
      
      // Store the toggle switch's state so it can be accessed within ToggleEvent.TOGGLE listeners
      this.isOn = isOn;
    }
  }
}