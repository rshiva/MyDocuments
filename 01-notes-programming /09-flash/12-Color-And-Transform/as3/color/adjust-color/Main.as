package 
{
	import flash.display.*;
	import flash.events.*;
	import ascb.drawing.Pen;
	import flash.geom.ColorTransform;
	import flash.net.URLRequest;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			
			// on click change colorTransform Property
			// change pixels by solid color
			// colorTransformForDrawingObject();
			
			// on click change colorTransform Property
			// change pixels by solid color, but can set transparency
			// colorTransformForBitmap();
			
			// on click change color tint property
			// tint property base on pixels contrast
			// colorTintForBitmap();
		}
		
		private function colorTransformForDrawingObject():void
		{
			var _shape:Sprite = new Sprite();
			var _pen:Pen = new Pen(_shape.graphics);
			
			_pen.beginFill(0xff0000);
			_pen.drawStar(400, 250, 8, 150, 200, 0);
			_pen.endFill();
			addChild(_shape);
			_shape.addEventListener(MouseEvent.CLICK, changeColor);
			
			function changeColor(event:MouseEvent):void
			{
				// create color transform object
				var _colorTransform:ColorTransform = _shape.transform.colorTransform;
				
				// set the color need to be transform
				// more prescious control see another example
				_colorTransform.color = 0xfff000;
				
				// apply transform to display object
				_shape.transform.colorTransform = _colorTransform;
			}
		}
		
		private function colorTransformForBitmap():void
		{
			var _loader:Loader = new Loader();
			var _bitmap:Bitmap;
			var _sprite:Sprite = new Sprite();
			var _colorTransform:ColorTransform;
			
			_loader.load(new URLRequest("images/autobike_1.jpg"));
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, iniBitmap);
			
			addChild(_sprite);
			_sprite.addEventListener(MouseEvent.CLICK, changeColor);
			
			function iniBitmap(event:Event):void
			{
				_bitmap = Bitmap(_loader.content);
				_sprite.addChild(_bitmap);
			}
			
			function changeColor(event:MouseEvent):void
			{
				// assign display object colorTransform to a colorTransform object
				_colorTransform = _sprite.transform.colorTransform;
				
				// set the details for the transform object.
				// number from 0-255
				// need convert different number system
				_colorTransform.redOffset = 100;
				_colorTransform.greenOffset = 200;
				_colorTransform.blueOffset = 150;
				_colorTransform.alphaOffset = 100;
				
				// apply colorTransform object back to display object 
				_sprite.transform.colorTransform = _colorTransform;
			}
			
		}
		
		private function colorTintForBitmap():void
		{
			var _loader:Loader = new Loader();
			var _bitmap:Bitmap;
			var _sprite:Sprite = new Sprite();
			var _colorTransform:ColorTransform;
			
			_loader.load(new URLRequest("images/autobike_1.jpg"));
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, iniBitmap);
			
			addChild(_sprite);
			_sprite.addEventListener(MouseEvent.CLICK, changeColor);
			
			function iniBitmap(event:Event):void
			{
				_bitmap = Bitmap(_loader.content);
				_sprite.addChild(_bitmap);
			}
			
			function changeColor(event:MouseEvent):void
			{
				// assign display object colorTransform to a colorTransform object
				_colorTransform = _sprite.transform.colorTransform;
				
				// range from 0 to 1
				// 0 tend to back, 1 tend to white
				_colorTransform.redMultiplier = 0.5;
				_colorTransform.blueMultiplier = 0.5;
				_colorTransform.greenMultiplier = 0.5;
				_colorTransform.alphaMultiplier=0.5
				
				// apply colorTransform object back to display object 
				_sprite.transform.colorTransform = _colorTransform;
			}
			
		}
	}
}
