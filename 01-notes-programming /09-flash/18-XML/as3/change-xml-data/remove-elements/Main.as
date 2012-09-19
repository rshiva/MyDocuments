package {
	import flash.display.*;
	import flash.events.*
	import flash.xml.*;


	public class Main extends Sprite {
		public function Main(  ) {
			var example:XML = 
			<example>
				<fruit color="Red">Apple</fruit>
				<vegetable color="Green">Broccoli</vegetable>
				<dairy color="White">Milk</dairy>
            </example>;
			
			// Remove the dairy element entirely
			delete example.dairy;
			
			trace(example);
		}
	}
}