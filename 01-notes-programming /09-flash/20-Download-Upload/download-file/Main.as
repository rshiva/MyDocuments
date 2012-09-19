package {
	import flash.display.*;
	import flash.events.*;
	import flash.net.FileReference;
	import flash.net.URLRequest;


	public class Main extends Sprite {
		function Main() {
			btn1.addEventListener(MouseEvent.MOUSE_UP, downloadFile);
		}
		
		function downloadFile(event:MouseEvent):void {
			var iRef:FileReference = new FileReference();
			
			var downloadURL:URLRequest = new URLRequest("http://localhost/doc.rar");
			iRef.download(downloadURL);
			
			// define download file as specific name
			// iRef.download(downloadURL, "example.jpg");
			
			
		}
	}
}