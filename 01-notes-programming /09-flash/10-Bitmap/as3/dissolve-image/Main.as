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
			// load 2 external images and dissolve one image to another
			dissolveImage();
		}
		
		private function dissolveImage():void
		{
			var _loader1:Loader = new Loader();
			var _loader2:Loader = new Loader();
			
			var _bitmap1:Bitmap;
			var _bitmap2:Bitmap;
			
			var _seed:Number = Math.random() * 10000;
			var _count:int;
			
			_loader1.load(new URLRequest("images/autobike_1.jpg"));
			_loader1.contentLoaderInfo.addEventListener(Event.COMPLETE, loadImg2);
			
			
			function loadImg2(event:Event):void
			{
				_loader2.load(new URLRequest("images/autobike_2.jpg"));
				_loader2.contentLoaderInfo.addEventListener(Event.COMPLETE, initialBitmap);
			}
			
			function initialBitmap(event:Event):void
			{
				_bitmap1 = Bitmap(_loader1.content);
				_bitmap2 = Bitmap(_loader2.content);
				
				_bitmap1.x = 200;
				_bitmap1.y = 80;
				addChild(_bitmap1);
				
				// add enterFrame event to call startDissolveImage
				addEventListener(Event.ENTER_FRAME, startDissolveImage);
				
				
				function startDissolveImage(event:Event):void
				{
					// seed: _seed (define the dissolve pattern)
					// destination bitmapData: _bitmap1.bitmapData
					// resource bitmapData: _bitmap2.bitmapData
					// effect area: _bitmap1.bitmapData.rect
					// start point on destination: new Point;
					// numPixels: 3000(dissolve 3000 pixel each time)
					_seed = _bitmap1.bitmapData.pixelDissolve(_bitmap2.bitmapData, _bitmap1.bitmapData.rect, new Point(), _seed, 3000, 0);
					
					// set counter
					_count+= 3000;
					
					// if dissolved pixels more than the pixels on resource bitmapData, stop the animation
					if ( _count > _bitmap2.bitmapData.width * _bitmap2.bitmapData.height)
					{
						removeEventListener(Event.ENTER_FRAME, startDissolveImage);
					}
				}
				
			}
		}
	}
}
