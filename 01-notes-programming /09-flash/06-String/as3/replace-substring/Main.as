package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{	
		private var _string:String = "Here are some words. Also, here is some punctuation!";
		
		public function Main()
		{	
			// replace characters by specific characters
			// in _string find some to replace with lot
			// substring surrounded by spaces, can avoid to replace other substring
			// in _string find some to replace with lot
			replaceChars(_string, " some ", " lot ");
		}
		
		private function replaceChars($string:String,$find:String,$replace:String):void
		{
			while ( $string.indexOf($find) != -1 ) 
			{
				$string = $string.replace($find, $replace);
			}
			
			trace($string);
		}
	}
}
