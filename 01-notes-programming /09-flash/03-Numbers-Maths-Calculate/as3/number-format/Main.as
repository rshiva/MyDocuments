package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import ascb.util.NumberFormat;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			//default setting
			var styler:NumberFormat = new NumberFormat(  );
			trace(styler.format(12345));  //12.345
			trace(styler.format(123456));  //123.456
			trace(styler.format(1234567));  //1.234.567
			trace(styler.format(12345678));  //12.345.678
			trace(styler.format(123456789.0912));  //123.456.789,0912
			
			//set mask by constructor method
			var styler2:NumberFormat = new NumberFormat("#,###,###,###");
			trace(styler2.format(1));
			trace(styler2.format(12));
			trace(styler2.format(123));
			trace(styler2.format(1234));
			
			//change the mask
			styler2.mask = "#,###,###,###.0000";
			trace(styler2.format(12345));
			trace(styler2.format(123456));
			trace(styler2.format(1234567));
			trace(styler2.format(12345678));
			trace(styler2.format(123456789));
			
			//redefine the group mark and decimal mark
			var styler3:NumberFormat = new NumberFormat();
			trace(styler3.format(123456789.0345, { group: "|", decimal: "," } ));
		}
		
	}
	
}