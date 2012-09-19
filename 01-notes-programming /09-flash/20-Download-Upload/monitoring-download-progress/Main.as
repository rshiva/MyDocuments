package {
	import flash.display.*;
	import flash.events.*;
	import flash.net.FileReference;
	import flash.net.URLRequest;


	public class Main extends Sprite {
		var iRef:FileReference = new FileReference();
		var downloadURL:URLRequest = new URLRequest("http://www.roamingronin.com/doc.rar");
		
		function Main() {
			btn1.addEventListener(MouseEvent.MOUSE_UP, downloadFile);
			iRef.addEventListener(ProgressEvent.PROGRESS, showProgress);
		}
		
		function downloadFile(event:MouseEvent):void {
			iRef.download(downloadURL);
			
			// define download file as specific name
			// iRef.download(downloadURL, "example.jpg");
		}
		
		function showProgress(event:ProgressEvent):void {
			fileProgressField.text = event.bytesLoaded + " of " + event.bytesTotal + " bytes";
		}
	}
}