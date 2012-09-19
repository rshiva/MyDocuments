package  
{
	import flash.display.*;
    import flash.events.*;
	import flash.geom.Point;
	import flash.text.*;
	
	/**
	 * ...
	 * @author ...
	 */
	
	 public class Main extends MovieClip
	{
		var red:Sprite;
		var green:Sprite;
		
		public function Main() 
		{
			red = drawRect(0xff0000);
			red.x = 100;
			red.y = 100;
			green = drawRect(0x00ff00);
			green.x = 100;
			green.y = 100;
			
			// add green to red
			red.addChild(green);
			
			// add red to display list
			addChild(red);
			
			getCoordinate();
		}
		
		
		private function drawRect(color:uint):Sprite
		{
			var _shape:Sprite = new Sprite();
			_shape.graphics.beginFill(color);
			_shape.graphics.drawRect(0, 0, 200, 200);
			_shape.graphics.endFill();
			return _shape;
		}
		
		private function getCoordinate():void
		{
			// get green local cordinate
			var _point:Point = new Point(green.x,green.y);
			trace("green local coordinate:"+_point);
			
			// the red contain green
			// use red localToGlobal method get green global coordinate
			trace("green global coordinate:"+red.localToGlobal(_point));
		}
		
	}
	
}