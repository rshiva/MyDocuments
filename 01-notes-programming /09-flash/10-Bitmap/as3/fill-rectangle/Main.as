package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Rectangle;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// fill a rectangle area in bitmap
			fillRect();
		}
		
		private function fillRect():void
		{
			var _bitmapData:BitmapData = new BitmapData(400, 200, true, 0xfffff000);
			var _bitmap:Bitmap = new Bitmap(_bitmapData);
			_bitmap.x = 200;
			_bitmap.y = 150;
			
			// create a rectangle object
			var rect:Rectangle = new Rectangle(0, 0, 100, 50);
			
			// fill rectangle area
			// define fill area with rectangle object
			// define fill color
			_bitmapData.fillRect(rect, 0xffff0000);
			addChild(_bitmap);
		}
		
	}
}
