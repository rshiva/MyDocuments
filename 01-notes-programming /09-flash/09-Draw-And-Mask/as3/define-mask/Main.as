package 
{
	import ascb.drawing.Pen;
	import flash.display.*;
	import flash.events.*;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// set mask to shape
			setMask1();
			
		}
		
		private function setMask1():void
		{
			// create shape
			var _shape:Shape = new Shape();
			_shape.graphics.beginFill(0xff0000);
			_shape.graphics.drawRect(50, 50, 100, 100);
			_shape.graphics.endFill();
			
			// create shape to be used as mask
			var _mask:Shape = new Shape();
			var pen:Pen = new Pen(_mask.graphics);
			pen.beginFill(0x0000ff);
			pen.drawStar(100, 100, 5, 50, 20, 0);
			pen.endFill();
			
			// set mask
			_shape.mask = _mask;
			
			addChild(_shape);
			addChild(_mask);
		}
		
	}
}
