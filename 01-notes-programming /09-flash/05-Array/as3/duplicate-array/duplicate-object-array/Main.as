package {

	import flash.display.Sprite;
	import flash.events.*;
	import ascb.util.ArrayUtilities;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// create multidimensional associative array
			var cars:Array = new Array();
			cars.push({make: "Honda",    year: 1997, color: "maroon"});
			cars.push({make: "Chrysler", year: 2000, color: "beige"});
			cars.push( { make: "Mercedes", year: 1985, color: "blue" } );
			
			// duplicate multidimensional associative array must set second paramater is true
			var newCars:Object = ArrayUtilities.duplicate(cars, true);
			
			cars.push({make: "0", year: 0, color: "0"});
			
			// read elements in associative array
			for (var i:int = 0; i < cars.length; i++) 
			{
				trace(cars[i].color + " " + cars[i].year + " " + cars[i].make);
			}
			for (var i:int = 0; i < newCars.length; i++) 
			{
				trace(newCars[i].color + " " + newCars[i].year + " " + newCars[i].make);
			}
			
		}
	}
}
