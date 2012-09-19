package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// create multidimensional array
			var cars:Array = [["maroon", 1997, "Honda"],["beige", 2000, "Chrysler"],["blue", 1985, "Mercedes"]];
			
			// read elements in multidimensional array
			for (var i:int = 0; i < cars.length; i++) 
			{
				trace(cars[i]);
				for (var j:int = 0; j < cars[i].length; j++) 
				{
					trace(cars[i][j]);
				}
			}
		}
	}
}
