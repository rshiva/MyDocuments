package  
{
	import fl.controls.ColorPicker;
	import fl.controls.Label;
	import flash.display.Sprite;

	
	/**
	 * ...
	 * @author Harry
	 */
	
	public class Main extends Sprite{	
		
		
		public function Main() {
			var iLabel:Label = new Label();
			var iColorPicker:ColorPicker = new ColorPicker();
			
			iLabel.htmlText = '<font face="Arial" color="#FF0000" size="14">Fill:</font>';
			iLabel.setSize(50, 30);
			iLabel.move(200, 150);
			
			iColorPicker.move(250, 150);
			
			addChild(iLabel);
			addChild(iColorPicker);
		}
	}

}