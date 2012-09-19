package {
	import flash.display.*;
	import flash.events.*
	import flash.xml.*;


	public class Main extends Sprite {
		function Main() {
			var example:XML = 
			<example>
				<bool>true</bool>
				<integer>12</integer>
				<number>.9</number>
			</example>;
			
			var bool:Boolean = example.bool.toLowerCase(  ) == "true";
			// Convert a text node of "12" to an integer
			var integer:int = int( example.integer );
			// Convert a text node of ".9" to a number
			var number:Number = example.number;
			
			/* Displays:
			true
			12
			.9
			*/
			trace( bool );
			trace( integer );
			trace( number );
		}
	}
}