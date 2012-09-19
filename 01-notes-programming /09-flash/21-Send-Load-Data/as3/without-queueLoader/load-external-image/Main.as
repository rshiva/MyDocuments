package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Matrix;
	import flash.net.URLRequest;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// create bitmap object directly
			// loadImage1();
			
			// use bitmapData to draw loaded image
			loadImage2();
		}
		
		private function loadImage1():void
		{
			var _loader:Loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, createBitmap);
			_loader.load(new URLRequest("images/sea.jpg"));
			
			function createBitmap():void
			{
				// cast the loader.content as bitmap
				// assign it to a bitmap object
				var _bitmap:Bitmap = Bitmap(_loader.content);
				addChild(_bitmap);
			}
		}
		
		private function loadImage2():void
		{
			var _loader:Loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, createBitmap);
			_loader.load(new URLRequest("images/color.jpg"));
			
			
			function createBitmap():void
			{
				// cast loader.contetn as bitmap
				var _bitmap:Bitmap = Bitmap(_loader.content);
				
				// create new bitmapData object,
				// width and height = loader.content image
				var _bitmapData:BitmapData = new BitmapData(_bitmap.width, _bitmap.height, false, 0xffffffff);
				
				// use bitmapdata.draw() method to draw the load.content in bitmapData object
				_bitmapData.draw(_bitmap, new Matrix());
				
				// create bitmap object by bitmapData
				var _newBitmap:Bitmap = new Bitmap(_bitmapData);
				
				// add bitmap to display list
				addChild(_newBitmap);
			}
		}
	}
}
