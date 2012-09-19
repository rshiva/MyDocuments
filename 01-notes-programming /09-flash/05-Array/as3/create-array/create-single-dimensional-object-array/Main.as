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
			
			trace(members);
		}
	}
}
