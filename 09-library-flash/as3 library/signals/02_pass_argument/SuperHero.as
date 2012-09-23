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
			punched = new Signal();
		}
		
		public function punch():void {
			punched.dispatch("I hit bad guy");
		}
		
	}

}