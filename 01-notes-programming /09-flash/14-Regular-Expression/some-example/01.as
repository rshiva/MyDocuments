package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(){
			// g (global) Matches more than one match
			// test1();
			
			// i (ignoreCase) Performs a case-insensitive match for [a-z] and [A-Z] (and not special characters like é)
			// test2();
			
			// m (multiline) Allows ^ to match the end of a line; allows $ to match the beginning of a line
			// test3();
			
			// s (dotall) Allows . to match the newline character \n 
			// test4();
			
			// x (extended) Allows spaces in the regex that are ignored by the pattern, allowing regex to be written more clearly
			// test5();
		}
		
		private function test1():void {
			// set regular expression flag is global 
			var _regExp:RegExp =/the/g;
			var _string:String = "the test is the test";
			var result:Array;
			
			// To match all occurrences of a pattern in a string, 
			// exec( ) needs to be called multiple times on a global regexone time for each match.
			while ( ( result = _regExp.exec(_string))!= null ) {
			  trace( result );
			}
		}
		
		private function test2():void {
			var _regExp:RegExp =/abc/i;
			trace(_regExp.test("Abc"));
		}
		
		private function test3():void {
			var _regExp:RegExp =/^a/m
			trace(_regExp.test("\na"));
			trace(_regExp.test("a"));
		}
		
		private function test4():void {
			var _regExp:RegExp =/a./s
			trace(_regExp.test("a\n "));
			trace(_regExp.test("ab"));
		}
		
		private function test5():void {
			var example1:RegExp = /(a(b)*){2,}/
			
			// Allows spaces in the regex that are ignored by the pattern, allowing regex to be written more clearly
			// the following regular expression equal previous one
			var example2:RegExp = /(a (b)* ){2,}/x;
		}
	}
}
