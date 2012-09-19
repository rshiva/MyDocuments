package {
  import flash.display.*;
  import flash.text.*;
  import flash.events.*;
  import flash.utils.*;
	
	public class Main extends Sprite {
		
		public function Main() {
			var t:TextField = new TextField( );
			t.htmlText = "<a href='event:startGame'>Play now!</a>";
			t.autoSize = TextFieldAutoSize.LEFT;
			addChild(t);
			
			t.addEventListener(TextEvent.LINK, linkListener);
		}
		
		private function linkListener (e:TextEvent):void {
			var operationName:String = e.text;
			if (operationName == "startGame") {
				trace("click the link");
			}
		}
	}
}