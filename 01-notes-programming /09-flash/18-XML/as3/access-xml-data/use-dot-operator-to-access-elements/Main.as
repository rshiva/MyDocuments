package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.xml.*;
	
	/**
	 * ...
	 * @author harry
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			var person:XML =
			<person>
				<name>
					<firstName>Gang</firstName>
					<lastName>Wang</lastName>
				</name>
			</person>;
			
			trace(person.name.firstName);
		}
	}	
}