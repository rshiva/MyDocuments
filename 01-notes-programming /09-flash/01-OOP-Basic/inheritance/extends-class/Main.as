package {

	import flash.display.*;
	import flash.events.*;

	public class Main extends MovieClip {
		
		// when extend class
		// instance method and variable will be inherited
		// static method and variable will not be inherited
		
		public function Main() {
			var _a:A = new A();
			
			// call instance method a
			_a.a();
			
			// call static method b
			A.b();
			
			var _b:B = new B();
			
			// call instance method a 
			_b.a();
			
			// the static method b does not exist in class B
			// B.b();
		}
	}
}