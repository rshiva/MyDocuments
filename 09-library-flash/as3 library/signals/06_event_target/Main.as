package  
{
	import flash.display.MovieClip;
	import org.osflash.signals.events.GenericEvent;
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author Harry
	 */
	
	public class Main extends MovieClip{
		
		private var Harry:SuperHero;
		
		public function Main() {
			Harry = new SuperHero();
			
			/*
			Harry.punched.addOnce(Firstpunch); // fire once only
			Harry.punched.add(HarryPunch);
			
			Harry.punch(); // call both functions
			Harry.punch(); // call harryPunch only
			
			Harry.punched.remove(HarryPunch); //remove handler
			
			Harry.punch();
			Harry.punch();
			*/
			
			Harry.kicked.add(HarryKicked);
			Harry.kick();
		}
		
		
		private function HarryKicked(e:GenericEvent):void {
			trace(e.target);
			trace(e.signal);
		}
		
		private function Firstpunch(myString:String):void {
			trace("First PUNCH");
		}
		
		private function HarryPunch(myString:String):void {
			trace(myString);
		}
		
	}

}