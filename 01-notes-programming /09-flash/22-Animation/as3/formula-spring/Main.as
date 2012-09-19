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
		   
		   // move object with spring
		   // target:_sprite
		   // destination:(700,100)
		   // spring:0.1 (small number tend spring to hard, big number tend spring to easy)
		   // friction:0.9
		   springMove(_sprite, 700, 100, 0.1, 0.9);
		   
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
		
		private function springMove($target:DisplayObject,$desX:Number,$desY:Number,$spring:Number,$friction:Number):void
		{
			var vx:Number = 0;
			var vy:Number = 0;
			var _timer:Timer = new Timer(30);
			
			_timer.addEventListener(TimerEvent.TIMER, moveObj);
			_timer.start();
			
			function moveObj(event:TimerEvent):void
			{
				vx += ($desX - $target.x) * $spring;
				vy += ($desY - $target.y) * $spring;
				$target.x += (vx *= $friction);
				$target.y += (vy *= $friction);
			}
		}
		
	}
}
