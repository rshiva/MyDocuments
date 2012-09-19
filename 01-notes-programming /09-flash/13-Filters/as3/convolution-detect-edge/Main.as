package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.filters.BlurFilter;
	import flash.filters.ConvolutionFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.geom.Matrix;
	import flash.net.URLRequest;

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{	
			// apply embossing effect by Convolution Filter
			detectingEdge();
		}
		
		private function detectingEdge():void
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
				
				// constructor for ConvolutionFilter
				// more info http://www.cee.hw.ac.uk/hipr/html/convolve.html
				// first para: define the number of columns
				// second para: define the number of rows
				// third para: the array of matrix values
				// apply detecting edge matrix 
				/* 
				   0, 1, 0
				   1,-3, 1
				   0, 1, 0
				*/
				
				var _convolutionFilter:ConvolutionFilter = new ConvolutionFilter(3, 3, [0, 1, 0, 1, -3, 1, 0, 1, 0]);
				_sprite.filters = [_convolutionFilter];
				addChild(_sprite);
			}
		}
	}	
}
