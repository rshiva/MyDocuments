package {
	import flash.events.*;
	import flash.display.*;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;

    public class Main extends Sprite {
		
        public function Main(  ) {
			// Create a shared object and store some data in it
			var example:SharedObject = SharedObject.getLocal( "example" );
			example.data.information = "This is a test";
			trace(example.data.information);
			
			// remove data from LOS
			delete example.data.information;
			trace(example.data.information);
			
			// remove LOS
			example.clear(  );
		}
	}
}
