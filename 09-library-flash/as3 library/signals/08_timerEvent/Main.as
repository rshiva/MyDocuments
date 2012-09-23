package  
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
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
			addChild(Harry);
			
			Harry.clicked.add(ClickHandler);
			Harry.run.add(timerHandler);
			/*
			Harry.punched.addOnce(Firstpunch); // fire once only
			Harry.punched.add(HarryPunch);
			
			Harry.punch(); // call both functions
			Harry.punch(); // call harryPunch only
			
			Harry.punched.remove(HarryPunch); //remove handler
			
			Harry.punch();
			Harry.punch();
			*/
			
			/*
			Harry.kicked.add(HarryKicked);
			Harry.kick();
			*/
		}
		
		private function timerHandler(e:TimerEvent):void {
			trace("go go go");
		}
		
		private function ClickHandler(e:MouseEvent):void {
			trace("clickHarry");
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