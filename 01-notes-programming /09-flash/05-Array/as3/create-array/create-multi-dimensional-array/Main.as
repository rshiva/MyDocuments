package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// create multidimensional array
			var cars:Array = 
			[
				["maroon", 1997, "Honda"],
				["beige", 2000, "Chrysler"],
				["blue", 1985, "Mercedes"]
			];
			trace(cars);
		}
	}
}
