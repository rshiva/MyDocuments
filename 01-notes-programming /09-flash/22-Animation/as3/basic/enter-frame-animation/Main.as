package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main()
		{
			// simple enter frame animation
			enterFrameAnimation();
		}
		
		private function enterFrameAnimation():void
		{
			// create display object
			var _sprite:Sprite = new Sprite();
			_sprite.graphics.beginFill(0x000000);
			_sprite.graphics.drawCircle( 0, 0, 50);
			_sprite.graphics.endFill();
			_sprite.x = 100;
			_sprite.y = 250;
			addChild(_sprite);
			
			// move object on each frame
			_sprite.addEventListener(Event.ENTER_FRAME, moveObj);
			
			function moveObj(event:Event):void
			{
				// velocity
				var _vx:Number = 10;
				
				// change object x position by velocity
				_sprite.x += _vx;
			}
		}
	}
}
