package {
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author Harry
	 */
	public class Main extends Sprite {

		public function Main():void {
			var novel:XML=<BOOK ISBN="0141182806">
			<TITLE>Ulysses<a>000</a></TITLE>
			<AUTHOR>Jacobs, Tom</AUTHOR>
			<AUTHOR>Schumacher, Jonathan</AUTHOR>
			<PUBLISHER>Penguin Books Ltd</PUBLISHER>
			</BOOK>;;
			
			// trace(previousSibling(novel.AUTHOR[0]));
			trace(nextSibling(novel.AUTHOR[0]));
		}
		
		// return previous node for specific node
		public function previousSibling(theNode:XML):XML {
			// Make sure the node actually has a previous sibling before
			// attempting to return it
			if (theNode.parent()!=null&&theNode.childIndex()>0) {
				return theNode.parent().*[theNode.childIndex()-1];
			} else {
				return null;
			}
		}
		
		// return next node for specific node
		public function nextSibling(theNode:XML):XML {
			if (theNode.parent()!=null&&theNode.childIndex()<theNode.parent().children().length()-1) {
				return theNode.parent().*[theNode.childIndex()+1];
			} else {
				return null;
			}
		}
	}

}