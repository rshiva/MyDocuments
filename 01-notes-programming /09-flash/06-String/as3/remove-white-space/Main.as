package 
{
	import ascb.util.StringUtilities;
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{	
		private var _string:String = "\n\r\f\ta string\t\t\n\n";
		
		public function Main()
		{	
			// remove the white space at beginning and end of the string
			trimWhiteSpace();
		}
		
		private function trimWhiteSpace():void
		{
			trace(_string);
			trace(StringUtilities.trim(_string));
		}
	}
}
