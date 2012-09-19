package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// create multidimensional associative array
			var cars:Array = [{make: "Honda",    year: 1997, color: "maroon"},{make: "Chrysler", year: 2000, color: "beige"}];
			
			// add element to the end of top array;
			cars.push( { make: "Mercedes", year: 1985, color: "blue" } );
			
			// add element to the beginning of top array
			cars.unshift( { make: "Fiat",     year: 1983, color: "gray" } );
			
			// add element to specify index
			cars.splice(2, 0, {men:3, women:10 } );
			
			// add element to nested array
			cars[0].endElement="new element";
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
