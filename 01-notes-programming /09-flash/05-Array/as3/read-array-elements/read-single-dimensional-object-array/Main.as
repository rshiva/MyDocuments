package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// create singal-dimensional associative array
			var members:Object = new Object(  );
			members.scribe = "Franklin";
			members.chairperson = "Gina";
			members.treasurer = "Sindhu";
			
			// Use a for . . . in statement to loop through all elements.
			for (var sRole:String in members) 
			{
				trace(sRole + ": " + members[sRole]);
			}
		}
	}
}
