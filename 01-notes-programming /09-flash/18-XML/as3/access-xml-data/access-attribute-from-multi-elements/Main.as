package {
	import flash.display.*;
	import flash.events.*
	import flash.xml.*;


	public class Main extends Sprite {
		public function Main(  ) {
			// Create a fictitious shopping cart
			var cart:XML = 
			<cart>
			  <item price=".98">crayons</item>
			  <item price="3.29">pencils</item>
			  <group>
				<item price=".48">blue pen</item>
				<item price=".48">black pen</item>
			  </group>
			</cart>;

			// Create a total variable to represent represent the cart total
			var total:Number = 0;

			// Find every price attribute, and add its value to the running total
			for each ( var price:XML in cart..@price ) {
				total += Number(price);    
			}

			// Displays: 5.23
			trace( total );
		}
	}
}