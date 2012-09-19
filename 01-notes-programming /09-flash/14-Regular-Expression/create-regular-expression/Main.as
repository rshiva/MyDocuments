package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main()
		{	
			// create regular expression by literal
			// test specific string by exec method
			// basic1();
			
			
			
			// create regular expression by constructor,
			// test spfcific string by test method
			basic2();
		}
		
		private function basic1():void
		{
			var _string:String = new String("this is a test for abc");
			
			// create regular expression by literal
			var _regExp:RegExp =/abc/;
			
			// exec method will return an array
			var _array:Array = _regExp.exec(_string);
			
			if (_array != null)
			{
				// if found matching substring, index is starting location in which the matching substring was found
				trace(_array.index);
				
				// if found matching substring, input is the string that the regex was executed against.
				trace(_array.input);
				
				trace(_array);
				trace(_array.length);
			}
		}
		
		
		private function basic2():void
		{
			// create regular expression by constructor
			var _string:String = "this is a test";
			var _regExp:RegExp = new RegExp("abc");
			
			// if find match, test method will return true
			trace(_regExp.test(_string));
		}
	}
}
