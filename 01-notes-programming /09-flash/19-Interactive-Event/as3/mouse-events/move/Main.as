package 
{
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Harry
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveListener);
		}
		
		private function mouseMoveListener(e:MouseEvent):void {
			trace("mouse on move");
		}
		
	}
	
}