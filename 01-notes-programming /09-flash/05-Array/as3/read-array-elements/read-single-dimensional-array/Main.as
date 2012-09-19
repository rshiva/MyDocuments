package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// create single dimensional array
			var letters:Array = ["a", "b", "c"];
			
			// read elements in array from beginning
			for (var i:int = 0; i < letters.length; i++) 
			{
				trace(letters[i]);
			}
			
			//read elements in array from end
			for (var i:int = letters.length - 1; i >= 0; i--)
			{
				trace(letters[i]);
			}
		}
	}
}
