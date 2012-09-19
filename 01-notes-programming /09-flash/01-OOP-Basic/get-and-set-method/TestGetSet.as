package  
{
	
	
	/**
	 * ...
	 * @author Harry
	 */
	public class TestGetSet
	{
		private var secondName:String="harry";
		
		public function TestGetSet() 
		{
			
		}
		
		// the get and set method shoud be has same name
		
		// define a get method myname
		public function get myname():String{
			return secondName;
		}
		
		// define a set method myname
		public function set myname($name:String):void {
			secondName = $name;
		}
	}
	
}