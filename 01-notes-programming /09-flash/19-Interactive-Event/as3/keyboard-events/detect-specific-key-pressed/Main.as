package {
import flash.display.*;
import flash.events.*;
import flash.text.*;
import flash.ui.Keyboard;
	
	public class Main extends Sprite {
		private var keyoutput:TextField;
		
		public function Main():void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
		}
		
		private function keyDownListener (e:KeyboardEvent):void {
			//detect if Escape key is pressed
			if (e.keyCode == Keyboard.ESCAPE) {
				trace("The Escape key was pressed");
			}
		}
		
		
	}
}