package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			var list:String = "Peter Piper picked a peck of pickled peppers";
			//use a space as the delimiter to split a string into an array
			var words:Array = list.split(" ");
			trace(words);
			
			var names:String = "Michael,Peter,Linda,Gerome,Catherine";
			//use a comma as the delimiter to split a string into an array
			var nameArray:Array = names.split(",");
			trace(nameArray);
		}
		
	}
}
