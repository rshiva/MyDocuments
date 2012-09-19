package 
{
	import ascb.util.StringUtilities;
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{	
		private var _string:String = "111 222 333 444 555";
		
		public function Main()
		{	
			// reverse a string by word
			trace(reverseByWord(_string));
		}
		
		private function reverseByWord($string:String):String
		{
			// split string use " " as limiter
			var _words:Array = $string.split(" ");
			
			// use reverse method by array
			_words.reverse();
			
			// rejoin and assign to a new string
			var _newString:String = _words.join(" ");
			return _newString;
		}
	}
}
