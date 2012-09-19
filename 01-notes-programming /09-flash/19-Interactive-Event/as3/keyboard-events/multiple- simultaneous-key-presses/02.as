package {
import flash.display.*;
import flash.events.*;
import flash.ui.*;
	
	public class Main extends Sprite {
		// Tracks the state of the Up Arrow key (true when pressed; false otherwise)
		private var upPressed:Boolean;
		// Tracks the state of the Left Arrow key (true when pressed; false otherwise)
		private var leftPressed:Boolean;
		
		public function Main():void {
			// Register for keyboard events
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpListener);
		}
		
		// Handles KeyboardEvent.KEY_DOWN events
		private function keyDownListener (e:KeyboardEvent):void {
			// Make a note of whether the Up Arrow key or Left Arrow key was pressed
			if (e.keyCode == Keyboard.UP) {
				upPressed = true;
			} else if (e.keyCode == Keyboard.LEFT) {
				leftPressed = true;
			}
			// If the Up Arrow key and the Left Arrow key are both pressed...
			if (upPressed && leftPressed) {
				// ...take some application-specific action, such as steering a
				// spaceship diagonally and up and to the left
				trace("Up Arrow key and Left Arrow key are both pressed");
			}
		}
		
		// Handles KeyboardEvent.KEY_UP events
		private function keyUpListener (e:KeyboardEvent):void {
			// Make a note of whether the Up Arrow key or Left Arrow
			// key was released
			if (e.keyCode == Keyboard.UP) {
				upPressed = false;
			} else if (e.keyCode == Keyboard.LEFT) {
				leftPressed = false;
			}
		}
	}
}