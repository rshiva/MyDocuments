package 
{
	import flash.display.*;
	import flash.events.*;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			createBitmap1();
		}
		
		private function createBitmap1():void
		{
			// create bitmapData 
			// width=600,height=300
			// this bitmapData has alpha channel
			// fill color is 0xffff0000
			// The fillColor accepts a 32-bit color value
			// the different for 24-bit and 32 bit
			// in 24 bites color | 8 bits for red | 8 bites for green | 8 bites for blue
			// in 32 bites color | 8 bites for alpha | 8 bits for red | 8 bites for green | 8 bites for blue
			var _bitmapData:BitmapData = new BitmapData(600, 300, true, 0xffff0000);
			
			// create bitmap using bitmapData 
			var _bitmap:Bitmap = new Bitmap(_bitmapData);
			_bitmap.x = 100;
			_bitmap.y = 100;
			addChild(_bitmap);
		}
		
		
	}
}
