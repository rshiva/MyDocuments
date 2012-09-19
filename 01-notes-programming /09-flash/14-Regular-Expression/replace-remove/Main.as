package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main() {
			// remove characters specificd by regular expression
			removeChar();
		}
		
		private function removeChar():void {
			var _string:String = "the test is the test";
			_string = _string.replace(/the/g, "");
			trace(_string);
		}
	}
}
