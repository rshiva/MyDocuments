package {
	import flash.display.*;
	import flash.events.*
	import flash.xml.*;


	public class Main extends Sprite {
		function Main() {
			var example:XML = 
			<example>
				<vegetable color="Green">Broccoli</vegetable>
			</example>;
			
			// Remove the text node from the vegetable element node
			delete example.vegetable.text(  )[0];
			
			/* Displays:
			<example>
				<vegetable color="Green"/>
			</example>
			*/
			trace(example);
		}
	}
}