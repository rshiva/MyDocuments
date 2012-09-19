package 
{
	import ascb.drawing.Pen;
	import flash.display.*;
	import flash.events.*;
	

	public class Main extends Sprite 
	{
		private var _sprite:Sprite = new Sprite();
		
		public function Main(  ) 
		{
			ini();
		}
		
		private function ini():void
		{
			// define drawing area out line 
			_sprite.graphics.lineStyle(1, 0);
			
			// drawing area background color
			_sprite.graphics.beginFill(0xffffff);
			
			// define drawing area
			// when draw a rectangle in _sprite
			// the boundary of the rectangle defined the boundary of the _sprite
			_sprite.graphics.drawRect(100, 100, 600, 300);
			_sprite.graphics.endFill();
			addChild(_sprite);
			
			// add listener to handle mouse down event
			_sprite.addEventListener(MouseEvent.MOUSE_DOWN, startDraw);
			
			// add listener to handle mouse up event
			_sprite.addEventListener(MouseEvent.MOUSE_UP, stopDraw);
		}
		
		private function startDraw(event:MouseEvent):void
		{
			// define the mouse drawing line style
			_sprite.graphics.lineStyle(1, 0xff0000);
			
			// set current point to mouse position
			_sprite.graphics.moveTo(_sprite.mouseX, _sprite.mouseY);
			
			// call draw function
			_sprite.addEventListener(MouseEvent.MOUSE_MOVE, draw);
		}
		
		private function stopDraw(event:MouseEvent):void
		{
			// when mouse up, remove listener
			_sprite.removeEventListener(MouseEvent.MOUSE_MOVE, draw);
		}
		
		private function draw(event:MouseEvent):void
		{
			//when mouse move draw the line
			_sprite.graphics.lineTo(_sprite.mouseX, _sprite.mouseY);
		}
		
		
	}
}
