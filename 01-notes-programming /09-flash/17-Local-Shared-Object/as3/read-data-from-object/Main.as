package {
	import flash.events.*;
	import flash.display.*;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;

    public class Main extends Sprite {
		
        public function Main(  ) {
			// getLocal( ) method first try to locate an existing LSO by the specified name 
			// with a .sol extension stored on the client computer
			// if no found. the Flash Player creates a new LSO with that name. 
			var example:SharedObject = SharedObject.getLocal( "example" );
			
			// read the information saved on LSO
			trace(example.data.information);
		}
	}
}
