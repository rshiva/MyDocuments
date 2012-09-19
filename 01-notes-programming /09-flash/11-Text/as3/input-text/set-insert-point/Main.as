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
			// set insert point on text field
			setInsert();
		}
		
		private function setInsert():void
		{
			var _textField:TextField = new TextField();
			
			// set focus to textField
			stage.focus = _textField;
			
			_textField.x = _textField.y = 200;
			_textField.text = "Input";
			_textField.type = TextFieldType.INPUT;
			_textField.border = true;
			
			// set selection start and end at same index
			// it's the insertion point
			_textField.setSelection(5, 5);
			
			addChild(_textField);
		}
	}	
}
