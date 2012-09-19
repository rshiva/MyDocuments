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
			_circle.doubleClickEnabled = true;
			addChild(_circle);
			_circle.addEventListener(MouseEvent.DOUBLE_CLICK,removeCircle);
		}
		
		private function removeCircle(event:MouseEvent):void
		{
			removeChild(_circle);
		}
	}
}
