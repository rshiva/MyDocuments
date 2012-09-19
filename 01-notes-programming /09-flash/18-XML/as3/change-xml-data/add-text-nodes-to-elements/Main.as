package {
	import flash.display.*;
	import flash.events.*
	import flash.xml.*;


	public class Main extends Sprite {
		function Main() {
			// Create an XML instance to work with
			var example:XML = <example/>;
			// Create a text node from a string
			example.firstname = "Darron";
			// Create a text node from a number
			example.number = 24.9;
			// Create a text node from a boolean
			example.boolean = true;
			// Create a text node from an array
			example.abc = ["a", undefined, "b", "c", null, 7, false];
			/* Displays:
			<example>
			<firstname>Darron</firstname>
			<number>24.9</number>
			<boolean>true</boolean>
			<abc>a,,b,c,,7,false</abc>
			</example>
			*/
			trace( example );
		}
	}
}