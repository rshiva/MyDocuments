package {
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.utils.*;


	public class Main extends Sprite {
		function Main() {
			// Create a new XML instance containing the data to be saved
			var dataToSave:XML = 
			<example>
				<fruit color="Red">Apple</fruit>
				<vegetable color="Green">Broccoli</vegetable>
				<dairy color="White">Milk</dairy>
			</example>

			// Point the request to the script that will handle the XML
			var request:URLRequest = new URLRequest( "request.asp" );
			
			// Set the data property to the dataToSave XML instance to send the XML data to the server
			request.data = dataToSave;
			
			// Set the contentType to signal XML data being sent
			request.contentType = "text/xml";
			
			// Use the post method to send the data
			request.method = URLRequestMethod.POST;

			// Create a URLLoader to handle sending and loading of the XML data
			var loader:URLLoader = new URLLoader(  );
			
			// When the server response is finished downloading, invoke handleResponse
			// loader.addEventListener( Event.COMPLETE, handleResponse );
			
			// Finally, send off the XML data to the URL
			loader.load( request );
		}
		
		private function handleResponse( event:Event ):void {
			try {
				// Attempt to convert the server's response into XML
				var success:XML = new XML( event.target.data );

			// Inspect the value of the success element node
			if ( success.toString(  ) == "1" ) {
				trace("Saved successfully.");    
			} else {
				trace("Error encountered while saving.");
			}
			} catch ( e:TypeError ) {
				// Display an error message since the server response was not understood
				trace("Could not parse XML response from server.");
			}
		}
	}
}