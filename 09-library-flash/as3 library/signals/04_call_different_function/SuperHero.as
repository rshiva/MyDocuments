package  
{
	import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author Harry
	 */
	public class SuperHero
	{
		public var punched:Signal;
		
		public function SuperHero() {
			// argument type check
			punched = new Signal(String);
		}
		
		public function punch():void {
			punched.dispatch("I hit bad guy");
		}
		
	}

}