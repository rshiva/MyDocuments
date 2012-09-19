package {
	import flash.display.*;
	import flash.events.*;
	import flash.external.ExternalInterface;


	public class Main extends Sprite {
		function Main() {
			iBtn.addEventListener(MouseEvent.CLICK,popupWindow);
		}
		
		private function popupWindow(event:Event):void {
			ExternalInterface.call("openwin", "1.html");
			var text:String = ExternalInterface.call("openwin");
			iText.text = text;
		}
	}
}