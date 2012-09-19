package 
{
	import ascb.drawing.Pen;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Matrix;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// set line style with solid color
			setLine1();
			
			// set line style with grandient color
			setLine2();
		}
		
		private function setLine1():void
		{
			var _shape:Shape = new Shape();
			/**
			 * set line style
			 * line tickness=5px
			 * color=0x000000
			 * alpha=0.5
			 * line ougth snap to pixel=true | default=false
			 * scale line ="NONE" | defalut=normal
			 * cap = null | round
			 * joint =null
			 * miterlimit=0
			 */
			_shape.graphics.lineStyle(5, 0x000000, 0.5, true, "NONE", null, null, 0);
			_shape.graphics.drawRoundRect(100, 100, 200, 200, 20);
			addChild(_shape);
		}
		
		private function setLine2():void
		{
			var _shape:Shape = new Shape();
			
			// create Martix object to save grandient transform
			var matrix:Matrix = new Matrix(  );
			
			// set xscale and yscale according to target object's width and height
			// xscale=yscale=200
			// rotation=0
			// set offset according to where the object to be drawed
			// tx=400,ty=100
			matrix.createGradientBox(200, 200, 0, 400, 100);
			
			// set grandient color
			var colors:Array = [0xFF0000, 0x0000FF];
			
			// set color alpha
			var alphas:Array = [100, 100];
			
			// set color location from 0 to 255
			var ratios:Array = [0, 255];
			
			// set line style
			_shape.graphics.lineStyle(5, 0x000000, 0.5, true, "NONE", null, null, 0);
			
			// apply grandient style
			_shape.graphics.lineGradientStyle(GradientType.LINEAR, colors, alphas, ratios, matrix);
			_shape.graphics.drawRoundRect(400, 100, 200, 200, 20);
			addChild(_shape);
		}
	}
}
