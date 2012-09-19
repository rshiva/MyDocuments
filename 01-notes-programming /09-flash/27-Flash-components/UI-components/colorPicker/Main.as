package  
{
	import fl.controls.ColorPicker;
	import fl.controls.TextArea;
	import fl.events.ColorPickerEvent;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Harry
	 */
	
	public class Main extends Sprite{	
		var iColorPicker:ColorPicker = new ColorPicker;
		var iTextArea:TextArea = new TextArea();
		var iTextFormat:TextFormat = new TextFormat();
		
		public function Main() {
			iColorPicker.move(100, 100);
			
			iTextArea.text = "Hello world";
			iTextArea.move(100, 50);
			
			addChild(iColorPicker);
			addChild(iTextArea);
			
			iColorPicker.addEventListener(ColorPickerEvent.CHANGE, changeHandler);
		}
		
		public function changeHandler(e:ColorPickerEvent):void {
			if (TextFormat(iTextArea.getStyle("textFormat"))) {
				iTextFormat = TextFormat(iTextArea.getStyle("textFormat"));
			}
			iTextFormat.color = e.target.selectedColor;
			iTextArea.setStyle("textFormat", iTextFormat);
		}
		
	}

}