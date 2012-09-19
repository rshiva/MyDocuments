package {

	import flash.display.Sprite;
	import flash.events.*;
	import ascb.util.ArrayUtilities;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			var letters1:Array = ["a", "b", "c", "d"];
			var letters2:Array = ["b", "a", "d", "c"];
			
			// compare elements with index order
			trace(ArrayUtilities.equals(letters1, letters2, false));
			
			// compare elements without index order
			trace(ArrayUtilities.equals(letters1, letters2, true));
		}
	}
}
