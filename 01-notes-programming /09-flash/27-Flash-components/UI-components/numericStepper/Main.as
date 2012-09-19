package  
{

	import fl.controls.NumericStepper;
	import flash.display.Sprite;
	import flash.events.Event;

	
	/**
	 * ...
	 * @author Harry
	 */
	
	public class Main extends Sprite{	
		
		
		public function Main() {
			var iNumericStepper:NumericStepper = new NumericStepper();
			iNumericStepper.setSize(100, 20);
			iNumericStepper.minimum = 10;
			iNumericStepper.maximum = 100;
			iNumericStepper.stepSize = 10;
			iNumericStepper.move(100, 100);
			
			iNumericStepper.addEventListener(Event.CHANGE, changeHandler);
			addChild(iNumericStepper);
		}
		
		public function changeHandler(e:Event):void {
			trace(e.target.value);
		}
		
	}

}