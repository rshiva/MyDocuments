package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// create multidimensional associative array
			var cars:Array = [ { make: "Honda",    year: 1997, color: "maroon" }, { make: "Chrysler", year: 2000, color: "beige" }, { make: "Mercedes", year: 1985, color: "blue" } ];
			trace(cars);

		}
	}
}
