package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{	
		private var _string:String = "Here are some words. Also, here is some punctuation!";
		
		public function Main()
		{	
			// remove characters
			removeChars(_string, " some");
		}
		
		private function removeChars($string:String,$find:String):void
		{
			while ( $string.indexOf($find) != -1 ) 
			{
				$string = $string.replace($find, "");
			}
			
			trace($string);
		}
	}
}
