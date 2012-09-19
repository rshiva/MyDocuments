package {
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		private var _circle:Sprite = new Sprite();
		
		public function Main(  ) 
		{
			drawCircle();
			stage.addEventListener(MouseEvent.MOUSE_DOWN, moveCircle);
			stage.addEventListener(MouseEvent.MOUSE_UP, stopCircle);
		}
		
		private function drawCircle():void
		{
			_circle.graphics.beginFill(0xff00000);
			_circle.graphics.drawCircle(150, 300, 150);
			_circle.graphics.endFill();
			addChild(_circle);
		}
		
		private function moveCircle(event:MouseEvent):void
		{
			_circle.addEventListener(Event.ENTER_FRAME, move);
		}
		
		private function stopCircle(event:MouseEvent):void
		{
			_circle.removeEventListener(Event.ENTER_FRAME,move);
		}
		
		private	function move(event:Event):void
		{
			_circle.x += 5;
		}
	}
}
