package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.filters.ColorMatrixFilter;
	import ascb.filters.ColorMatrixArrays;
	import flash.geom.Matrix;
	import flash.net.URLRequest;

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{	
			// apply geryScale by colorMatrix filter
			geryScale();
		}
		
		private function geryScale():void
		{
			var _loader:Loader = new Loader();
			var _sprite:Sprite = new Sprite();
			
			_loader.load(new URLRequest("images/bike2.jpg"));
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, getFilter);
			
			function getFilter(event:Event):void
			{
				var _bitmap:Bitmap = Bitmap(_loader.content);
				_sprite.x = 200;
				_sprite.y = 100;
				_sprite.addChild(_bitmap);
				
				// create ColorMatrixFilter and use the ascb.filters.ColorMatrixArrays.GRAYSCALE constant:
				var _colorMartixFilter:ColorMatrixFilter = new ColorMatrixFilter(ColorMatrixArrays.GRAYSCALE);
				
				// apply filter to display object
				_sprite.filters = [_colorMartixFilter];
				addChild(_sprite);
			}
		}
	}	
}
