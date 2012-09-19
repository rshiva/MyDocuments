package {

	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			var _container1:Sprite = new Sprite();
			
			var _red:Shape = drawCircle(200, 200, 0xff0000, 150);
			var _green:Shape = drawCircle(300, 300, 0x00ff00, 150);
			var _blue:Shape = drawCircle(400, 400, 0x0000ff, 150);
			
			_container1.addChild(_red);
			_container1.addChild(_green);
			_container1.addChild(_blue);
			
			addChild(_container1);
			
			// swap object by ref
			// _container1.swapChildren(_red, _blue);
			
			// swap object by depth
			// _container1.swapChildrenAt(0,2);
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
