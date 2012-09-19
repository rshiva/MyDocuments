package 
{
	import ascb.drawing.Pen;
	import flash.display.*;
	import flash.events.*;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			drawArc();
		}
		
		// use custom class to draw Arc
		private function drawArc():void
		{
			var _shape:Shape = new Shape();
			
			// instance pen passing it a reference to the graphic object 
			var pen:Pen = new Pen(_shape.graphics);
			
			// the Arc is a outline of a circle
			// draw a Arc. 
			// the center of the circle is (400,250)
			// the radius is 200
			// the degree of the Arc is 350
			// the Arc start from 10 degree
			// draw a line from begin and end of the Arc to center of the circle
			pen.drawArc(400, 250, 200, 350, 10, true);
			addChild(_shape);
		}
	}
}
