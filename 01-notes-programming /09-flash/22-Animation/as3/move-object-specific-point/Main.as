package 
{
	import flash.display.*;
	import flash.events.*;
	import gs.TweenLite;

	public class Main extends Sprite 
	{
		private var _sprite:Sprite = new Sprite();
		
		public function Main()
		{
			createDisplayObject();
			TweenLite.to(_sprite, 1, {x:600, y:100});
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
		
		
	}
}
