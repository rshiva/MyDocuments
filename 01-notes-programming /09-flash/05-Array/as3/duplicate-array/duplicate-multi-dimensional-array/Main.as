package {

	import flash.display.Sprite;
	import flash.events.*;
	import ascb.util.ArrayUtilities;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// duplicate multidimensional array
			var cars:Array = new Array();
			cars.push(["maroon", 1997, "Honda"]);
			cars.push(["beige", 2000, "Chrysler"]);
			cars.push(["blue", 1985, "Mercedes"]);
			
			// when duplicate multi array must set second paramater is true
			var newCars:Array = ArrayUtilities.duplicate(cars, true) as Array;
			cars.push([0,0,0]);
			
			trace(cars);
			trace(newCars);
		}
	}
}
