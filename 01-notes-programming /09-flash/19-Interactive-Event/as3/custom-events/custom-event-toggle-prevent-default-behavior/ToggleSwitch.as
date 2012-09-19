package {
	import flash.display.*;
	import flash.events.*;

	public class ToggleSwitch extends Sprite {

		private var isOn:Boolean;
		private var icon:Sprite;
		
		public function ToggleSwitch( ) {
			icon = new Sprite( );
			addChild(icon);
			isOn=false;
			drawOffState( );
			icon.addEventListener(MouseEvent.CLICK, clickListener);
		}
		
		private function clickListener(e:MouseEvent):void {
			// The user has attempted to turn the switch on or off, so ask ActionScript to dispatch a ToggleEvent.TOGGLE_ATTEMPT event,
			// targeted at this ToggleSwitch object. First create the event object...
			var toggleEvent:ToggleEvent =new ToggleEvent(ToggleEvent.TOGGLE_ATTEMPT,true, true);
			dispatchEvent(toggleEvent);
			// The ToggleEvent.TOGGLE_ATTEMPT event dispatch is now complete.
			// If no listener prevented the default event behavior...
			if (! toggleEvent.isDefaultPrevented()) {
				// ...then toggle the switch
				toggle( );
			}
		}
		// Turns the switch on if it is currently off, or off if it is
		// currently on. Note that the switch can be toggled programmatically,
		// even if the user does not have privileges to toggle it manually.
		public function toggle( ):void {
			isOn=! isOn;
			if (isOn) {
				drawOnState( );
			} else {
				drawOffState( );
			}
			// Ask ActionScript to dispatch a ToggleEvent.TOGGLE event, targeted
			// at this ToggleSwitch object
			var toggleEvent:ToggleEvent = new ToggleEvent(ToggleEvent.TOGGLE,true, false, isOn);
			dispatchEvent(toggleEvent);
		}
		
		// Draws the graphics for the off state
		private function drawOffState( ):void {
			icon.graphics.clear( );
			icon.graphics.lineStyle(1);
			icon.graphics.beginFill(0xFFFFFF);
			icon.graphics.drawRect(0, 0, 20, 20);
		}
		// Draws the graphics for the on state
		private function drawOnState( ):void {
			icon.graphics.clear( );
			icon.graphics.lineStyle(1);
			icon.graphics.beginFill(0xFFFFFF);
			icon.graphics.drawRect(0, 0, 20, 20);
			icon.graphics.beginFill(0x000000);
			icon.graphics.drawRect(5, 5, 10, 10);
		}
	}
}