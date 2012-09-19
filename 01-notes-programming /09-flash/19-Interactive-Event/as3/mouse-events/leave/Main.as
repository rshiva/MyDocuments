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
			stage.addEventListener(Event.MOUSE_LEAVE, mouseLeave);
		}
		
		private function mouseLeave(e:Event):void {
			trace("mouse leave the display area");
		}
		
	}
	
}