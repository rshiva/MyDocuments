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
			// set portation of text to be selected
			selectText();
		}
		
		private function selectText():void
		{
			var _textField:TextField = new TextField();
			_textField.x = _textField.y = 200;
			_textField.width = 250;
			
			// set focus to textField
			stage.focus = _textField;
			
			// set text for textField
			_textField.text = "the text had been selected";
			
			// set selection
			_textField.setSelection(0, 8);
			addChild(_textField);
		}
	}	
}
