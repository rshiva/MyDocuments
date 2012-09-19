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
			// create xml object and add element myElement
			var _xml:XML =<example/>;
			
			// Create a new empty node and add it to the xml object
			_xml.newElement = <node1 />;
			
			// same as above, create a new element by creating a property on the XML instance and assigning it a value
			_xml.node2 = "";
			
			trace(_xml);
		}
	}	
}