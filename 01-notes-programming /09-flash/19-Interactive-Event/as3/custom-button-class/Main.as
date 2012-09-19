package {

	import flash.display.*;
	import flash.events.*;
	import flash.display.Shape;
	
	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			var btn:RectangleButton = new RectangleButton("button", 100, 40);
			btn.x = 400;
			btn.y = 300;
			addChild(btn);
			
			btn.addEventListener(MouseEvent.CLICK, outPut);
		}
		
		private function outPut(event:MouseEvent):void
		{
			trace("Click the button");
		}
		
	}
}
