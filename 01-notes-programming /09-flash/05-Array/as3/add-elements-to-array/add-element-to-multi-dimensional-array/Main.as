package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// create multidimensional array
			var cars:Array = [["maroon", 1997, "Honda"], ["beige", 2000, "Chrysler"]];
			
			// add elements to the end of top array
			cars.push(["blue", 1985, "Mercedes"]);
			
			// add element to the begin of top array
			cars.unshift(["gray", 1983, "Fiat"]);
			
			// add elements to specify index of top array
			cars.splice(2, 0, ["new element", "new element"]);
			
			// add elements to specify index of nested array
			cars[2].splice(1, 0, "middel_1", "middle_2");
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
