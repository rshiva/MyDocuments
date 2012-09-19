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
			// change brightness 
			changeBrightness();
		}
		
		private function changeBrightness():void
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
				
				// increase brightness twice
				// brightness matrix
				/*
				 * 2, 0, 0, 0, 0, 
				 * 0, 2, 0, 0, 0,
				 * 0, 0, 2, 0, 0, 
				 * 0, 0, 0, 1, 0
				*/
				var _colorMartixFilter:ColorMatrixFilter = new ColorMatrixFilter([2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 0]);
				
				// apply filter to display object
				_sprite.filters = [_colorMartixFilter];
				addChild(_sprite);
			}
		}
	}	
}
