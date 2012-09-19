package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			var _letter:Array = ["a", "b", "c"];
			// use toString() method to convert array
			var _string1:String = _letter.toString();
			trace(_string1);
			
			// use join method to define the delimiter
			var _string2:String = _letter.join("|");
			trace(_string2);
			
			// join() method default delimiter is comma
			var _string3:String = _letter.join();
			trace(_string3);
		}
	}
}
