package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// create multidimensional associative array
			var cars:Array = 
			[
				{ make: "Honda",    year: 1997, color: "maroon" },
				{ make: "Chrysler", year: 2000, color: "beige" },
				{ make: "Mercedes", year: 1985, color: "blue" },
				{ make: "Honda",    year: 1997, color: "maroon" },
				{ make: "Chrysler", year: 2000, color: "beige" },
				{ make: "Mercedes", year: 1985, color: "blue" }
			]
			
			
			// remove element from beginning of top array 
			cars.shift();
			
			// remove element from end of top array
			cars.pop();
			
			// remove elements by specify index from top array 
			cars.splice(0, 2);
			
			outPut();
			
			//read elements in associative array
			function outPut():void{
				for (var i:int = 0; i < cars.length; i++) 
				{
					// trace(cars[i].color + " " + cars[i].year + " " + cars[i].make);
					for (var sRole:String in cars[i]) 
					{
						trace(sRole + ": " + cars[i][sRole]);
					}
					trace("-------------------");
				}
			}
		}
	}
}
