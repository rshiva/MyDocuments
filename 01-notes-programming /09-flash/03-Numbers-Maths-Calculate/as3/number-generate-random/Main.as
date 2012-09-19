package {
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * 
	 */
	public class Main extends Sprite {
		public function Main():void {
			
			// generate random number 
			function randRange(min:Number, max:Number):Number {
				var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
				return randomNum;
			}
			
			for (var i = 0; i < 100; i++) {
				var n:Number=randRange(4,11);
				trace(n);
			}

		}

	}

}