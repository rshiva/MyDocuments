package  
{
	import fl.controls.DataGrid;
	import fl.controls.dataGridClasses.DataGridColumn;
	import fl.data.DataProvider;
	import flash.display.Sprite;

	
	/**
	 * ...
	 * @author Harry
	 */
	
	public class Main extends Sprite{	
		
		
		public function Main() {
			// a sample demo
			// demo1();
			
			// more details
			// demo2();
			
			// addColum and Sort control
			// demo3();
			
			// load XML
			demo4();
		}
		
		public function demo1():void {
			var iData:Array =
			[
				{Name:"Clark", Score:3135},
				{Name:"Bruce", Score:403},
				{Name:"Peter", Score:25}
			];
			
			var iDataGrid:DataGrid = new DataGrid();
			iDataGrid.columns = ["Name", "Score"];
			iDataGrid.setSize(140, 100);
			iDataGrid.move(100, 100);
			iDataGrid.dataProvider = new DataProvider(iData);
			iDataGrid.rowCount = iData.length;
			
			addChild(iDataGrid);
		}
		
		public function demo2():void {
			var iData:Array =
			[
				{Name:"Wilma Carter", Bats:"R", Throws:"R", Year:"So", Home: "Redlands, CA"},
				{Name:"Sue Pennypacker", Bats:"L", Throws:"R", Year:"Fr", Home: "Athens, GA"},
				{Name:"Jill Smithfield", Bats:"R", Throws:"L", Year:"Sr", Home: "Spokane, WA"},
				{Name:"Shirley Goth", Bats:"R", Throws:"R", Year:"Sr", Home: "Carson, NV"},
				{Name:"Jennifer Dunbar", Bats:"R", Throws:"R", Year:"Fr", Home: "Seaside, CA"},
				{Name:"Patty Crawford", Bats:"L", Throws:"L", Year:"Jr", Home: "Whittier, CA"},
				{Name:"Angelina Davis", Bats:"R", Throws:"R", Year:"So", Home: "Odessa, TX"},
				{Name:"Maria Santiago", Bats:"L", Throws:"L", Year:"Sr", Home: "Tacoma, WA"},
				{Name:"Debbie Ferguson", Bats:"R", Throws:"R", Year: "Jr", Home: "Bend, OR"},
				{Name:"Karen Bronson", Bats:"R", Throws:"R", Year: "Sr", Home: "Billings, MO"},
				{Name:"Sylvia Munson", Bats:"R", Throws:"R", Year: "Jr", Home: "Pasadena, CA"},
				{Name:"Carla Gomez", Bats:"R", Throws:"L", Year: "Sr", Home: "Corona, CA"},
				{Name:"Betty Kay", Bats:"R", Throws:"R", Year: "Fr", Home: "Palo Alto, CA"}
			];
			
			var iDataGrid:DataGrid = new DataGrid();
			iDataGrid.dataProvider = new DataProvider(iData);
			iDataGrid.rowCount = iData.length;
			iDataGrid.setSize(400, 200);
			iDataGrid.columns = ["Name", "Bats", "Throw", "Year", "Home"];
			iDataGrid.columns[0].width = 120;
			iDataGrid.columns[1].width = 50;
			iDataGrid.columns[2].width = 50;
			iDataGrid.columns[3].width = 40;
			iDataGrid.columns[4].width = 120;
			iDataGrid.move(50, 50);
			
			addChild(iDataGrid);
		}
		
		public function demo3():void {
			var iData:Array = new Array( { name:"clark", score:3135 }, { name:"Bruce", score:403 }, { name:"Peter", score:25 } );
			var iDataGrid:DataGrid = new DataGrid();
			
			var nameColumn:DataGridColumn = new DataGridColumn("name");
			nameColumn.sortOptions = Array.CASEINSENSITIVE;
			
			var scoreColumn:DataGridColumn = new DataGridColumn("score");
			scoreColumn.sortOptions = Array.NUMERIC;
			
			iDataGrid.addColumn(nameColumn);
			iDataGrid.addColumn(scoreColumn);
			
			iDataGrid.dataProvider = new DataProvider(iData);
			iDataGrid.rowCount = iData.length;
			iDataGrid.width = 200;
			iDataGrid.move(100, 100);
			addChild(iDataGrid);
		}
		
		public function demo4():void {
			var iData:XML =
			<team>
				<player name="Player A" avg="0.293" />
				<player name="Player B" avg="0.214" />
				<player name="Player C" avg="0.317" />
			</team>;
			
			var iDataGrid:DataGrid = new DataGrid();
			
			var nameCol:DataGridColumn = new DataGridColumn("name");
			nameCol.headerText = "Name";
			nameCol.width = 120;
			var avgCol:DataGridColumn = new DataGridColumn("avg");
			avgCol.headerText = "Average";
			avgCol.width = 60;
			
			iDataGrid.columns = [nameCol, avgCol];
			iDataGrid.dataProvider = new DataProvider(iData);
			iDataGrid.width = 200;
			iDataGrid.rowCount = iDataGrid.length;
			iDataGrid.move(100, 100);
			
			addChild(iDataGrid);
		}
	}

}