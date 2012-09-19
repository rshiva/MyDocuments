package {
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.utils.*;


	public class Main extends Sprite {
		function Main() {
			var loader:URLLoader = new URLLoader(  );
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			// loader.dataFormat = DataFormat.TEXT;
			loader.addEventListener( Event.COMPLETE, handleComplete );
			loader.load( new URLRequest( "example.xml" ) );
		}
		
		private function handleComplete( event:Event ):void {
			try {
				// Convert the downlaoded text into an XML instance
				var example:XML = new XML( event.target.data );
				// At this point, example is ready to be used with E4X
				trace( example );
			} catch ( e:TypeError ) {
				// If we get here, that means the downloaded text could
				// not be converted into an XML instance, probably because 
				// it is not formatted correctly.
				trace( "Could not parse text into XML" );
				trace( e.message );
			}
		}
	}
}