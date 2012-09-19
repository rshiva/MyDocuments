package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{	
		private var _string:String = "Here are some words. Also, here is some punctuation!";
		
		public function Main()
		{	
			// split string to characters
			splitChar(_string);
		}
		
		private function splitChar($string:String):void
		{
			// Split the string into an array of characters (one-character strings).
			var characters:Array = $string.split("");
			
			// Loop through all the elements of the characters array.
			for ( var i:int = 0; i < characters.length; i++ ) 
			{
				trace(characters[i]);
			}
		}
	}
}
