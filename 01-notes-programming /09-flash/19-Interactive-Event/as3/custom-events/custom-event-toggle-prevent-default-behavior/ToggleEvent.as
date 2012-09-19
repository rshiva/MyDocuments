package {
	import flash.events.*;


	public class ToggleEvent extends Event {

		public static const TOGGLE:String="toggle";
		public static const TOGGLE_ATTEMPT:String="toggleAttempt";
		public var isOn:Boolean;

		public function ToggleEvent(type:String,bubbles:Boolean = false,cancelable:Boolean = false,isOn:Boolean = false) {
			super(type, bubbles, cancelable);
			// Remember the toggle switch's state so it can be accessed within ToggleEvent.TOGGLE listeners
			this.isOn=isOn;
		}

		// Every custom event class must override clone( )
		public override function clone( ):Event {
			return new ToggleEvent(type, bubbles, cancelable, isOn);
		}

		// Every custom event class must override toString( ).
		public override function toString( ):String {
			return formatToString("ToggleEvent", "type", "bubbles","cancelable", "eventPhase", "isOn");
		}
	}
}