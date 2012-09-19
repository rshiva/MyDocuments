package  
{
	import fl.controls.CheckBox;
	import fl.controls.ColorPicker;
	import fl.controls.ComboBox;
	import fl.controls.NumericStepper;
	import fl.controls.TileList;
	import fl.data.DataProvider;
    import flash.display.Sprite;
    import flash.events.*;    

    public class Main extends Sprite
    {  
        public function Main() {
			var iColorPicker:ColorPicker = new ColorPicker();
			var iComBox:ComboBox = new ComboBox();
			var iNumericStepper:NumericStepper = new NumericStepper();
			var iCheckBox:CheckBox = new CheckBox();
			
			var iTitleList:TileList = new TileList();
			var iData:Array = 
			[
				{label:"ColorPicker", source:iColorPicker},
				{label:"ComboBox", source:iComBox},
				{label:"NumericStepper", source:iNumericStepper},
				{label:"CheckBox", source:iCheckBox}
			];
			iTitleList.dataProvider = new DataProvider(iData);
			iTitleList.columnWidth = 110;
			iTitleList.rowHeight = 100;
			iTitleList.setSize(400,130);
			iTitleList.move(150, 150);
			iTitleList.setStyle("contentPadding", 5);
			iTitleList.sortItemsOn("label");
			addChild(iTitleList);
        }
    }
}