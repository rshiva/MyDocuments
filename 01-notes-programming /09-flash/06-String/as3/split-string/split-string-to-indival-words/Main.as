package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{	
		private var _string:String = "Here are some words. Also, here is some punctuation!";
		
		public function Main()
		{	
			// use regular expression remove puncuation and split string to individual words
			splitString(_string);
		}
		
		private function splitString($string:String):void
		{
			// Use a regular expression for punctuation and splits around that to produce a cleaned array of words from the string
			var _array:Array = $string.split( /[^a-zA-Z0-9]+/ );
			
			for ( var i:int = 0; i < _array.length; i++ ) {
			  trace( _array[i] );
			}
		}
	}
}
