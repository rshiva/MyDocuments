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
			multiFilters();
		}
		
		private function multiFilters():void
		{
			var box:Sprite = new Sprite(  );
			box.graphics.lineStyle(  );
			box.graphics.beginFill(0xFFFFFF);
			box.graphics.drawRect(100, 100, 300, 300);
			box.graphics.endFill(  );
			var boxShadow:Sprite = new Sprite(  );
			boxShadow.graphics.lineStyle(  );
			boxShadow.graphics.beginFill(0xFFFFFF);
			boxShadow.graphics.drawRect(100, 100, 300, 300);
			boxShadow.graphics.endFill(  );
			addChild(boxShadow);
			addChild(box);
			box.filters = [new GlowFilter(  )];
			
			// usually the second filter apply on the first filter. mean if first filter change the shape. second filter apply will base on it
			// The knockout property is available for the majority of the basic filters (last parameter) 
			// turn it as true, will hide the orginal shape and just show the filter
			// can make several filters work together in this way
			
			boxShadow.filters = [new DropShadowFilter(10, 45, 0, 1, 4, 4, 1, 1, false, true)];
		}
	}	
}
