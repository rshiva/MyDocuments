package  
{
	import fl.controls.List;
	import fl.data.DataProvider;
	import flash.display.Sprite;
	import flash.events.Event;

	
	/**
	 * ...
	 * @author Harry
	 */
	
	public class Main extends Sprite{	
		
		
		public function Main() {
			
			var iData:Array=[
				{label:"1956 Chevy (Cherry Red)", data:35000},
				{label:"1966 Mustang (Classic)", data:27000},
				{label:"1976 Volvo (Xcllnt Cond)", data:17000},
			];
			
			var iList:List = new List();
			iList.dataProvider = new DataProvider(iData);
			iList.allowMultipleSelection = true;
			iList.addItem( { label:"New Car", data:15000 } );
			iList.setSize(300, 50);
			iList.move(100, 100);
			
			addChild(iList);
			
			iList.addEventListener(Event.CHANGE, changeHandler);
		}
		
		public function changeHandler(e:Event):void {
			trace(e.target.selectedItem.data);
		}
	}

}