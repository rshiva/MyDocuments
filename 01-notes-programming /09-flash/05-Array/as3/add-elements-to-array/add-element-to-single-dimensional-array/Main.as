package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// create single dimensional array
			var letters:Array = ["a", "b", "c"];
			
			// add elements to the end of array
			letters.push("d","e");
			trace(letters);
			
			// add elements to the beginning of array
			letters.unshift("&", "@");
			trace(letters);
			
			// add elements from specify index
			letters.splice(3, 0, "g1", "g2", "g3");
			trace(letters);
		}
	}
}
