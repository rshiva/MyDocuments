package {
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author Harry
	 */
	public class Main extends Sprite {

		public function Main():void {
			var staff:XML =
			<STAFF>
				<EMPLOYEE ID="501" HIRED="1090728000000">
				<NAME>Marco Crawley</NAME>
				<MANAGER>James Porter</MANAGER>
				<SALARY>25000</SALARY>
				<POSITION>Designer</POSITION>
				</EMPLOYEE>
				
				<EMPLOYEE ID="500" HIRED="1078462800000">
				<NAME>Graham Barton</NAME>
				<MANAGER>James Porter</MANAGER>
				<SALARY>35000</SALARY>
				<POSITION>Designer</POSITION>
				</EMPLOYEE>
				
				<EMPLOYEE ID="238" HIRED="1014699600000">
				<NAME>James Porter</NAME>
				<MANAGER>Dorian Schapiro</MANAGER>
				<SALARY>55000</SALARY>
				<POSITION>Manager</POSITION>
				</EMPLOYEE>
			</STAFF>;;
			
			// First obtain an XMLList object representing all <EMPLOYEE> elements
			var allEmployees:XMLList=staff.*;

			// Now filter the list of <EMPLOYEE> elements
			// To filter a list where not every item has a given attribute or child element,
            // we must use hasOwnProperty( ) to check for the existence of
            // that attribute or child before filtering on it. Otherwise, a reference error occurs.
			// someDocument..*.(hasOwnProperty("@color") && @color == "red")
			var employeesUnderJames:XMLList = allEmployees.(MANAGER == "James Porter");

			var resultList:XMLList=new XMLList  ;
			var counter:int=0;
			for each (var employee:XML in allEmployees) {
				if (employee.MANAGER=="James Porter") {
					resultList[counter]=employee;
					counter++;
					trace(employee);
					trace(counter);
				}
			}
		}
	}
}