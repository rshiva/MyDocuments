package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.xml.*;
	
	/**
	 * ...
	 * @author harry
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			var _xml:XML =<firstLevel/>;
			
			// add elements by for loop 
			for (var i:int = 1; i < 6; i++) {
				_xml[ "user" + i] = "";    
			}
			trace(_xml);
		}
	}	
}