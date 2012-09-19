package 
{
	import flash.display.*;
	import flash.events.*;
	import ascb.util.DateFormat;

	public class Main extends Sprite 
	{
		public function Main(){
			
			var example:Date = new Date(2010, 3, 10);
			
			trace(DateFormat.DAYS[example.day]);  // Displays: Saturday
			trace(DateFormat.DAYS_ABBREVIATED[example.day]);  // Displays: Sat
			trace(DateFormat.MONTHS[example.month]);  // Displays: April
			trace(DateFormat.MONTHS_ABBREVIATED[example.month]);  // Displays: Apr
		}
	}
}
