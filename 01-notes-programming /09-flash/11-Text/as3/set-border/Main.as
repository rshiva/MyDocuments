package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			makeBorder();
		}
		
		private function makeBorder():void
		{
			var _textField:TextField = new TextField();
			
			_textField.x = stage.stageWidth / 2;
			_textField.y = stage.stageHeight / 2;
			
			_textField.text = "This is a TextField";
			
			// create border
			_textField.border = true;
			
			// define border color
			_textField.borderColor = 0xff00ff;
			
			addChild(_textField);
		}
	}
}
