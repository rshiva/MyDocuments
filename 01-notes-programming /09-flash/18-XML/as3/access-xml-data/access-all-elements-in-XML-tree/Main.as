package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.xml.*;
	
	/**
	 * ...
	 * @author harry
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			var _menu:XML =
			<menu>
				<menuitem label="File">
					<menuitem label="New">
						<menuitem label="Fire">
							<menuitem label="In">
							</menuitem>
						</menuitem>
					</menuitem>
				</menuitem>
				<menuitem label="Help">
					<menuitem label="About"/>
				</menuitem>
				This is a text node
            </menu>;
			
			function walk( node:XML ):void {
				// Loop over all of the child elements of the node
				for each ( var element:XML in node.elements(  ) ) {
					// Output the label attribute
					trace( element.@label );
					// Recursively walk the child element to reach its children
					walk( element );
				}
			}
			
			walk(_menu);
		}
	}	
}