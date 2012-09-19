package {

	import flash.display.Sprite;
	import flash.events.*;
	import ascb.util.ArrayUtilities;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			
			var letters:Array = ["a", "b", "c", "d", "a", "b", "c", "d"];
			
			// return the match element index
			trace(ArrayUtilities.findMatchIndex(letters, "b"));

			// did not find match element will return -1
			trace(ArrayUtilities.findMatchIndex(letters, "r"));
			
			// Specify the starting index 
			trace(ArrayUtilities.findMatchIndex(letters, "a", 1));
			
			
			// find elements are partial matches 
			// var words:Array = ["bicycle", "baseball", "mat", "board"];
			// trace(ArrayUtilities.findMatchIndex(words, "s", true));
			
			// find more than one elements
			// var letters:Array = ["a", "b", "c", "d", "a", "b", "c", "d"];
			// trace(ArrayUtilities.findMatchIndices(letters, "b"));
			
			// find more than one partial match
			// var words:Array = ["bicycle", "baseball", "mat", "board"];
			// trace(ArrayUtilities.findMatchIndices(words, "b", true));
		}
	}
}
