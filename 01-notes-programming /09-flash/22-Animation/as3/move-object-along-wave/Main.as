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
		   
		   // move object as wave
		   // target:_sprite
		   // wave range: 100px
		   // speed on y axis: 0.1
		   // speed on x axis: 0.05 second 5 pxiel
		   // start y position: 250
		   waveMoveObject(_sprite, 100, 0.1,5,250);
		}
		
		private function createDisplayObject():void
		{
			_sprite.graphics.beginFill(0x000000);
			_sprite.graphics.drawCircle(0, 0, 50);
			_sprite.graphics.endFill();
			_sprite.x = 50;
			_sprite.y = 250;
            addChild(_sprite);
		}
		
		private function waveMoveObject($target:DisplayObject,$range:Number,$speedY:Number,$speedX:Number,$startY:Number):void
		{
			var _angle:Number = 0;
			var _timer:Timer = new Timer(50);
			_timer.addEventListener(TimerEvent.TIMER, moveObj);
			_timer.start();
			
			function moveObj(event:TimerEvent):void
			{
				$target.y = $startY + Math.sin(_angle) * $range;
				$target.x += $speedX;
				_angle+=$speedY;
			}
		}
		
	}
}
