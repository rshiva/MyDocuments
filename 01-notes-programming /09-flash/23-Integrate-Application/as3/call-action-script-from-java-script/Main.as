package {
	import flash.display.*;
	import flash.events.*;
	import flash.external.ExternalInterface;


	public class Main extends Sprite {
		function Main() {
			ExternalInterface.addCallback("showText", displayMessage);
		}
		
		private function displayMessage(texto:String):void {
			iText.text = texto;
		}
	}
}