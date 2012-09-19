package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// add hyperlink by html tag
			addLinkByHTML();
			
			// add hyperlink by textFormat
			addLinkByTextFormat();
			
			// control hyperlink by external CSS
			addLinkByCSS();
		}
		
		private function addLinkByHTML():void
		{
			var _textField:TextField = new TextField();
			_textField.x = 200;
			_textField.y = 100;
			_textField.width = 300;
			_textField.htmlText = "<a href='http://www.rightactionscript.com' target='blank'>Add link by HTML</a>";
			
			addChild(_textField);
		}
		
		private function addLinkByTextFormat():void
		{
			var _textField:TextField = new TextField();
			_textField.x = 200;
			_textField.y = 200;
			_textField.width = 300;
			
			// don't need set html text
			_textField.text = "add link by textFormat";
			
			var _textFormat:TextFormat = new TextFormat();
			
			// set mail link
			// _textFormat.url = "mailto:joey@person13.com";

			// set textFormat url
			_textFormat.url = "http://www.rightactionscript.com/";
			
			// set textFormat target
			_textFormat.target = "blank";
			
			_textField.setTextFormat(_textFormat);
			
			addChild(_textField);
		}
		
		private function addLinkByCSS():void
		{
			var _textField:TextField = new TextField();
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.x = 200;
			_textField.y = 300;
			
			var _loader:URLLoader = new URLLoader(new URLRequest("css/alink.css"));
			_loader.addEventListener(Event.COMPLETE, applyCss);
			
			function applyCss(event:Event):void
			{
				var _styleSheet:StyleSheet = new StyleSheet();
				_styleSheet.parseCSS(URLLoader(event.target).data);
				_textField.styleSheet = _styleSheet;
				_textField.htmlText = "<a href='http://www.rightactionscript.com'>Website</a>";
				addChild(_textField);
			}
		}
	}	
}
