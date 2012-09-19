package {
	import flash.events.*;
	import flash.display.*;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;

    public class Test extends Sprite {
		
        public function Test(  ) {
			var count:SharedObject = SharedObject.getLocal( "count","/" );
			// The first time the shared object is read, default the value to 0
			if ( count.data.value == undefined ) {
				count.data.value = 0;
			} else {
				// Every time the shared object is read, increment the count value
				count.data.value++;
			}
			trace(count.data.value)
		}
	}
}