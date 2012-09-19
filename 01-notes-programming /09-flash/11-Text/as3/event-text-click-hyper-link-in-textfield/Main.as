package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextFormat
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// call method from hyperlink
			callAsFromLink();
		}    
		
		private function callAsFromLink():void
		{
			var _textField:TextField = new TextField();
			_textField.x = _textField.y = 200;
			
			// add hyperlink
			// href='event:eventText'
			_textField.htmlText = "<a href='event:Link1'>Link1</a> <a href='event:Link2'>Link2</a> ";
			
			// when click on hyperline call linkfunction
			_textField.addEventListener(TextEvent.LINK, linkFunction);
			addChild(_textField);
			
			function linkFunction(event:TextEvent):void
			{
				// conditions for click on different hyperlink
				if (event.text == "Link1")
				{
					trace("clicl on link1");
				}
			}
			
			
		}
	}
}
