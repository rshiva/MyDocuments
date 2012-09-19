package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// copy pixels in rectangle area
			copyPixels();
		}
		
		private function copyPixels():void
		{
			// load external image, when loading complete start to copy pixels
			var _loader:Loader = new Loader();
			_loader.load(new URLRequest("images/sea.jpg"));
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, copy);
			
			// create bitmap object and add it to display list
			var _bitmapData:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0xffffffff);
			var _bitmap:Bitmap = new Bitmap(_bitmapData);
			addChild(_bitmap);
			
			function copy(event:Event):void
			{
				// cast the loader.content as bitmap
				var _img:Bitmap = Bitmap(_loader.content);
				
				var _width:Number = _img.width / 10;
				
				for (var i:int = 0; i < 10; i++)
				{
					// copy pixels from other bitmapData object
					// resource bitmapData = _img.bitmapData
					// copy area = new rectangle object
					// paste at new point object
					_bitmapData.copyPixels(_img.bitmapData, new Rectangle(i * _width, 0, _width, _img.height), new Point(i*(_width+2),0));
				}
			}
		}
	}
}
