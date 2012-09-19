package 
{
	import ascb.drawing.Pen;
	import flash.display.*;
	import flash.events.*;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// draw display object in bitmap object
			drawObject();
		}
		
		private function drawObject():void
		{
			// create a display obecjt and draw a shapes in it 
			var _sprite:Sprite = new Sprite();
			var pen:Pen = new Pen(_sprite.graphics);
			pen.beginFill(0xcccccc);
			pen.drawStar(400, 250, 6, 200, 100, 0);
			pen.endFill();
			
			// create a bitmapData object
			// width=stage's width
			// height=stage's height
			// support transparent and background color is 0x0fff0000
			var _bitmapData:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0x0fff0000);
			
			// use bitmapData draw method to draw the display object in bitmapData object
			_bitmapData.draw(_sprite);
			
			// add bitmapData to bitmap object
			var _bitmap:Bitmap = new Bitmap(_bitmapData);
			
			// add bitmap to display list
			addChild(_bitmap);
			
		}
		
		
	}
}
