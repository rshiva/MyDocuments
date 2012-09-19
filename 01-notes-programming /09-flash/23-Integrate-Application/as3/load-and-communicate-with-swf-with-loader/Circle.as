package  
{
	import flash.display.*;
	
	/**
	 * ...
	 * @author harry
	 */
	public class Circle extends Sprite
	{
		private var _color:uint=0x000000;
		private var _circle:Shape;
		
		public function Circle() 
		{
			updateCircle()
		}
		
		private function updateCircle():void
		{
			if (_circle == null)
			{
				_circle = new Shape();
				addChild(_circle);
			}
			_circle.graphics.beginFill(_color);
			_circle.graphics.drawCircle(400, 300, 150);
			_circle.graphics.endFill();
		}
		
		public function setColor(color:uint):void
		{
			_color = color;
			updateCircle();
		}
		
		
	}
	
}