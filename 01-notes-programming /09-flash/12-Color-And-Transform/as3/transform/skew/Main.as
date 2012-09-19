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
			// skew(shearing) the image by transform.marix 
			startShear();
		}
		
		private function startShear():void
		{
			var _bitmap:Bitmap;
			var _loader:Loader;
			var _sprite:Sprite;
			
			_loader = new Loader();
			_loader.load(new URLRequest("images/bike1.jpg"));
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, iniImage);
			
			function iniImage(event:Event):void
			{
				_bitmap = Bitmap(_loader.content);
				_sprite = new Sprite();
				
				// matrix(a,b,c,d,tx,ty)
				// a: scale along x
				// d: scale along y
				// b: skew along y
				// c: skew along x 
				// tx: move on x
				// ty: move on y
				
				_sprite.transform.matrix = new Matrix(0.5, 0, 0.2, 0.5, 200, 50);
				_sprite.addChild(_bitmap);
				addChild(_sprite);
			}
		}
	}	
}
