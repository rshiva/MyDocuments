package {
import flash.display.*;
import flash.events.*;
	
	public class Main extends Sprite {
		
		public function Main() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.RESIZE, resizeListener);
		}
		
		private function resizeListener (e:Event):void {
			trace("Flash Player was resized");
		}
	}
}