package 
{
	import ascb.drawing.Pen;
	import flash.display.*;
	import flash.events.*;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			drawLine1();
			drawLine2();
		}
		
		// draw a line using display obejct's graphic property
		private function drawLine1():void
		{
			var _shape:Shape = new Shape();
			
			// set the line style. must when draw a line
			_shape.graphics.lineStyle(1, 0);
			
			// move current point to 120,100
			_shape.graphics.moveTo(120, 100);
			
			// draw a line from 100,100 to 400,400
			_shape.graphics.lineTo(420, 400);
			
			// when use display object's graphic property to draw the line
			// the line has been drawed in the display object
			// must add display object to display list, then the line can be rendered by flash
			addChild(_shape);
		}
		
		// draw a line by custom class
		private function drawLine2():void
		{
			var _sprite:Sprite = new Sprite();
			
			// Construct a Pen instance by passing it a reference to the Graphics object you want to target:
			var pen:Pen = new Pen(_sprite.graphics);
			
			// draw a line from (100,100) to (400,400)
			pen.drawLine(100, 100, 400, 400);
			
			// add display object to display list. have a line in _sprite. need render it
			addChild(_sprite);
		}
	}
}
