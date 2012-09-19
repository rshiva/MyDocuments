package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			userInput();
		}
		
		private function userInput():void
		{
			var _textField:TextField = new TextField();
			
			// define TextField type
			_textField.type = TextFieldType.INPUT;
			
			_textField.border = true;
			
			_textField.text = "Input here";
			
			_textField.x = _textField.y = 200;
			addChild(_textField);
		}
	}
}
