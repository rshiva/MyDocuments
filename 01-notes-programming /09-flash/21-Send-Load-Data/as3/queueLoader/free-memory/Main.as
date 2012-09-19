package {
	
	import com.hydrotik.queueloader.QueueLoader;
	import com.hydrotik.queueloader.QueueLoaderEvent;
	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;

	public class Main extends MovieClip {
		
		public function Main() {
			var _oLoader:QueueLoader = new QueueLoader();
			
			var img:Sprite = new Sprite();
			addChild(img);
			
			_oLoader.addItem("imgs/img0.jpg", img, { title:"Image 1" } );
			
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_PROGRESS, onQueueProgress, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_COMPLETE, onQueueComplete,false, 0, true);

			_oLoader.execute();
			
			function onQueueProgress(event:QueueLoaderEvent):void {
				trace("\t>>onQueueProgress: "+event.queuepercentage);
			}
			
			function onQueueComplete(event:QueueLoaderEvent):void {
				trace("** "+event.type);
				// after 3 second the image loaded
				// call QueueLoader to release memory which hold the bitmapdata
				setTimeout(callDipose, 3000);
			}
			
			// Frees memory that is used to store the BitmapData object. 
			function callDipose():void{
				_oLoader.dispose();
			}
		}
	}
}