package {
	import flash.display.*;
	import flash.text.*;
	import flash.events.*
	import flash.net.*;


	public class Main extends Sprite {
		public function Main(  ) {
			//create URLVariables object and assign variables to this Object 
			var variables:URLVariables = new URLVariables(  );
			variables.name = "test"
			variables.code = "test001";
			
			// create URL request point to script side script
			var request:URLRequest = new URLRequest( "http://localhost/savedata.asp" );
			request.data = variables;
			request.method = URLRequestMethod.POST;
			
			// Create a URLLoader to send the data and receive a response
			var loader:URLLoader = new URLLoader(  );
			
			// Expect the script to return URL-encoded variables
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			
			// Listen for the complete event to read the server response
			loader.addEventListener( Event.COMPLETE, handleComplete );
			
			// Send the data in the URLRequest off to the script
			loader.load( request );
			
			// get confirmation from asp
			function handleComplete(event:Event):void {
				trace(loader.data);
			}
		}
		
		
	}
}
