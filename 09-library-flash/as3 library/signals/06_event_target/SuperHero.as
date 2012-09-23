package  
{
	import org.osflash.signals.DeluxeSignal;
	import org.osflash.signals.events.GenericEvent;
	import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author Harry
	 */
	public class SuperHero
	{
		public var punched:Signal;
		public var kicked:DeluxeSignal;
		
		public function SuperHero() {
			punched = new Signal(String); // argument type check
			kicked = new DeluxeSignal(this);
		}
		
		public function kick():void {
			kicked.dispatch(new GenericEvent());
		}
		
		public function punch():void {
			punched.dispatch("I hit bad guy");
		}
		
	}

}