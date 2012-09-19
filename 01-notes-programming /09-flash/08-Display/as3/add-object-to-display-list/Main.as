package {

	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public var _mySprite:Shape;
		public var _red:Shape;
		public var _green:Shape;
		public var _blue:Shape;
		
		public function Main(  ) 
		{
			// use constructor method define x coordinate, y coordinate, fill color, radius  
			_red = drawCircle(200, 200, 0xff0000, 150);
			_green = drawCircle(300, 300, 0x00ff00, 150);
			_blue = drawCircle(400, 200, 0x0000ff, 150);
			
			// the Main class had been added to displaylist automatically
			// the Main class extends sprite is display object container
			// the Main class add shapes as its children
			// the _red been added first, then _green. so _green is above _red
			addChild(_red);
			addChild(_green);
			
			// addChild can add display object into a specify position 1
			// so the blue is in the middle of red and green
			addChildAt(_blue, 1);
		}
		
		public function drawCircle(locX:Number,LocY:Number,color:Number,radius:Number):Shape
		{
			_mySprite = new Shape();
			_mySprite.graphics.beginFill(color);
			_mySprite.graphics.drawCircle(locX, LocY, radius);
			_mySprite.graphics.endFill();
			return _mySprite;
		}
	}
}
