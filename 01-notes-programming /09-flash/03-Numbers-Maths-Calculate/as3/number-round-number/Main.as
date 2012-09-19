package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import ascb.util.NumberUtilities;
	
	/**
	 * 
	 */
	public class Main extends Sprite 
	{
		public function Main():void 
		{
			//Math.round( ) method returns the nearest integer value of any parameter passed to it:
			trace(Math.round(204.499)); // Displays: 204
			trace(Math.round(401.5));   // Displays: 402
			
			
			//Math.floor( ) method rounds down
			trace(Math.floor(204.99));   // Displays: 204
			
			
			//Math.ceil( ) method rounds up:
			trace(Math.ceil(401.01));    // Displays: 402
			
			
			//----- UnmberUtilities class -----//
			//round to decimal places
			trace(NumberUtilities.round(Math.PI));          // Displays: 3
			trace(NumberUtilities.round(Math.PI, .01));     // Displays: 3.14
			trace(NumberUtilities.round(Math.PI, .0001));   // Displays: 3.1416
			
			
			//to round a number to the nearest multiple of an integer
			trace(NumberUtilities.round(123.456, 1));       // Displays: 123
			trace(NumberUtilities.round(123.456, 5));       // Displays: 125
			trace(NumberUtilities.round(123.456, 10));      // Displays: 120
			
		}
		
	}
	
}

