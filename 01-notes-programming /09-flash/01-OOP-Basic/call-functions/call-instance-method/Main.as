package {
	import flash.display.*;
	import flash.events.*;
	import myClass.InstanceMethodTest;

	public class Main extends MovieClip {
		
		public function Main() {
			var _test:InstanceMethodTest = new InstanceMethodTest();
			_test.outPut("call instance method");
		}
	}
}