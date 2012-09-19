package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLLoader;
    import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;


	public class Main extends Sprite 
	{
		public function Main() {
			var _currentDate:Date = new Date();
			
			var _textField:TextField = new TextField();
			_textField.x = 100;
			_textField.y = 100;
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.text = "Client Time:" + _currentDate.toString();
			addChild(_textField);
		}
	}
}
