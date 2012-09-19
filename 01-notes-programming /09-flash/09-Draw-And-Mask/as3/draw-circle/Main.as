package 
{
	import flash.display.*;
	import flash.events.*;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// draw a outline circle
			drawCircle1();
			
			// draw a circle with fill color
			drawCircle2();
		}
		
		private function drawCircle1():void
		{
			var _shape:Shape = new Shape();
			_shape.graphics.lineStyle(1, 0);
			_shape.graphics.drawCircle(200, 200, 100);
			addChild(_shape);
		}
		
		private function drawCircle2():void
		{
			var _shape:Shape = new Shape();
			_shape.graphics.lineStyle(1, 0);
			_shape.graphics.beginFill(0xcccccc);
			_shape.graphics.drawCircle(500, 200, 100);
			_shape.graphics.endFill();
			addChild(_shape);
		}
	}
}
