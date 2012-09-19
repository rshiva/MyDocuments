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
		   
		   // get object move along a circle
		   // target:_sprite
		   // radius:150
		   // center of circle: (400,250)
		   moveObjOnCircle(_sprite, 150, 400, 250);
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
		
		private function moveObjOnCircle($target:DisplayObject,$radius:Number,$centerX:Number,$centerY:Number):void
		{
			var _angle:Number = 0;
			var _degree:Number = 0.1;
			var _timer:Timer = new Timer(50);
			
			_timer.addEventListener(TimerEvent.TIMER, moveObj);
			_timer.start();
			
			function moveObj(event:TimerEvent):void
			{
				$target.x = $centerX + Math.sin(_angle) * $radius;
				$target.y = $centerY + Math.cos(_angle) * $radius;
				
				// change degree when fucntion was called
				_angle += _degree;
			}
		}
	}
}
