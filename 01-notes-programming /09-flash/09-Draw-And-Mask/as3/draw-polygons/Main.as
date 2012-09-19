package 
{
	import ascb.drawing.Pen;
	import flash.display.*;
	import flash.events.*;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			drawPolygons();
		}
		
		private function drawPolygons():void
		{
			var _shape:Shape = new Shape();
			var pen:Pen = new Pen(_shape.graphics);
			pen.beginFill(0xcccccc);
			
			// draw polygons
			// center at (400,250);
			// sides = 6
			// length of side = 100
			// rotation degree = 0
			pen.drawRegularPolygon(400, 250, 6, 100, 0);
			pen.endFill();
			addChild(_shape);
		}
	}
}
