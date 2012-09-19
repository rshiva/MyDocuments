package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		
		public function Main()
		{	
		   	var _string:String = "orginal content";
			
			// add new content and return a new string 
			var _newString:String = _string.concat(" new content");
			trace(_string);
			trace(_newString);
			
			
			// add new content and change orginal string
			_string += " changed with new content";
			trace(_string);
		}
		
	}
}
