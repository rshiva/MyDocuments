package 
{
	import ascb.drawing.Pen;
	import flash.display.*;
	import flash.events.*;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			drawCurve1();
			drawCurve2();
		}
		
		// draw a curve using display object's graphic property curveTo() method
		private function drawCurve1():void
		{
			var _sprite:Sprite = new Sprite();
			
			// set line style
			_sprite.graphics.lineStyle(1, 0);
			
			// set curve start point at (100,250)
			_sprite.graphics.moveTo(100, 250);
			
			// set curve control point at (400,50)
			// set curve end point at (700,250)
			_sprite.graphics.curveTo(400, 50, 700, 250);
			
			// draw a circle at curve control point
			_sprite.graphics.drawCircle(400, 50, 5);
			
			// after drawing, add display object to display list to render 
			addChild(_sprite);
		}
		
		// draw a curve by custom class
		private function drawCurve2():void
		{
			var _sprite:Sprite = new Sprite();
			
			// instance pen class, passing it a reference to the Graphics object you want to target:
			var pen:Pen = new Pen(_sprite.graphics);
			
			// draw a curve start from (100,350), control point is (400,100), end point is (700,350)
			pen.drawCurve(100, 350, 400, 100, 700, 350);
			
			// draw a circle at control point
			pen.drawCircle(400, 100, 5);
			
			// after drawing, add display object to display list to render 
			addChild(_sprite);
		}
	}
}
