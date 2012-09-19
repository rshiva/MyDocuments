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
			// creating general noise
			// generalNoise();
			
			// creating perline noise
			// perlineNoise();
			
			// perline noise animation
			perlineAnimation();
		}
		
		private function generalNoise():void
		{
			var _bitmapData:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0xffffffff);
			
			// seed = 1000 (define noise pattern)
			// low = 200, heigh=250 (from 0-250,big number make light noise, small number make drak noise)
			// apply channel = red
			// geryscale = true (apply same effect to RGB channel, make gery noise)
			_bitmapData.noise(1000, 200, 250, BitmapDataChannel.RED, true);
			var _bitmap:Bitmap = new Bitmap(_bitmapData);
			addChild(_bitmap);
		}
		
		private function perlineNoise():void
		{
			var _bitmapData:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0xffffffff);
			
			// baseX=300,baseY=100 (define the size of pattern)
			// octavs=5 (details of the pattern)
			// seed=1000 (define the pattern)
			// stitch=false (set to true, make the up and bottom, left and right has same pattern. So bitmap can be tiles seamlessly.)
			// fractal=true (make pattern has soft edge more like cloud)
			// apply channel = red
			// geryscale = true (effect RBG channel, generate gery noise)
			// offset = null (array of point object)
			_bitmapData.perlinNoise(100, 100, 5, 1000, false, true, BitmapDataChannel.RED, true, null);
			var _bitmap:Bitmap = new Bitmap(_bitmapData);
			addChild(_bitmap);
		}
		
		private function perlineAnimation():void
		{
			var _offset:int = 0;
			var _sprite:Sprite = new Sprite();
			var _bitmapData:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0xffffffff);
			var _bitmap:Bitmap = new Bitmap(_bitmapData);
			_sprite.addChild(_bitmap);
			addChild(_sprite);
			
			_sprite.addEventListener(Event.ENTER_FRAME, animation);
			
			function animation(event:Event):void
			{
				_offset+=10;
				var _point:Point = new Point(_offset, 0);
				_bitmapData.perlinNoise(300, 100, 5, 1000, false, true, BitmapDataChannel.RED, true, [_point,_point]);
			}
		}
	}
}
