package {
	import flash.display.*;
	import flash.events.*
	import flash.xml.*;


	public class Main extends Sprite {
		public function Main(  ) {
			// Create an XML instance to work with
			var example:XML = <example><someElement/></example>;
			var num:Number = 15;
			
			example.someElement.@["color" + num] = "red";
			trace( example );
		}
	}
}