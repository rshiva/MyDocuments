package {
	import flash.display.*;
	import flash.events.*
	import flash.xml.*;


	public class Main extends Sprite {
		public function Main(  ) {
			// Create an XML instance to work with
			var example:XML = <example><someElement/></example>;

			// Add some attributes to the someElement element node
			example.someElement.@number = 12.1;
			example.someElement.@string = "example";
			example.someElement.@boolean = true;
			example.someElement.@array = ["a", null, 7, undefined, "c"];

			/* Displays:
			<example>
			<someElement number="12.1" string="example" boolean="true" array="a,,7,,c"/>
			</example>
			*/
			trace( example );
		}
	}
}