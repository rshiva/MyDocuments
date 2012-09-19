package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// define styleSheet object and apply to textField
			applyCSS1();
			
			// load external CSS, apply to textField
			applyCSS2();
			
			// load 2 external CSS, change them in running time
			applyCSS3();
		}
		
		private function applyCSS1():void
		{
			// create styleSheet object
			var _styleSheet:StyleSheet = new StyleSheet();
			
			// create associative array to contain CSS attribution
			var p:Object = { color:"#00ff00",fontFamily:"Arial"};
			
			// add new attribution to array
			p.fontStyle = "italic";
			
			var emphasis:Object = new Object();
			emphasis.textDecoration = "underline";
			
			_styleSheet.setStyle("p", p);
			
			// set array to stylesheet object
			// name: .emphasis (meet the html tag or class name in textFiled HTML text)
			// object: emphasis
			_styleSheet.setStyle(".emphasis", emphasis);
			
			var _textField:TextField = new TextField();
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.x = 200;
			_textField.y = 100;
			
			// apply stylesheet to textField
			_textField.styleSheet = _styleSheet;
			
			// must make the text as htmlText
			// must set htmlText if compile in flash
			_textField.htmlText = "<p><span class='emphasis'>Lorem ipsum</span> dolor sit amet.</p>";
			
			addChild(_textField);
		}
		
		
		private function applyCSS2():void
		{
			// need URLLoader to load external CSS
			var _loader:URLLoader = new URLLoader();
			
			// create StyleSheet object
			var _styleSheet:StyleSheet = new StyleSheet();
			
			var _textField:TextField = new TextField();
			
			_loader.load(new URLRequest("css/cssRed.css"));
			
			// when loading complete, apply css to textField
			_loader.addEventListener(Event.COMPLETE, applyCSS);
			
			
			function applyCSS(event:Event):void
			{
				// Passing URLLoader data to StyleSheet object
				_styleSheet.parseCSS(URLLoader(event.target).data);
				
				_textField.autoSize = TextFieldAutoSize.LEFT;
				_textField.x = _textField.y = 200;
				
				// apply styleSheet to textField
				// apply styleSheet before set text
				_textField.styleSheet = _styleSheet;
				
				// html tag in string must meet CSS
				// must set htmlText if compile in flash
				_textField.htmlText = "<p><span class='emphasis'>Lorem ipsum</span> dolor sit amet.</p>";
				
				addChild(_textField);
			}
		}
		
		private function applyCSS3():void
		{
			var _sprite:Sprite = new Sprite();
			var _textField:TextField = new TextField();
			var _htmlContent:String = "<p><span class='emphasis'>Lorem ipsum</span> dolor sit amet.</p>";
			
			
			_sprite.addChild(_textField);
			_sprite.x = 200;
			_sprite.y = 300;
			addChild(_sprite);
			
			// call loadCss 
			loadCss("css/cssRed.css");
			
			_sprite.addEventListener(MouseEvent.MOUSE_DOWN, changeCss);
			
			function changeCss(event:MouseEvent):void
			{
				loadCss("css/cssGreen.css");
			}
			
			
			function loadCss(url:String):void
			{
				var _loader:URLLoader = new URLLoader(); 
				var request:URLRequest = new URLRequest(url);
				_loader.load(request);
				
				// when loading complete call applyCss
				_loader.addEventListener(Event.COMPLETE, applyCss);
			}
			
			function applyCss(event:Event):void
			{
				// create stylesheet object
				var _styleSheet:StyleSheet = new StyleSheet();
				
				// use parseCss to get data
				_styleSheet.parseCSS(URLLoader(event.target).data);
				
				_textField.autoSize = TextFieldAutoSize.LEFT;
				
				// apply stylesheet to textfield
				_textField.styleSheet = _styleSheet;
				
				// must reset the text make the style work
				// must set htmlText if compile in flash
				_textField.htmlText = _htmlContent;
			}
		}
	}	
}
