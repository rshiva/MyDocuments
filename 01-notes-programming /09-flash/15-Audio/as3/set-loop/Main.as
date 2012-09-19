package 
{
	import flash.display.*;
	import flash.events.*;
	import ascb.util.DateFormat;

	public class Main extends Sprite 
	{
		public function Main() {
			// convert seconds to mm:ss 
			trace(DateFormat.formatSeconds(5000));
			
			// convert milliseconds to mm:ss 
			trace(DateFormat.formatMilliseconds(5000000));
		}
	}
}
