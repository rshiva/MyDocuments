package 
{
	import ascb.drawing.Pen;
	import flash.display.*;
	import flash.events.*;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// draw ellipse
			drawEllipse();
		}
		
		private function drawEllipse():void
		{
			var _shape:Shape = new Shape();
			
			// instance pen and pass it a reference of display object's graphic property
			var pen:Pen = new Pen(_shape.graphics);
			
			// define line style
			pen.lineStyle(1, 0);
			
			// define fill color
			pen.beginFill(0xcccccc, 1);
			
			// draw ellpise at (400,200)
			// radius x =200
			// radius y =100
			pen.drawEllipse(400, 250, 200, 100);
			pen.endFill();
			
			// after draw in display object, add it to display list for rendering
			addChild(_shape);
		}
	}
}
