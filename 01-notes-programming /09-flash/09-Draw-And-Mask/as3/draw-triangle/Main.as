package 
{
	import ascb.drawing.Pen;
	import flash.display.*;
	import flash.events.*;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			drawTriangle1();
		}
		
		private function drawTriangle1():void
		{
			var _shape:Shape = new Shape();
			var pen:Pen = new Pen(_shape.graphics);
			
			// define fill color
			pen.beginFill(0xcccccc);
			
			// draw a triangle,
			// left corner at (400,250)
			// ab=100, ac=200,
			// angle between ab and ac is 60
			// angle between ac and x axis is 10. if want ac parallels x axis, don't need set last parameter
			pen.drawTriangle(400, 250, 100, 200, 60,10);
			pen.endFill(  );
			addChild(_shape);
		}
	}
}
