package {
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite {

		public function Main():void {
			var _red:Shape = drawCircle(200, 200, 0xff0000, 150);
			var _green:Shape = drawCircle(300, 300, 0x00ff00, 150);
			var _blue:Shape = drawCircle(400, 400, 0x0000ff, 150);
			
			addChild(_red);
			addChild(_green);
			// add object to specific depth
			// the object in the specific depth before will move to higher depth 
			addChildAt(_blue, 1);
		}
		
		public function drawCircle(locX:Number,LocY:Number,color:Number,radius:Number):Shape
		{
			var _mySprite:Shape = new Shape();
			_mySprite.graphics.beginFill(color);
			_mySprite.graphics.drawCircle(locX, LocY, radius);
			_mySprite.graphics.endFill();
			return _mySprite;
		}
	}
}