package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main()
		{	
			// ? Matches the preceding character zero or one time 
			// test1();
			
			// * Matches the preceding character zero or more times
			// test2();
			
			// + Matches the preceding character one or more times
			// test3();
			
			// . Matches any one character except newline (unless the dotall flag is set)
			// test4();
			
			// ^ Matches the start of the string (also matches the start of a line when the multiline flag is set)
			// test5();
			
			// $ Matches the end of the string (also matches the position before a newline "\\n" when the multiline flag is set)
			// test6();
			
			// | Matches either the left or right side of the pipe
			// test7();
			
			// \ Escapes the special meaning of the metacharacter following the backslash
			// test8();
			
			// ( ) Creates groups within the regular expression to:
			// Define the scope of |
			// Define the scope of { and }
			// Use back references, where \1 refers to whatever is matched in the first group, etc.
			// test9();
			
			// [ ] Defines character classes that represent matches for a single character. 
			// Presence of a indicates a range of characters
			// A caret (^) at the beginning negates the character class (everything except what is defined by the class matches)
			// Metacharacters do not need to be escaped with a backslash (but a dash and beginning caret do)
			test10();
		}
		
		private function test1():void
		{
			var _regExp:RegExp =/ta?k/;
			trace(_regExp.test("tak"));
			trace(_regExp.test("tk"));
		}
		
		private function test2():void
		{
			var _regExp:RegExp =/ta*k/;
			trace(_regExp.test("tak"));
			trace(_regExp.test("tk"));
			trace(_regExp.test("taaaaaaaaak"));
		}
		
		private function test3():void
		{
			var _regExp:RegExp =/ta+k/;
			trace(_regExp.test("tak"));
			trace(_regExp.test("taaaaaaaaak"));
		}
		
		private function test4():void
		{
			var _regExp:RegExp =/ta.k/;
			trace(_regExp.test("ta&k"));
			trace(_regExp.test("tak"));
			
		}
		
		private function test5():void
		{
			var _regExp:RegExp =/^tak/;
			trace(_regExp.test("takwerwerewrewrw"));
		}
		
		private function test6():void
		{
			var _regExp:RegExp =/tak$/;
			trace(_regExp.test("qwrerwerwertak"));
		}
		
		private function test7():void
		{
			var _regExp:RegExp =/t|a/;
			trace(_regExp.test("t"));
			trace(_regExp.test("a"));
			trace(_regExp.test("ta"));
			trace(_regExp.test("k"));
		}
		
		private function test8():void
		{
			var _regExp:RegExp =/\./;
			trace(_regExp.test("t.a"));
		}
		
		private function test9():void
		{
			/*
			var _regExp:RegExp =/l(o|a)g/;
			trace(_regExp.test("log"));
			trace(_regExp.test("lag"));
			trace(_regExp.test("lug"));
			*/
			
			/*
			var _regExp1:RegExp =/a(b){1,2}/;
			trace(_regExp1.test("ab"));
			trace(_regExp1.test("abdsadsadsadsadsad"));
			trace(_regExp1.test("abb"));
			trace(_regExp1.test("abbewrywerweyrweiryweiry"));
			trace(_regExp1.test("a"));
			*/
			
			/*
			var _regExp2:RegExp =/(a|b)\1/;
			trace(_regExp2.test("aa"));
			trace(_regExp2.test("bb"));
			trace(_regExp2.test("aaqweqweqw"));
			trace(_regExp2.test("bbrewrew"));
			trace(_regExp2.test("a"));
			trace(_regExp2.test("b"));
			trace(_regExp2.test("ab"));
			*/
		}
		
		private function test10():void
		{
			/*
			var _regExp1:RegExp =/l[oa]g/;
			trace(_regExp1.test("log"));
			trace(_regExp1.test("lag"));
			trace(_regExp1.test("lug"));
			trace(_regExp1.test("lg"));
			*/
			
			// matcges all low characters
			// var _regExp2:RegExp =/[a-z]/;
			
			// all characters except oa
			// var _regExp2:RegExp =/l[^oa]g/;
			// trace(_regExp2.test("log"));
			// trace(_regExp2.test("lag"));
			// trace(_regExp2.test("lrg"));
			
			// matches + or -
			// var _regExp2:RegExp =/[+\\-]/;
		}
	}
}
