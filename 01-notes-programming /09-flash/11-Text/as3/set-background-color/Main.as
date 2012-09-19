package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			makeBackground();
		}
		
		private function makeBackground():void
		{
			var _textField:TextField = new TextField();
			_textField.text = "This is a TextField";
			_textField.x = _textField.y = 200;
			
			// create background
			_textField.background = true;
			
			// define background color
			_textField.backgroundColor = 0xffff0;
			addChild(_textField);
		}
	}
}
