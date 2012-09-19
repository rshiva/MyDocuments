package 
{
	import flash.display.*;
	import flash.events.*;
	import ascb.util.DateFormat;

	public class Main extends Sprite 
	{
		public function Main(){
			// create date object
			var example:Date = new Date();
			
			// create formatter object and set the mask
			var formatter:DateFormat = new DateFormat("F/d/Y l 'at' h:i a");
			
			// apply formatter to date obj
			trace(formatter.format(example));
			
			// use mask property to get or set mask
			formatter.mask = "m/d/Y h:i a";
			trace(formatter.format(example));
			
			// set characters at outpu
			formatter.mask = "m/d/Y 'at' h:i a";
			trace(formatter.format(example));
		}
	}
}
