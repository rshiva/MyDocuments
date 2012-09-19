package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.Timer;

	public class Main extends Sprite 
	{
		public function Main()
		{
			// simple timer animation
			timerAnimation();
		}
		
		private function timerAnimation():void
		{
			// create display object
			var _sprite:Sprite = new Sprite();
			_sprite.graphics.beginFill(0x000000);
			_sprite.graphics.drawCircle( 0, 0, 50);
			_sprite.graphics.endFill();
			_sprite.x = 100;
			_sprite.y = 250;
			addChild(_sprite);
			
			// create a timer, repeat every 0.05 second
			var _timer:Timer = new Timer(50); 
			
			// move object when timer be called
			_timer.addEventListener(TimerEvent.TIMER, moveObj);
			
			// start timer
			_timer.start();
			
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
