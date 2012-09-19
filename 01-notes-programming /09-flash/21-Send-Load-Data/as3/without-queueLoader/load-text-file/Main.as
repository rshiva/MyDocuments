package {
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLLoaderDataFormat;

	public class Main extends Sprite{
		public function Main (  ) {
			// Create the URLLoader instance to be able to load data
			var loader:URLLoader = new URLLoader(  );
			
			// Define the event handlers to listen for success and failure
			loader.addEventListener( IOErrorEvent.IO_ERROR, handleIOError );
			loader.addEventListener( HTTPStatusEvent.HTTP_STATUS, handleHttpStatus );
			loader.addEventListener( SecurityErrorEvent.SECURITY_ERROR, handleSecurityError );
			loader.addEventListener( Event.COMPLETE, handleComplete );
			
			// Configure the loader to load URL-encoded variables
			loader.dataFormat = URLLoaderDataFormat.VARIABLES;
			
			// Attempt to load some data
			// loader.load(new URLRequest( "http://www.roamingronin.com/test.txt" ));
			loader.load( new URLRequest( "test.txt" ) );
		}
		
		private function handleIOError( event:IOErrorEvent ):void {
			trace( "Load failed: IO error: " + event.text ); 
		}
		private function handleHttpStatus( event:HTTPStatusEvent ):void {
			trace( "Load failed: HTTP Status = " + event.status );
		}
		private function handleSecurityError( event:SecurityErrorEvent ):void {
			trace( "Load failed: Security Error: " + event.text );
		}
		private function handleComplete( event:Event ):void {
			// Cast the event target as a URLLoader
			var loader:URLLoader = URLLoader( event.target );
			
			// Access the variable(s) that were loaded by referencing the variable name off of the data property of the URLLoader instance.
			// trace( "someText = " + loader.data.someText );
			// trace( "someNumber = " + loader.data.someNumber );
			
			// use for in loop to get evert variable in url loader
			// as the variable is trade as string 
			for ( var property:String in loader.data ) {
				trace( property + " = " + loader.data[property] );
			}
		}
	}
}
