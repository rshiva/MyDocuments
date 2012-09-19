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
				["blue", 1985, "Mercedes"],
				["gray", 1983, "Fiat"],
				["maroon", 1997, "Honda"],
				["beige", 2000, "Chrysler"],
				["blue", 1985, "Mercedes"],
				["gray", 1983, "Fiat"],
			];

			
			// remove element from beginning of top array
			cars.shift();
			
			// remove element from beginning of nested array
			cars[0].shift();
			
			// remove element from end of top array
			cars.pop();
			
			// remove element from end of nested array
			cars[0].pop();
			
			// remove elements from specify top array
			cars.splice(0, 2);
			
			// remove elements from specify nested array
			cars[0].splice(0, 2);
			
			outPut();
			
			// read elements in multidimensional array
			function outPut():void{
				for (var i:int = 0; i < cars.length; i++) 
				{
					trace(cars[i]);
				}
			}
		}
	}
}
