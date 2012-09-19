package 
{
	import ascb.drawing.Pen;
	import flash.geom.Matrix;
	import flash.net.URLRequest;
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// fill shape with transparence, solid color 
			setFill1();
			
			// fill shape with gradient color
			setFill2();
			
			// fill shape with external bitmap image
			setFill3();
		}
		
		private function setFill1():void
		{
			var _shape:Shape = new Shape();
			_shape.graphics.beginFill(0xff0000, 0.5);
			_shape.graphics.drawCircle(100, 100, 50);
			_shape.graphics.endFill();
			addChild(_shape);
		}
		
		private function setFill2():void
		{
			var _shape:Shape = new Shape();
			
			// create Matrix object
			var matrix:Matrix = new Matrix(  );
			
			// set the gradient transform
			// set xscale and yscale according to target obejct's width and height
			// xscale = 200, yscale=100
			// rotation 0
			// set offset according to where draw the object
			// offset x=200, offset y=50
			matrix.createGradientBox(200, 100, 0, 200, 50);
			
			// gradient color
			var colors:Array = [0xFF0000, 0x0000FF];
			
			// alpha for grandient color
			var alphas:Array = [100, 100];
			
			// the position of the grandient color, from 0 to 255
			var ratios:Array = [0, 255];
			_shape.graphics.lineStyle(  );
			
			// apply parameters to grandient 
			_shape.graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, matrix,"pad","rgb");
			_shape.graphics.drawRect(200, 50, 200,100);
			_shape.graphics.endFill(  );
			addChild(_shape);
		}
		
		private function setFill3():void
		{
			// create a loader to load external image, when loading complete call fillImage function 
			var _loader:Loader = new Loader();
			_loader.load(new URLRequest("images/fill.jpg"));
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, fillImage);
			
			function fillImage(event:Event):void
			{
				// create bitmapdata object
				var _bitmapData:BitmapData = new BitmapData(_loader.width, _loader.height);
				
				// use bitemapData object's draw method draw the external image
				_bitmapData.draw(_loader, new Matrix(  ));
				
				// define materix object
				var matrix:Matrix = new Matrix(  );
				
				// set bitmap scale
				matrix.scale(1, 1);
				
				// set bitmap translate according to where draw the shape
				matrix.translate(450, 50);
				var sampleSprite:Sprite = new Sprite(  );
				
				// use beginBitmapFill to fill shape with bitmap
				sampleSprite.graphics.beginBitmapFill( _bitmapData, matrix);
				sampleSprite.graphics.drawRect(450, 50, 200,100);
				sampleSprite.graphics.endFill(  );
				addChild(sampleSprite);
			}
		}
	}
}
