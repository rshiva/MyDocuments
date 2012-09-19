package {
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;

	public class Main extends Sprite 
	{
		private var _loader:Loader = new Loader();
		
		public function Main(  ) 
		{
			addChild(_loader);
			_loader.load(new URLRequest("swf/Circle.swf"));
			
			// listen to loader's INIT event. 
			// insure the extenal swf to be initialized first, then can be accessed by other function
			// access the uninitialized swf will cause error
			_loader.contentLoaderInfo.addEventListener(Event.INIT, init);
		}
		
		
		private function init(event:Event):void
		{
			// add mouse lintener when the external swf has been initialized
			stage.addEventListener(MouseEvent.CLICK, changeSWF);
		}
		
		
		private function changeSWF(event:MouseEvent):void
		{
			// make a oject to refer loader's content property
			// loader's content property returns an object of type DisplayObject
			// use * to define the data type as will call some custom function in external swf
			var _mc:*= _loader.content;
			
			// call public function setColor() in external swf
			_mc.setColor(0xff0000);
		}
	}
}
