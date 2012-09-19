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
			
			// return XML object as parent
			trace(novel.TITLE[0].a[0].parent());
		}
	}

}