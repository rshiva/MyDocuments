package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// format portion of text in textField
			formatPortionText();
		}
		
		private function formatPortionText():void
		{
			var _textFormat:TextFormat = new TextFormat();
			_textFormat.color = 0x990000;
			_textFormat.bold = true;
			
			var _textField:TextField = new TextField();
			_textField.x = _textField.y = 200;
			_textField.autoSize = TextFieldAutoSize.LEFT;
			
			// set text then set text format if want specify part of text
			// other wise will cause error
			_textField.text = "Urna non sem sollicitudin tempor. In hac habitasse";
			
			// begin:0,
			// end:10,
			// textFormat:_textFormat
			_textField.setTextFormat( _textFormat, 0,10);
			
			addChild(_textField);
		}
	}	
}
