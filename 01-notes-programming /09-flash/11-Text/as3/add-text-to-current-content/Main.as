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
			addNewContent();
		}
		
		private function addNewContent():void
		{
			var _textField:TextField = new TextField();
			
			_textField.x = _textField.y = 200;
			_textField.border = true;
			_textField.width = 300;
			
			_textField.text = "old content.";
			
			// add some text to current text
			_textField.appendText(" Add some new content here");
			
			addChild(_textField);
		}
	}	
}
