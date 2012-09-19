package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.filters.BlurFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.geom.Matrix;
	import flash.net.URLRequest;

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{	
			// get filters property from display object and add new filters
			addFilters();
		}
		
		private function addFilters():void
		{
			var _loader:Loader = new Loader();
			var _sprite:Sprite = new Sprite();
			var _bitmap:Bitmap;
			
			_loader.load(new URLRequest("images/bike2.jpg"));
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, getFilters);
			
			function getFilters(event:Event):void
			{
				_bitmap= Bitmap(_loader.content);
				_sprite.x = 200;
				_sprite.y = 70;
				
				// instance filter objects
				var _drapShadow:DropShadowFilter = new DropShadowFilter(20);
				var _glow:GlowFilter = new GlowFilter();
				
				// create an array add filter objects into this array
				var _filters:Array = [_drapShadow, _glow];
				
				// assign this array to display object filter property
				_sprite.filters = _filters;
				
				// create new array to get display object filters property
				// can use previous array( _filters ) as well
				var newFilters:Array = _sprite.filters;
				
				// instance new filter
				var _blur:BlurFilter = new BlurFilter();
				
				// add new filter to array
				newFilters.push(_blur);
				
				// assign array to display object 
				_sprite.filters = newFilters;
				
				_sprite.addChild(_bitmap);
				addChild(_sprite);
			}
		}
	}	
}
