package {

	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			var _container1:Sprite = new Sprite();
			
			var _red:Shape = drawCircle(200, 250, 0xff0000, 150);
			var _green:Shape = drawCircle(300, 250, 0x00ff00, 150);
			var _blue:Shape = drawCircle(400, 250, 0x0000ff, 150);
			var _other:Shape = drawCircle(500, 250, 0x333333, 150);
			
			_container1.addChild(_red);
			_container1.addChild(_green);
			_container1.addChild(_blue);
			_container1.addChild(_other);
			
			addChild(_container1);
			
			while (_container1.numChildren > 0) {
				_container1.removeChildAt(0);
			}
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
