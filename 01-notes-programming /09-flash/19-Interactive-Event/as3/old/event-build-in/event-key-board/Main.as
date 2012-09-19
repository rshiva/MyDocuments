package  
{
	import flash.display.*;
    import flash.events.*;
	import flash.text.TextField;
	/**
	 * ...
	 * @author ...
	 */
	public class Main extends MovieClip
	{
		public function Main() 
		{
			
			stage.focus = this;//must have this line for keyboard event
			addEventListener(KeyboardEvent.KEY_DOWN, traceKeyCode);
		}
		
		private function traceKeyCode(event:KeyboardEvent):void
		{
			trace(event.charCode);
		}
	}
	
}