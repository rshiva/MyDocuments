package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Rectangle;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// flood fill pixels under mouse cursor
			floodFill();
		}
		
		private function floodFill():void
		{
			// create sprite and add to display list
			var _sprite:Sprite = new Sprite();
			addChild(_sprite);
			
			// create bitmapData with stage size
			var _bitmapData:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, false, 0xffffffff);
			
			for (var i:int = 0; i < 20; i++)
			{
				// create 20 50x50 rectangles with random color at random location 
				_bitmapData.fillRect(new Rectangle(Math.random() * stage.stageWidth, Math.random() * stage.stageHeight, 50, 50), Math.random() * 0xffffffff);
			}
			
			
			var _bitmap:Bitmap = new Bitmap(_bitmapData);
			_sprite.addChild(_bitmap);
			
			// add event listener call fill method
			_sprite.addEventListener(MouseEvent.MOUSE_DOWN, fill);
			
			function fill(event:MouseEvent):void
			{
				// fill the pixel under mouse cursor and surround pixels with 0xfffff000 
				_bitmapData.floodFill(mouseX, mouseY, 0xfffff000);
			}
		}
	}
}
