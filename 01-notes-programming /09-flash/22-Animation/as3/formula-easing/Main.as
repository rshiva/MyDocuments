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
		   
		   // move object with easing
		   // object:_sprite
		   // easing: 0.05 (big number tend to fast, small number tend to slow);
		   // destination point: (700,250)
		   easingMove(_sprite, 0.05, 700, 250);
		}
		
		private function createDisplayObject():void
		{
			_sprite.graphics.beginFill(0x000000);
			_sprite.graphics.drawCircle(0, 0, 50);
			_sprite.graphics.endFill();
			_sprite.x = 100;
			_sprite.y = 250;
            addChild(_sprite);
		}
		
		private function easingMove($target:DisplayObject,$easing:Number,$desX:Number,$desY:Number):void
		{
			var _timer:Timer = new Timer(30);
			_timer.addEventListener(TimerEvent.TIMER, moveObj);
			_timer.start();
			
			function moveObj(event:TimerEvent):void
			{
				$target.x += ($desX - $target.x) * $easing;
				$target.y += ($desY - $target.y) * $easing;
			}

		}
		
	}
}
