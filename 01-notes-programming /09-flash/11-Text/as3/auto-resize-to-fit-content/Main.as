package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			autoFit();
		}
		
		private function autoFit():void
		{
			var _textField:TextField = new TextField();
			
			_textField.x = _textField.y = 200;
			_textField.width = 100;
			_textField.border = true;
			
			_textField.wordWrap = true;
			
			// if set wordWrap to false, TextField extend to right
			_textField.autoSize = TextFieldAutoSize.LEFT;
			
			// if set wordWrap to false, TextField extend to left
			// _textField.autoSize = TextFieldAutoSize.RIGHT;
			
			// if set wordWrap to false, TextField extend both side
			// _textField.autoSize = TextFieldAutoSize.CENTER;
			
			_textField.text = "Urna non sem sollicitudin tempor. In hac habitasse platea dictumst. Cras egestas, elit sed vestibulum mollis, sapien nibh fermentum arcu, ut auctor arcu lectus et diam. Vestibulum tortor est, fringilla et, accumsan id, rutrum ut, nisi. Vestibulum ante est, dignissim ut, commodo eu, rhoncus ac, nunc. Finish here ";
			
			addChild(_textField);
		}
	}	
}
