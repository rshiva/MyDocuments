package 
{
	import ascb.util.StringUtilities;
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{	
		private var _string:String = "12345";
		
		public function Main()
		{	
			// reverse string by words
			trace(reverseByChar(_string));
		}
		
		private function reverseByChar($string:String):String
		{
			// split string to character
			var _character:Array = $string.split("");
			
			// use reverse from array
			_character.reverse();
			
			// assign to a new string
			var _newString:String = _character.join("");
			
			return _newString;
		}
	}
}
