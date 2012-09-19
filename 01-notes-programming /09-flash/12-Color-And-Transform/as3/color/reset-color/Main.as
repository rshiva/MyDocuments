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
			// on click reset color transform applied to display object
			resetColorChange();
		}
		
		
		
		private function resetColorChange():void
		{
			var _loader:Loader = new Loader();
			var _bitmap:Bitmap;
			var _sprite:Sprite = new Sprite();
			var _colorTransform:ColorTransform;
			
			_loader.load(new URLRequest("images/autobike_1.jpg"));
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, iniBitmap);
			
			addChild(_sprite);
			
			// on click reset applied colorTransform
			_sprite.addEventListener(MouseEvent.CLICK, resetColor);
			
			function iniBitmap(event:Event):void
			{
				_bitmap = Bitmap(_loader.content);
				_sprite.addChild(_bitmap);
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
			
			function resetColor(event:MouseEvent):void
			{
				// reset colorTransform to default
				_sprite.transform.colorTransform = new ColorTransform();
			}
			
		}
	}
}
