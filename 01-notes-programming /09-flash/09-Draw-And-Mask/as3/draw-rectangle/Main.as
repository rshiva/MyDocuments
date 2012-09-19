package 
{
	import ascb.drawing.Pen;
	import flash.display.*;
	import flash.events.*;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// draw rectangle with outline
			drawRect1();
			
			// draw rectangle with fill color
			drawRect2();
			
			// draw a round corner rectangle
			drawRect3();
			
			// draw a rectangle, each corner has different degree 
			drawRect4();
		}
		
		private function drawRect1():void
		{
			var _shape:Shape = new Shape();
			_shape.graphics.lineStyle(1, 0);
			
			// draw rectangle left corner at (50,50), width is 100, heigh is 50
			_shape.graphics.drawRect(50, 50, 100, 50);
			addChild(_shape);
		}
		
		private function drawRect2():void
		{
			var _shape:Shape = new Shape();
			_shape.graphics.lineStyle(1, 0);
			
			// define fill color
			_shape.graphics.beginFill(0xcccccc);
			_shape.graphics.drawRect(200, 50, 100, 50);
			
			// must finish fill
			_shape.graphics.endFill();
			addChild(_shape);
		}
		
		private function drawRect3():void
		{
			var _shape:Shape = new Shape();
			_shape.graphics.beginFill(0xe0e0e0);
			_shape.graphics.drawRoundRect(50, 150, 100, 50, 10);
			_shape.graphics.endFill();
			addChild(_shape);
		}
		
		private function drawRect4():void
		{
			var _shape:Shape = new Shape();
			_shape.graphics.beginFill(0xcccccc);
			
			// draw a round corner rectangle
			// top left is 10, top right is 20, bottom right is 30, bottom lett is 40
			_shape.graphics.drawRoundRectComplex(200, 150, 100, 50, 10, 20, 30, 40);
			_shape.graphics.endFill();
			addChild(_shape);
		}
	}
}
