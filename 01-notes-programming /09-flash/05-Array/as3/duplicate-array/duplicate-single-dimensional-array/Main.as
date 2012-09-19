package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// Assign elements of an array.
			var letters:Array = ["a", "b", "c"];
			
			// Create an independent copy of letters using concat(  ),
			// var newLetters:Array = letters.concat(  );
			
			// Create an independent copy of letters using slice(  ),
			var newLetters:Array = letters.slice(0);
     
			// Both arrays contain the same values, as expected.
			trace(letters);        // Displays: "a,b,c"
			trace(newLetters);     // Displays: "a,b,c"
     
			// Change letters' value.
			letters = ["d", "e", "f"];
     
			// Unlike preceding examples, the arrays are independent.
			trace(letters);        // Displays: "d,e,f"
			trace(newLetters);     // Displays: "a,b,c"
		}
	}
}
