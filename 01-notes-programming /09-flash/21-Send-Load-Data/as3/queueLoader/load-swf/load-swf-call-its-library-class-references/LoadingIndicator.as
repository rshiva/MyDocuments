package  
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	/**
	 * ...
	 * @author ...
	 */
	
	public class LoadingIndicator extends Sprite
	{
		var positionX:Number;
		var positionY:Number;
		
		var indicatorWidth:Number;
		var indicatorHeight:Number;
		
		var displayText:TextField = new TextField();
		var itemprogbg:Shape;
		var itemprog:Shape
		
		public function LoadingIndicator($x:Number,$y:Number,$width:Number,$height:Number) 
		{
			positionX = $x;
			positionY = $y;
			indicatorWidth = $width;
			indicatorHeight = $height;
			
			// create background
			itemprogbg = createBar(0x333333, .3);
			itemprogbg.width = indicatorWidth;
			this.addChild(itemprogbg);
			
			// create progress bar
			itemprog = createBar(0x333333, 1);
			this.addChild(itemprog);
			
			// create display text
			createText();
		}
		
		private function createBar(color:uint, alpha:Number):Shape {
			var s:Shape = new Shape();
			s.graphics.beginFill(color, alpha);
			s.graphics.drawRect(0, 0, 1, indicatorHeight);
			s.graphics.endFill();
			s.x = positionX;
			s.y = positionY;
			return s;
		}
		
		private function createText():void {
			displayText.x = positionX;
			displayText.y = positionY + height + 10;
			displayText.autoSize = TextFieldAutoSize.LEFT;
			displayText.text = "This is a testing";
			
			var displayTextStyle:TextFormat = new TextFormat();
			displayTextStyle.size = 12;
			
			displayText.setTextFormat(displayTextStyle);
			this.addChild(displayText);
		}
		
		public function updateText(text:String):void {
			displayText.text = text;
		}
		
		public function updateProgressBar(percent:Number):void {
			itemprog.width = percent * indicatorWidth;
		}
		
	}
	
}