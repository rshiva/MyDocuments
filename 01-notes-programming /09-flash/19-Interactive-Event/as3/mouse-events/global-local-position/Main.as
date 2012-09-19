package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	/**
	 * ...
	 * @author Harry
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			// Create the TextField
			var textfield:TextField = new TextField( );
			textfield.text = "Click here";
			textfield.autoSize = TextFieldAutoSize.LEFT;
			textfield.x = 100;
			textfield.y = 100;
			
			stage.addChild(textfield);
			
			textfield.addEventListener(MouseEvent.CLICK, clickListener);
		}

		private function clickListener (e:MouseEvent):void {
			// Mouse pointer position relative to the TextField object
			trace("Position in TextField's coordinate space: (" + e.localX + ", " + e.localY + ")");
			
			// Mouse pointer position relative to the Stage instance
			trace("Position in Stage instance's coordinate space: (" + e.stageX + ", " + e.stageY + ")");
		}
	}
}