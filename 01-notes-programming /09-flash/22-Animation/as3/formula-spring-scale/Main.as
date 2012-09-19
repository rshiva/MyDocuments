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
		   
		   // scale object with spring
		   // target:_sprite
		   // scale:3
		   // spring:0.1
		   // friction:0.9
		   springScaleObject(_sprite, 3, 0.1, 0.9);
		}
		
		private function createDisplayObject():void
		{
			_sprite.graphics.beginFill(0xfff000);
			_sprite.graphics.drawRect(-50,-50,100,100);
			_sprite.graphics.endFill();
			_sprite.x = 400;
			_sprite.y = 250;
            addChild(_sprite);
		}
		
		private function springScaleObject($target:DisplayObject,$scale:Number,$spring:Number,$friction:Number):void
		{
			var _scaleVel:Number = 0;
			var _timer:Timer = new Timer(30);
			
			_timer.addEventListener(TimerEvent.TIMER, scaleObject);
			_timer.start();
			
			function scaleObject(event:TimerEvent):void
			{
				_scaleVel += ($scale - $target.scaleX) * $spring;
				
				$target.scaleX += _scaleVel;
				$target.scaleY = _sprite.scaleX;
				
				_scaleVel *= $friction;
			}
		}
		
	}
}
