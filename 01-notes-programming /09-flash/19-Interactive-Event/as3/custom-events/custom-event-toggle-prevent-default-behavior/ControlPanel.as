package {
	import flash.display.*;

	public class ControlPanel extends Sprite {

		// private var userType:int=UserType.GUEST;
		private var userType:int=UserType.ADMIN;

		public function ControlPanel( ) {
			var toggleSwitch:ToggleSwitch = new ToggleSwitch( );
			toggleSwitch.addEventListener(ToggleEvent.TOGGLE_ATTEMPT,toggleAttemptListener);
			toggleSwitch.addEventListener(ToggleEvent.TOGGLE,toggleListener);
			addChild(toggleSwitch);
		}
		
		// Listener executed whenever a ToggleEvent.TOGGLE_ATTEMPT event occurs
		private function toggleAttemptListener(e:ToggleEvent):void {
			// If the user is a guest...
			if (userType==UserType.GUEST) {
				// ...deny the attempted use of the toggle switch
				e.preventDefault( );
			}
		}
		
		// Listener executed whenever a ToggleEvent.TOGGLE event occurs
		private function toggleListener(e:ToggleEvent):void {
			if (e.isOn) {
				trace("The ToggleSwitch is now on.");
			} else {
				trace("The ToggleSwitch is now off.");
			}
		}
	}
}