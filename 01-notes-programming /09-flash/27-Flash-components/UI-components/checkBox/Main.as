package  
{
	import fl.controls.CheckBox;
	import fl.controls.RadioButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Harry
	 */
	
	 public class Main extends Sprite
	{
		var iCheckBox:CheckBox = new CheckBox();
		var underBtn:RadioButton = new RadioButton();
		var overBtn:RadioButton = new RadioButton();
		
		public function Main() {
			iCheckBox.width = 120;
			iCheckBox.label = "Own your home";
			iCheckBox.move(220, 130);
			
			underBtn.enabled = false;
			underBtn.width = 120;
			underBtn.label = "under $500,000";
			underBtn.move(220, 160);
			
			overBtn.enabled = false;
			overBtn.width = 120;
			overBtn.label = "over $500,000";
			overBtn.move(220, 180);
			
			underBtn.groupName = "valueGrp";
			overBtn.groupName = "valueGrp";
			
			addChild(iCheckBox);
			addChild(underBtn);
			addChild(overBtn);
			
			iCheckBox.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		public function clickHandler(e:MouseEvent):void {
			underBtn.enabled = e.target.selected;
			overBtn..enabled = e.target.selected;
		}
		
	}

}