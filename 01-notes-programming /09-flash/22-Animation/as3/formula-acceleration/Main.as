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
		   
		   // set object move speed up on specific direction
		   // target:_sprite
		   // angular:-15
		   // speed: 2
		   setAcceleration(_sprite, -15, 2);
		}
		
		private function createDisplayObject():void
		{
			_sprite.graphics.beginFill(0x000000);
			_sprite.graphics.drawCircle(0, 0, 25);
			_sprite.graphics.endFill();
			_sprite.x = 50;
			_sprite.y = 250;
            addChild(_sprite);
		}
		
		private function setAcceleration($target:DisplayObject,$angular:Number,$speed:Number):void
		{
			var _timer:Timer = new Timer(50);
			var _randians:Number = 0;
			var _ax:Number = 0;
			var _ay:Number = 0;
			
			_timer.addEventListener(TimerEvent.TIMER, moveObj);
			_timer.start();
			
			function moveObj(event:TimerEvent):void
			{
				_randians = $angular * Math.PI / 180;
				_ax = Math.cos(_randians) * $speed;
				_ay = Math.sin(_randians) * $speed;
				
				$target.x += _ax;
				$target.y += _ay;
				
				// increase the speed
				$speed += 5;
			}
		}
	}
}
