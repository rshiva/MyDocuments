package {

	import flash.display.*;
	import flash.events.*;

	public class Main extends MovieClip {
		
		// in class B 
		// use keyword override to overwrite the instance method a
		// use keyword super call the method a in class A
		
		public function Main() {
			
			
			var _b:B = new B();
			
			// call instance method a 
			_b.a();
		}
	}
}