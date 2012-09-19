package {
	import flash.display.*;
	import flash.events.*;

	public class Main extends MovieClip {
		
		public function Main() {
			var _boundTest:BoundTest = new BoundTest();
			
			// assign method to variable
			var _variable = _boundTest.outPutString;
			
			// invoke the method
			_variable("Hello");
		}
	}
}