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
			passwordInput();
		}
		
		private function passwordInput():void
		{
			var _textField:TextField = new TextField();
			
			_textField.displayAsPassword = true;
			_textField.text = "This is TextField";
			_textField.border = true;
			_textField.x = _textField.y = 200;
			
			addChild(_textField);
		}
	}
}
