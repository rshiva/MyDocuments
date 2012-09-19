package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.Timer;

	public class Main extends Sprite 
	{
		private var _sprite:Sprite = new Sprite();
		
		public function Main()
		{	
           createDisplayObject();
		   pointToMouse(_sprite);
		}
		
		private function createDisplayObject():void
		{
			_sprite.graphics.beginFill(0xebebeb);
            _sprite.graphics.drawCircle(0, 0, 50);
            _sprite.graphics.endFill(  );
            _sprite.graphics.beginFill(0x000000);
            _sprite.graphics.drawCircle(45, 0, 5);
            _sprite.graphics.endFill(  );
            _sprite.x = 400;
            _sprite.y = 250;
            addChild(_sprite);
		}
		
		private function pointToMouse($target:DisplayObject):void
		{
			var _timer:Timer = new Timer(50);
			_timer.addEventListener(TimerEvent.TIMER, moveObject);
			_timer.start();
			
			function moveObject(event:TimerEvent):void
			{
				var dx:Number = mouseX - $target.x;
				var dy:Number = mouseY - $target.y;
				var radians:Number = Math.atan2(dy, dx);
				$target.rotation = radians * 180 / Math.PI;
			}
		}
	}
}
