package {

	import flash.display.Sprite;
	import flash.events.*;
	import ascb.util.ArrayUtilities;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			var scores:Array = [10, 4, 15, 8];
			trace(ArrayUtilities.min(scores));
			trace(ArrayUtilities.max(scores));
		}
	}
}
