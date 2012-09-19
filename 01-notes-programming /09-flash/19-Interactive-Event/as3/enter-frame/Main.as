package {
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		private var _circle:Shape = new Shape();
		
		public function Main(  ) 
		{
			drawCircle();
			
			// stage listen enterframe event to call moveCircle function
			stage.addEventListener(Event.ENTER_FRAME, moveCircle);
		}
		
		private function drawCircle():void
		{
			_circle.graphics.beginFill(0xff00000);
			_circle.graphics.drawCircle(0, 250, 150);
			_circle.graphics.endFill();
			addChild(_circle);
		}
		
		private function moveCircle(event:Event):void
		{
			_circle.x += 5;
		}
	}
}
