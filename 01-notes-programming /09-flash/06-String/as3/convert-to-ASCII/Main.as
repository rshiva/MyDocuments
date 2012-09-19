package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		private var _string:String = "This is a test.";
		
		public function Main()
		{	
			// convert string to ASCII
			convertToASCII(_string);
			
			// convert ASCII to string
			convertFromASCII();
		}
		
		private function convertToASCII($string:String):void
		{
			var ASCII:Array = new Array();
			for (var i:int = 0; i < $string.length; i++)
			{
				ASCII.push($string.charCodeAt(i));
			}
			trace(ASCII);
		}
		
		private function convertFromASCII():void
		{
			// fromCharCode is static method can be used directly
			trace(String.fromCharCode(84,104,105,115,32,105,115,32,97,32,116,101,115,116,46))
		}
	}
}
