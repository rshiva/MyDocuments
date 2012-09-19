package {
	import flash.display.*;
	import flash.events.*
	import flash.xml.*;


	public class Main extends Sprite {
		public function Main(  ) {
			var example:XML = <example bad-variable-name="yes" color12="blue" />;
			var num:Number = 12;
			// Displays: blue
			trace( example.@["color" + num] );
		}
	}
}