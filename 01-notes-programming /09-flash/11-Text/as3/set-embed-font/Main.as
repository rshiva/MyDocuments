package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	public class Main extends Sprite 
	{
		// define the font resource to embed
		[Embed(source='../bin/fonts/julies.ttf',fontName="julies",mimeType="application/x-font-truetype")]
		
		// must define the embedding font as class
		private var julies:Class;
		
		public function Main(  ) 
		{
			// set fonts by html tag
			// setFont1();
			
			// set font by textFormat
			// setFont2();
			
			// set font by external css
			// setFont3();
			
			// set the font by embedding font
			// define the embedded font at beginning 
			useEmbeddingFont();
		}
		
		private function setFont1():void
		{
			var _textField:TextField = new TextField();
			
			// set font by html tag
			_textField.htmlText="<font face='Verdana'>Formatted text</font>";
			_textField.x = _textField.y = 200;
			addChild(_textField);
		}
		
		private function setFont2():void
		{
			var _textField:TextField = new TextField();
			var _textFormat:TextFormat = new TextFormat();
			
			// set font for textFormat object
			_textFormat.font = "Verdana";
			
			// apply textFormat to textField
			_textField.defaultTextFormat = _textFormat;
			
			_textField.text = "text format";
			_textField.x = _textField.y = 200;
			
			addChild(_textField);
		}
		
		private function setFont3():void
		{
			var _textField:TextField = new TextField();
			_textField.x = _textField.y = 200;
			
			
			var _loader:URLLoader = new URLLoader(new URLRequest("css/font.css"));
			_loader.addEventListener(Event.COMPLETE, applyCss);
			
			function applyCss(event:Event):void
			{
				var _styleSheet:StyleSheet = new StyleSheet();
				_styleSheet.parseCSS(URLLoader(event.target).data);
				
				_textField.styleSheet = _styleSheet;
				_textField.text = "<p>StyleSheet Text</p>";
				
				addChild(_textField);
			}
			
		}
		
		private function useEmbeddingFont():void
		{	
			// create textformat set it property
			var _textFormat:TextFormat = new TextFormat();
			_textFormat.size = 30;
			_textFormat.font = "julies";
			
			var _textField:TextField = new TextField();
			
			// must set embedFonts property if using embedded font
			_textField.embedFonts = true;
			
			// apply textFormat to textField
			_textField.defaultTextFormat = _textFormat;
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.text = "Apply text by embedding font";
			_textField.x = _textField.y = 200;
			
			addChild(_textField);
		}
		
	}	
}
