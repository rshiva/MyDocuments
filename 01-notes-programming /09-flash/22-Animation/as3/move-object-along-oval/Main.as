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
		   
		   // get object move on a oval
		   // target:_sprite
		   // radiusX:200
		   // radiusY:100
		   // center of the oval:(400,250)
		   moveObjOnOval(_sprite, 200, 100, 400, 250);
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
		
		private function moveObjOnOval($target:DisplayObject,$radiusX:Number,$radiusY:Number,$centerX:Number,$centerY:Number):void
		{
			var _angle:Number = 0;
			var _degree:Number = 0.1;
			var _timer:Timer = new Timer(50);
			
			_timer.addEventListener(TimerEvent.TIMER, moveObj);
			_timer.start();
			
			function moveObj(event:TimerEvent):void
			{
				$target.x = $centerX + Math.sin(_angle) * $radiusX;
				$target.y = $centerY + Math.cos(_angle) * $radiusY;
				
				// change degree  when function get called 
				_angle += _degree;
			}
		}
	}
}
