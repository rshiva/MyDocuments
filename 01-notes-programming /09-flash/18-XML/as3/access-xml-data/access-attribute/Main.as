package {
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author Harry
	 */
	public class Main extends Sprite {

		public function Main():void {
			var novel:XML =
			<BOOK ISBN="0141182806" INSTOCK="false">
				<TITLE>Ulysses</TITLE>
				<AUTHOR>Joyce, James</AUTHOR>
				<PUBLISHER>Penguin Books Ltd</PUBLISHER>
			</BOOK>;;
			
			// return all attributes
			// trace(novel.attributes());
			// trace(novel.@*);
			
			// return specific attribute
			// trace(novel.attributes()[0]);
			// trace(novel.@*[0]);
			// trace(novel.attribute("ISBN"));
			// trace(novel.@ISBN);
			
			// access all attributes in a node
			/*
			for each ( var attribute:XML in novel.attributes(  ) ) {
				trace( attribute.name(  ) + " = " + attribute.toString(  ) );
			}
			*/
		}

	}

}