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
			var loader:URLLoader = new URLLoader(  );
			loader.addEventListener(Event.COMPLETE, onDateTimeLoad);
			
			// communicate with the server side script
			// must use the full url with http://
			loader.load(new URLRequest("http://www.roamingronin.com/time.asp"));
			
			
			function onDateTimeLoad(event:Event):void {
				var loader:URLLoader = URLLoader(event.target);
				var _textField:TextField = new TextField();
				_textField.x = 100;
				_textField.y = 120;
				_textField.autoSize = TextFieldAutoSize.LEFT;
				_textField.text = "Server Time:" +loader.data.toString();
				addChild(_textField);
			}
		}
	}
}
