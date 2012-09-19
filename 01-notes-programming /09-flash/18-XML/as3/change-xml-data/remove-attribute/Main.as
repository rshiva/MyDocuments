package {
	import flash.display.*;
	import flash.events.*
	import flash.xml.*;


	public class Main extends Sprite {
		function Main() {
			var example:XML = 
			<example>
				<fruit color="Red">Apple</fruit>
			</example>;
							  
			// Remove the color attribute from the fruit element
			delete example.fruit.@color;

			/* Displays:
			<example>
			  <fruit>Apple</fruit>
			</example>
			*/
			trace( example );
		}
	}
}