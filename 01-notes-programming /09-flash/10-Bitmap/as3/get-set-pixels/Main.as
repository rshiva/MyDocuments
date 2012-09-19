package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Matrix;
	import flash.net.URLRequest;
	import flash.text.TextField;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// read pixel value under mouse cursor
			// getPixels();
			
			// set pixel value under mouse cursor
			setPixels();
		}
		
		private function getPixels():void
		{
			// create a bitmap and add some noise
			var _bitmapData:BitmapData = new BitmapData(200, 200, true, 0xffffffff);
			_bitmapData.noise(1000, 0, 255, 1|2|4, false);
			var _bitmap:Bitmap = new Bitmap(_bitmapData);
			_bitmap.x = 300;
			_bitmap.y = 150;
			
			// add a text file and bitmap to display list
			var _text:TextField = new TextField();
			addChild(_text);
			addChild(_bitmap);
			
			// add enterFrame event to get pixel value under mouse cursor
			addEventListener(Event.ENTER_FRAME, reading);
			
			function reading(event:Event):void
			{
				// getPixel() used on opaque BitmapData
				// getPixel32() used on transparency BitmapData
				// get pixel value on mouse position
				var _pixelValue:Number = _bitmapData.getPixel(_bitmap.mouseX, _bitmap.mouseY);
				_text.text = _pixelValue.toString();
			}
		}
		
		private function setPixels():void
		{
			var _bitmapData:BitmapData = new BitmapData(200, 200, true, 0xfffff000);
			var _bitmap:Bitmap = new Bitmap(_bitmapData);
			_bitmap.x = 300;
			_bitmap.y = 150;
			addChild(_bitmap);
			addEventListener(Event.ENTER_FRAME, setColor);
			
			function setColor(event:Event):void
			{
				// setPixel() used on opaque BitmapData
				// setPixel32() used on transparency BitmapData
				// set pixel value on mouse position
				_bitmapData.setPixel32(_bitmap.mouseX, _bitmap.mouseY, 0xffff0000);
			}
		}
		
		
	}
}
