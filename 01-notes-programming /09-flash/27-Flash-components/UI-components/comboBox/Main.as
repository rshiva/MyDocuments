package  
{

	import fl.controls.ComboBox;
	import fl.data.DataProvider;
	import fl.events.ComponentEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.sampler.NewObjectSample;
	import flash.net.navigateToURL;

	
	/**
	 * ...
	 * @author Harry
	 */
	
	public class Main extends Sprite{	
		var iComboBox:ComboBox=new ComboBox
		
		public function Main() {
			// demo1();
			demo2();
		}
		
		public function demo1():void {
			var iData:Array = new Array
			(
				{label:"University of California, Berkeley",data:"http://www.berkeley.edu/"},
				{label:"University of San Francisco",data:"http://www.usfca.edu/"},
				{label:"San Francisco State University",data:"http://www.sfsu.edu/"},
				{label:"California State University, East Bay",data:"http://www.csuhayward.edu/"},
				{label:"Stanford University", data:"http://www.stanford.edu/"},
				{label:"University of Santa Clara", data:"http://www.scu.edu/"},
				{label:"San Jose State University", data:"http://www.sjsu.edu/"}
			);
			
			iComboBox.width = 200;
			iComboBox.dropdownWidth = 400;
			iComboBox.move(100, 100);
			iComboBox.prompt = "Select a University";
			iComboBox.dataProvider = new DataProvider(iData);
			
			iComboBox.addEventListener(Event.CHANGE, changeHandler);
			addChild(iComboBox);
		}
		
		public function demo2():void {
			var iData:Array =
			[
				{label:"screen1", data:"screenData1"},
				{label:"screen2", data:"screenData2"},
				{label:"screen3", data:"screenData3"},
				{label:"screen4", data:"screenData4"},
				{label:"screen5", data:"screenData5"},
			];
			
			iComboBox.dataProvider = new DataProvider(iData);
			iComboBox.editable = true;
			iComboBox.move(100, 100);
			
			// iComboBox enter event is enter the text at textArea, then press enter. it will fire the event
			iComboBox.addEventListener(ComponentEvent.ENTER, enterHandler);
			
			addChild(iComboBox);
		}
		
		public function changeHandler(e:Event):void {
			trace("lalala");
			var request:URLRequest = new URLRequest();
			request.url = ComboBox(e.target).selectedItem.data;
			navigateToURL(request);
			iComboBox.selectedIndex = -1;
		}
		
		public function enterHandler(e:ComponentEvent):void {
			var newRow:int = 0;
			if (e.target.text == "Add") {
				trace("lalala");
				newRow = e.target.length + 1;
				e.target.addItemAt({label:"screen" + newRow, data:"screenData" + newRow},
				e.target.length);
			}
		}
	}

}