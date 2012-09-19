package 
{
	import ascb.drawing.Pen;
	import flash.display.*;
	import flash.events.*;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			drawStar();
		}
		
		private function drawStar():void
		{
			var _shape:Shape = new Shape();
			var pen:Pen = new Pen(_shape.graphics);
			
			pen.beginFill(0xcccccc);
			
			// draw star
			// center at (400,250)
			// points=5
			// innerRadius=100
			// outerRadius=200
			// rotation=0
			pen.drawStar(400, 250, 5, 100, 200, 0);
			pen.endFill();
			
			pen.lineStyle(1, 0);
			
			// show outerRadius
			pen.drawCircle(400, 250, 200);
			
			// show innerRadius
			pen.drawCircle(400, 250, 100);
			addChild(_shape);
		}
	}
}
