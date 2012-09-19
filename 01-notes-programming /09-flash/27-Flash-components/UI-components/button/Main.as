package  
{
	import flash.display.Sprite;
	import fl.controls.Button;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Harry
	 */
	
	 public class Main extends Sprite
	{
		var iButton:Button = new Button();
		
		public function Main() 
		{
			iButton.label = "Click me";
			iButton.toggle = true; //toggle between button "up" and "selected_up" state 
			iButton.move(100, 100);
			
			iButton.addEventListener(MouseEvent.CLICK, clickHandler);
			
			addChild(iButton);
		}
		
		public function clickHandler(e:MouseEvent):void {
			trace(e.type);
		}
		
	}

}