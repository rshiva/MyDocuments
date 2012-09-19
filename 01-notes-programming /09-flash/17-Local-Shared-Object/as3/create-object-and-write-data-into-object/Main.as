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
			
			// write data to LSO
			example.data.username = "Harry";
			example.data.information = "This is a test";
			example.data.exampleArray = new Array( "a", "b", "c" );
			
			// 
			try {
				// flush can save data to LSO
				// Request 500 KB of space for the shared object.
				// var flashResult:String = example.flush( 500 * 1024 );
				var flushResult:String = example.flush(  );
				
				if ( flushResult == SharedObjectFlushStatus.PENDING ) {
					// Add an event handler for netStatus so we can check if the user 
					// granted enough disk space to save the shared object. Invoke 
					// the onStatus method when the netStatus event is raised.
					example.addEventListener( NetStatusEvent.NET_STATUS, onStatus );
				} else if ( flushResult == SharedObjectFlushStatus.FLUSHED ) {
					// Saved successfully. Place any code here that you want to execute after the data was successfully saved.
				}
			} catch ( e:Error ) {
				// This means the user has the local storage settings to 'Never.' 
				// If it is important to save your data, you may want to alert the 
				// user here. Also, if you want to make it easy for the user to change 
				// his settings, you can open the local storage tab of the Player 
				// Settings dialog box with the following code:
				// Security.showSettings( SecurityPanel.LOCAL_STORAGE );.
			}

			// Define the onStatus() function to handle the shared object's 
			// status event that is raised after the user makes a selection from
			// the prompt that occurs when flush(  ) returns "pending."
			
			function onStatus( event:NetStatusEvent ):void {
				if ( event.info.code == "SharedObject.Flush.Success" ) {
					// If the event.info.code property is "SharedObject.Flush.Success", 
					// it means the user granted access. Place any code here that 
					// you want to execute when the user grants access.
				} else if ( event.info.code == "SharedObject.Flush.Failed" ) {
					// If the event.info.code property is "SharedObject.Flush.Failed", it 
					// means the user denied access. Place any code here that you 
					// want to execute when the user denies access.
				}
				// Remove the event listener now since we only needed to listen once
				example.removeEventListener( NetStatusEvent.NET_STATUS, onStatus );
			};
        }
		
	}
}
