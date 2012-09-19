package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main() {
			// if found matching return substring index
			// if no matching return -1
			// search method not support global flag
			// searchMethod();
			
			// match method return an array
			// it works for global flag
			matchMehtod();
		}
		
		private function searchMethod():void {
			var _string:String = "test is the test";
			var _regExp:RegExp =/the/;
			trace(_string.search(_regExp));
		}
		
		private function matchMehtod():void {
			var _string:String = "the test is the test";
			var _regExp:RegExp =/the/g;
			var result:Array=_string.match(_regExp);
			trace(result);
		}
	}
}
