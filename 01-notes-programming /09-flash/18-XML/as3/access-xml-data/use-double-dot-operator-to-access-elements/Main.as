package {
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author Harry
	 */
	public class Main extends Sprite {

		public function Main():void {
			var loan:XML =
			<LOAN>
				<BOOK ISBN="0141182806" DUE="1136091600000">
				<TITLE>Ulysses</TITLE>
				<AUTHOR>Joyce, James</AUTHOR>
				<PUBLISHER>Penguin Books Ltd</PUBLISHER>
				</BOOK>
				
				<DVD ISBN="0790743086" DUE="1136610000000">
				<TITLE>2001 A Space Odyssey</TITLE>
				<DIRECTOR>Stanley Kubrick</DIRECTOR>
				<PUBLISHER>Warner Home Video</PUBLISHER>
				</DVD>
				
				<DVD ISBN="078884461X" DUE="1137214800000">
				<TITLE>Spirited Away</TITLE>
				<DIRECTOR>Hayao Miyazaki</DIRECTOR>
				<PUBLISHER>Walt Disney Video</PUBLISHER>
				</DVD>
			</LOAN>;
			
			// retrive all node named TITLE
			/*
			for each (var title:XML in loan..TITLE) {
				trace(title);
			}
			*/
			
			// retrive all attribute named DUE
			/*
			for each (var due:XML in loan..@DUE) {
				trace(new Date(Number(due)));
			}
			*/
			
			
		}

	}

}