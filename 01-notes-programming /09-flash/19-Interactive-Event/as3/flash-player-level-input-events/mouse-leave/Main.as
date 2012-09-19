package {
import flash.display.*;
import flash.events.*;
	
	public class Main extends Sprite {
		
		public function Main() {
			// Register for Event.MOUSE_LEAVE events
			stage.addEventListener(Event.MOUSE_LEAVE, mouseLeaveListener);
		}
		
		private function mouseLeaveListener (e:Event):void {
			trace("The mouse has left the building.");
		}
	}
}