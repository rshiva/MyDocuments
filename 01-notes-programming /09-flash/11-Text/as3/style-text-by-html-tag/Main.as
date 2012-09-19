package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			applyHTMLFormat();
		}
		
		private function applyHTMLFormat():void
		{
			var _textField:TextField = new TextField();
			var _copy:String = "<b>Bold text</b>   <u>Underlined text</u>";
			
			// apply html format to TextField
			_textField.htmlText = _copy;
			
			_textField.x = _textField.y = 200;
			
			addChild(_textField);
		}
		
	}	
}
