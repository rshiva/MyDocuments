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
			// change saturation by color matrix filter
			changeSaturation();
		}
		
		private function changeSaturation():void
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
				
				// create colorMaritix object and use the ascb.filters.ColorMatrixArrays.getSaturationArray( ) method to construct a saturation matrix array 
				// when set para=0. it's a geryscale array
				var _colorMartixFilter:ColorMatrixFilter = new ColorMatrixFilter(ColorMatrixArrays.getSaturationArray(-1));
				
				// apply filter to display object
				_sprite.filters = [_colorMartixFilter];
				addChild(_sprite);
			}
		}
	}	
}
