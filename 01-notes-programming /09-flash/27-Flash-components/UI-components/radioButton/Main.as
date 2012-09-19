package  
{
	import fl.controls.RadioButton;
	import fl.controls.RadioButtonGroup;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.text.*;

	
	/**
	 * ...
	 * @author Harry
	 */
	
	public class Main extends Sprite{	
		
		
		public function Main() {
			var rRadioButton:RadioButton = new RadioButton();
			rRadioButton.label = "Red";
			rRadioButton.value = 0xff0000;
			rRadioButton.move(100, 100);
			
			var gRadioButton:RadioButton = new RadioButton();
			gRadioButton.label = "Green";
			gRadioButton.value = 0x00ff00;
			gRadioButton.move(200, 100);
			
			var bRadioButton:RadioButton = new RadioButton();
			bRadioButton.label = "Blue";
			bRadioButton.value = 0x0000ff;
			bRadioButton.move(300, 100);
			
			var buttonGroup:RadioButtonGroup = new RadioButtonGroup("selected color");
			rRadioButton.group = gRadioButton.group = bRadioButton.group = buttonGroup;
			buttonGroup.addEventListener(MouseEvent.CLICK, clickHander);
			
			addChild(rRadioButton);
			addChild(gRadioButton);
			addChild(bRadioButton);
		}
		
		public function clickHander(e:MouseEvent):void {
			trace(e.target.selection.value);
		}
	}

}