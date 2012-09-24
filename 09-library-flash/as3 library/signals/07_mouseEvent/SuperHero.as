package  
{
	import flash.display.Sprite;
	import flash.events.*;
	
	import org.osflash.signals.DeluxeSignal;
	import org.osflash.signals.events.GenericEvent;
	import org.osflash.signals.natives.NativeSignal;
	import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author Harry
	 */
	public class SuperHero extends Sprite
	{
		public var punched:Signal;
		public var kicked:DeluxeSignal;
		public var clicked:NativeSignal;
		
		public function SuperHero() {
			graphics.beginFill(0x787878);
			graphics.drawRect(0, 0, 100, 100);
			graphics.endFill();
			
			punched = new Signal(String); // argument type check
			kicked = new DeluxeSignal(this);
			clicked = new NativeSignal(this, MouseEvent.CLICK, MouseEvent);
		}
		
		public function kick():void {
			kicked.dispatch(new GenericEvent());
		}
		
		public function punch():void {
			punched.dispatch("I hit bad guy");
		}
		
	}

}