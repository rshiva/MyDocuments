package {
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author Harry
	 */
	public class Main extends Sprite {

		public function Main():void {
			var total:int;
			var order:XML=<ORDER>
			<ITEM SKU="209">
			<NAME>Trinket</NAME>
			<PRICE>9.99</PRICE>
			<QUANTITY>3</QUANTITY>
			</ITEM>
			
			<ITEM SKU="513">
			<NAME>Gadget</NAME>
			<PRICE>149.99</PRICE>
			<QUANTITY>1</QUANTITY>
			</ITEM>
			
			<ITEM SKU="374">
			<NAME>Toy</NAME>
			<PRICE>39.99</PRICE>
			<QUANTITY>2</QUANTITY>
			</ITEM>
			</ORDER>;

			// This loop runs once for every <ITEM> element.
			for each (var item:XML in order.*) {
				// Display the details for this item in the outField text field.
				trace(item.QUANTITY+" "+item.NAME+"(s)."+" $"+item.PRICE+" each");
				// Add the cost of this item to the total cost of the order.
				// Notice that the quantity and price values are automatically
				// converted to numbers by the multiplication operation.
				total+=item.QUANTITY*item.PRICE;
			}
			// Display the total cost of the order.
			trace("TOTAL: "+total);
		}

	}

}