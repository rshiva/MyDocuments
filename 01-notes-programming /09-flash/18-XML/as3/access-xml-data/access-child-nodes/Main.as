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
			<BOOK ISBN="0141182806">
				<TITLE>Ulysses<a>000</a></TITLE>
				<AUTHOR>Jacobs, Tom</AUTHOR>
				<AUTHOR>Schumacher, Jonathan</AUTHOR>
				<PUBLISHER>Penguin Books Ltd</PUBLISHER>
			</BOOK>;
			
			// return a XML list contain all child element 
			// trace(novel.children());
			// trace(novel.*);
			
			// return all child element named "AUTHOR"
			// trace(novel.AUTHOR);
			// trace(novel.child("AUTHOR"));
			
			// return first element named "AUTHOR"
			// trace(novel.AUTHOR[0]);
		}
	}

}