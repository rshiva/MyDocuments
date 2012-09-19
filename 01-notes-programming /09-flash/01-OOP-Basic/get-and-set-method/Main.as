package {
	import flash.display.*;
	import flash.events.*;

	public class Main extends MovieClip {
		
		public function Main() {
			var _test:TestGetSet = new TestGetSet();
			
			// call get method myname
			var _name:String = _test.myname;
			trace(_name);
			
			// call set method to change var secondName
			_test.myname = "gang";
			trace(_test.myname);
		}
	}
}