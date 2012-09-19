package {
	import flash.display.Sprite;
	import ascb.units.Converter;
	import ascb.units.Unit;
	import flash.events.Event;

	public class Main extends Sprite 
	{
		private var _square:Sprite;
		private var _angle:uint;
		
		public function Main(  ) 
		{
			_square = new Sprite(  );
			_square.graphics.lineStyle(0);
			_square.graphics.drawCircle(0, 0, 20);
			addChild(_square);
			_angle = 0;
			
			var _pointer:Sprite = new Sprite();
			_pointer.graphics.lineStyle(  );
			_pointer.graphics.beginFill(0xFF0000);
			_pointer.graphics.drawCircle(200, 200, 5);
			_pointer.graphics.endFill(  );
			addChild(_pointer);
			
			var _border:Sprite = new Sprite();
			_border.graphics.lineStyle(0);
			_border.graphics.drawCircle(200, 200, 100);
			addChild(_border);
			
			addEventListener(Event.ENTER_FRAME, move);
			
		}

		private function move(event:Event):void 
		{
			var converter:Converter = Unit.DEGREE.getConverterTo(Unit.RADIAN);
			var angleRadians:Number = converter.convert(_angle);
			
			// x1 = x0 + (Math.cos(angle) * radius);
			// y1 = y0 + (Math.sin(angle) * radius);
			
			//make the _square move on a circle. 
			//the center of the circle is (200,200)
			//the radius of the circle is 100
			_square.x = 200+(Math.cos(angleRadians) * 100);
			_square.y = 200+(Math.sin(angleRadians) * 100);
			
			//the angle increase
			_angle++;
		}
		
	}
}
