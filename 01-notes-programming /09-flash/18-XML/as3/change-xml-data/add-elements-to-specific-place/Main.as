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
			
			// add element
			_xml.middle = "";
			
			// add a one element node before middle
			_xml.insertChildBefore( _xml.middle, <before/> );
			
			// add a one element node after middle
			_xml.insertChildAfter( _xml.middle, <after/> );
			
			// add element to end
			_xml.appendChild( <test>2</test> );
			
			// add element to beginning
			_xml.prependChild( <test>1</test> );
			trace(_xml);
		}
	}	
}