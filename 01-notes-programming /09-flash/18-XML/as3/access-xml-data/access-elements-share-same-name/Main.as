package {
	import flash.display.*;
	import flash.events.*
	import flash.xml.*;


	public class Main extends Sprite {
		public function Main(  ) {
			var items:XML = 
			<items>
				<item>
					<name>Apple</name>
					<color>red</color>
				</item>
				<item>
					<name>Orange</name>
					<color>orange</color>
				</item>
            </items>;
                
			// Displays: Apple
			trace( items.item[0].name );
			// Displays: Orange
			trace( items.item[1].name );
		}
	}
}