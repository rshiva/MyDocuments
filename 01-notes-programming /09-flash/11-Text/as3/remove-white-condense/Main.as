package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			whiteCondense();
		}
		
		private function whiteCondense():void
		{
			var _textField:TextField = new TextField();
			
			// set TextField to condense white
			// only apply to html content
			_textField.condenseWhite = true;
			
			_textField.htmlText = "Hello        World";
			_textField.x = _textField.y = 200;
			
			addChild(_textField);
		}
	}	
}
