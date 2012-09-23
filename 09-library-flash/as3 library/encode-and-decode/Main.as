package 
{
	import flash.display.*;
	import flash.events.*;
	import ascb.util.StringUtilities;

	public class Main extends Sprite 
	{
		private var _string:String = "This is a test!";
		
		public function Main()
		{	
			var encoded:String = StringUtilities.encode(_string);
			trace(StringUtilities.encode(encoded));
			trace(StringUtilities.decode(encoded));
		}
	}
}
