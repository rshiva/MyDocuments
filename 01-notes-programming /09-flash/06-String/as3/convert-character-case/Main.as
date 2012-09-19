package 
{
	import ascb.util.StringUtilities;
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{	
		private var _string:String = "Here are some words. Also, here is some punctuation!";
		
		public function Main()
		{	
			// convert string to low case
			toLowCase();
			
			// convert string to upper case
			toUpperCase();
			
			// capitalize the first letter
			iniCap();
			
			// capitalize initial letter for each words
			titleCase();
		}
		
		private function toLowCase():void
		{
			// toLowerCase will return a new string
			trace(_string.toLowerCase()); // here are some words. also, here is some punctuation!
		}
		
		private function toUpperCase():void
		{
			// toUpperCase will return a new string
			trace(_string.toUpperCase()); // HERE ARE SOME WORDS. ALSO, HERE IS SOME PUNCTUATION!
		}
		
		private function iniCap():void
		{
			trace(StringUtilities.toInitialCap(_string)); // Here are some words. also, here is some punctuation!
		}
		
		private function titleCase():void
		{
			trace(StringUtilities.toTitleCase(_string)); // Here Are Some Words. Also, Here Is Some Punctuation!
		}
	}
}
