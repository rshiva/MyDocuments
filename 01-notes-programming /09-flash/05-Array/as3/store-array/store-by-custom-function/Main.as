package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			var bands:Array = ["The Clash","The Who","Led Zeppelin","The Beatles","Aerosmith","Cream"];
			bands.sort(  );
			outPut();
			// pass two parameter to compare function. the compare function do the compare.
			// The compare function then determines which one should be ordered first 
			// If the function returns a negative number, a is ordered before b. 
			// If the function returns 0, then the current order is preserved. 
			// If the function returns a positive number, a is ordered after b.
			// The sort( ) method calls the compare function with every relevant combination of elements until the entire array has been properly ordered. 
			bands.sort(bandNameSort);
			outPut();
			
			function bandNameSort(band1:String, band2:String):int
			{
				band1 = band1.toLowerCase(  );
				band2 = band2.toLowerCase(  );
				// remove the with space
				if(band1.substr(0, 4) == "the ") {
					band1 = band1.substr(4);
				}
				if(band2.substr(0, 4) == "the ") {
					band2 = band2.substr(4);
				}
				// set return value
				if(band1 < band2) {
					return -1;
				}
				else {
					return 1;
				}
			}
			
			function outPut():void
			{
				for (var i:int = 0; i < bands.length; i++) 
				{
					trace(bands[i]);
				}
				trace("---------------------------------");
			}
			

		}
	}
}
