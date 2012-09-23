package  
{
	import flash.display.MovieClip;
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author Harry
	 */
	
	public class Main extends MovieClip{
		
		private var Harry:SuperHero;
		
		public function Main() {
			Harry = new SuperHero();
			// Harry.punched.add(HarryPunch);
			Harry.punched.addOnce(HarryPunch);
			Harry.punch();
			Harry.punch();
			Harry.punch();
			Harry.punch();
		}
		
		private function HarryPunch(myString:String):void {
			trace(myString);
		}
		
	}

}