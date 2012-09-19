package {
import flash.display.*;
import flash.events.*;
	
	public class Main extends Sprite {
		public function Main() {
			stage.addEventListener(MouseEvent.CLICK, clickListener);
		}
		
		private function clickListener (e:MouseEvent):void {
			if (e.shiftKey) {
				trace("Shift+click detected");
			}
		}
	}
}