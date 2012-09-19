package {
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		private var _circle:Sprite = new Sprite();
		
		public function Main(  ) 
		{
			_circle.graphics.beginFill(0xff00000);
			_circle.graphics.drawCircle(300, 300, 150);
			_circle.graphics.endFill();
			addChild(_circle);
			
			// add listener to _circle. click _circle call moveCircle function
			// click out side _circle will not call moveCircle
			_circle.addEventListener(MouseEvent.CLICK, moveCircle);
		}
		
		private function moveCircle(event:MouseEvent):void
		{
			_circle.x += 5;
		}
	}
}
