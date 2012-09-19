package {

	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// create a simpleButton instance
			var Btn:SimpleButton = new SimpleButton();
			
			// define the button location
			Btn.x = 400;
			Btn.y = 200;
			
			// define button state by custom function
			Btn.upState = drawCircle(0x00FF00, 100);
			Btn.overState = drawCircle(0xffffff, 105);
			Btn.downState = drawCircle(0xcccccc, 100);
			Btn.hitTestState = Btn.upState;
			
			// add event listener to button
			Btn.addEventListener(MouseEvent.CLICK, outPut);
			
			// add button to display list
			addChild(Btn);
		}
		
		private function drawCircle(color:Number,radius:Number):Shape
		{
			var circle:Shape = new Shape();
			circle.graphics.lineStyle(1, 0x000000);
			circle.graphics.beginFill(color);
			circle.graphics.drawCircle(0, 0, radius);
			circle.graphics.endFill();
			return circle;
		}
		
		private function outPut(event:MouseEvent):void
		{
			trace("Click");
		}
		
	}
}
