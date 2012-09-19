package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// create single dimensional array
			var letters:Array = ["a", "b", "c","d","e","f","g"];
			
			// remove element from beginning of array
			letters.shift();
			
			// remove element from end of array
			letters.pop();
			
			// remove elements from specify index
			letters.splice(1, 2);
			trace(letters);
		}
	}
}
