package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main()
		{	
			// {n} Exactly n occurrences of the preceding character or group
			// test01();
			
			// {n,} At least n occurrences of the preceding character or group
			// test02();
			
			// {n,m} At least n but no more than m instances of preceding character or group
			// test03();
			
			// \A At the start of the string; similar to (^)
			// test04()
			
			// \b Word boundary
			// test05();
			
			// \B Non-word boundary
			// test06();
			
			// \d Any numeric digit; same as [0-9] 
			// test07();
			
			// \D Any non-digit character; same as [^0-9]
			// test08();
			
			// \n The newline character
			// test09();
			
			// \r The return character
			// test10();
			
			// \s Single whitespace character (space, tab, line feed, or form feed)
			// test11();
			
			// \S Single nonwhitespace character
			// test12();
			
			// \t The tab character
			// test13();
			
			// \unnnn The Unicode character specified by the hex digits nnnn
			// test14();
			
			// \w Any word character; same as [A-Za-z0-9_] 
			// test15();
			
			// \W Any non-word character; same as [^A-Za-z0-9_] 
			// test16();
			
			// \xnn The ASCII character specified by the hex digits nn 
			// test17();
			
			// \Z The end of the string; matches before the line break if the string ends in one
			// test18();
			
			// \z The end of the string; matches after the line break if the string ends in one
			test19();
		}
		
		private function test01():void {
			var _regExp:RegExp =/lo{2}g/;
			trace(_regExp.test("loog")); // true
			trace(_regExp.test("log")); // false
			trace(_regExp.test("loosdfdsfsdfsdg")); //false
		}
		
		private function test02():void {
			var _regExp:RegExp =/lo{3,}g/;
			trace(_regExp.test("loog")); // false
			trace(_regExp.test("looog")); // true
			trace(_regExp.test("looosdfdsfsdfsdg")); // false
			trace(_regExp.test("loooooogsdfdsfsdfsdg")); // true
		}
		
		private function test03():void {
			var _regExp:RegExp =/lo{2,5}g/;
			trace(_regExp.test("log")); // false
			trace(_regExp.test("loog")); // true
			trace(_regExp.test("loooooog")); //false
		}
		
		private function test04():void {
			var _regExp:RegExp =/\Alog/;
			trace(_regExp.test("log")); // true
			trace(_regExp.test("slog")); // false
		}
		
		private function test05():void {
			var _regExp:RegExp =/\blog\b/;
			trace(_regExp.test("log")); // true
			trace(_regExp.test("slog")); // false
			trace(_regExp.test("logs")); // false
		}
		
		private function test06():void {
			var _regExp:RegExp =/\Blog\B/;
			trace(_regExp.test("alog")); // false 
			trace(_regExp.test("loga")); // false
			trace(_regExp.test("aloga")); // true
			trace(_regExp.test("sadasalogaasdas")); // true 
		}
		
		private function test07():void {
			var _regExp:RegExp =/a\d/;
			trace(_regExp.test("a1")); // true
			trace(_regExp.test("ab")); // false
		}
		
		private function test08():void {
			var _regExp:RegExp =/a\D/;
			trace(_regExp.test("a1")); // false
			trace(_regExp.test("ab")); // true
		}
		
		private function test09():void {
			var _regExp:RegExp =/a\nb/;
			trace(_regExp.test("a\nb")); // true
		}
		
		private function test10():void {
			var _regExp:RegExp =/a\rb/;
			trace(_regExp.test("a\rb")); // true
		}
		
		private function test11():void {
			var _regExp:RegExp =/a\sb/;
			trace(_regExp.test("a b")); // true
			trace(_regExp.test("a\tb")); // true
		}
		
		private function test12():void {
			var _regExp:RegExp =/a\Sb/;
			trace(_regExp.test("aOb")); // true
			trace(_regExp.test("a b")); // false
		}
		
		private function test13():void {
			var _regExp:RegExp =/a\tb/;
			trace(_regExp.test("a\tb")); // true
		}
		
		private function test14():void {
			var _regExp:RegExp =/\u000a/;
			trace(_regExp.test("\n")); // true
		}
		
		private function test15():void {
			var _regExp:RegExp =/a\wb/;
			trace(_regExp.test("aob")); // true
			trace(_regExp.test("a_b")); // true
			trace(_regExp.test("arerewrewb")); // false 
		}
		
		private function test16():void {
			var _regExp:RegExp =/a\Wb/;
			trace(_regExp.test("a b")); // true
		}
		
		private function test17():void {
			var _regExp:RegExp =/a\x0ab/;
			trace(_regExp.test("a\nb")); // 
		}
		
		private function test18():void {
			var _regExp:RegExp =/ab\Z/;
			trace(_regExp.test("ab\n")); // true
			trace(_regExp.test("ab")); // true
			trace(_regExp.test("ab\nc")); // false
		}
		
		private function test19():void {
			var _regExp:RegExp =/ab\z/;
			trace(_regExp.test("ab")); // true
			trace(_regExp.test("ab\n")); // false
			trace(_regExp.test("ab\nc")); // false
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
