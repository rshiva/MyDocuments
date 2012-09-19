package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			assignFocus();
		}
		
		private function assignFocus():void
		{
			var _textField:TextField = new TextField();
			_textField.type = TextFieldType.INPUT;
			_textField.border = true;
			_textField.x = _textField.y = 200;
			_textField.width = 250;
			_textField.text = "Input Here";
			
			// assign the focus to textfield
			stage.focus = _textField;
			addChild(_textField);
		}
	}	
}
