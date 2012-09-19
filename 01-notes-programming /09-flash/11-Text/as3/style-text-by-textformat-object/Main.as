package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	import flash.text.TextFormat;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			applyTextFormat();
		}
		
		private function applyTextFormat():void
		{
			var _textFomat:TextFormat = new TextFormat();
			_textFomat.bold = true;
			_textFomat.size = 20;
			_textFomat.color = 0xff0000;
			
			var _textField:TextField = new TextField();
			_textField.x = _textField.y = 200;
			_textField.width = 200;
			
			// set text first, then set textformat
			_textField.text = "Applied TextFormat";
			
			// apply textFormat to textField
			_textField.setTextFormat(_textFomat);
			
			addChild(_textField);
		}
	}	
}
