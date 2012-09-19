package {
import flash.display.*;
import flash.events.*;
import flash.text.*;
import flash.ui.Keyboard;
import flash.ui.KeyLocation;
	
	public class Main extends Sprite {
		public static const S_KEY:int = 83;
		
		public function Main():void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
		}
		
		private function keyDownListener (e:KeyboardEvent):void {
			if (e.keyCode == S_KEY && e.ctrlKey == true) {
				trace("Ctrl+S was pressed");
			}
		}
		
		
	}
}