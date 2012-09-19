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
			
			// object: _sprite
			// angular : -15 degree
			// speed: 100
			moveObjOnAngular(_sprite, -15, 100);
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
		
		private function moveObjOnAngular(target:DisplayObject,angular:Number,speed:Number):void
		{
			// create a timer to drive animation
			var _timer:Timer = new Timer(50);
			_timer.addEventListener(TimerEvent.TIMER, moveObject);
			_timer.start();
			
			function moveObject(event:TimerEvent):void
			{
				// convert degree to radian
				var _radians:Number = angular * Math.PI / 180;
				
				// calculate the velocity
				var _vx:Number = Math.cos(_radians) * speed;
				var _vy:Number = Math.sin(_radians) * speed;
				
				// move object
				target.x += _vx;
				target.y += _vy;
			}
		}
	}
}
