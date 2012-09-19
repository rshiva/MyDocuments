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
			var _other:Shape = drawCircle(350, 350, 0x333333, 150);
			
			_container1.addChild(_red);
			_container1.addChild(_green);
			_container1.addChild(_blue);
			_container1.addChild(_other);
			
			addChild(_container1);
			
			// set object's depth up
			// if the object been move to higher depth, it will place in front of the object in that depth (blue) 
			// _container1.setChildIndex(_red, 2);
			
			// set object's depth down
			// _container1.setChildIndex(_other, 1)
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
