package {
	
	import com.hydrotik.queueloader.QueueLoader;
	import com.hydrotik.queueloader.QueueLoaderEvent;
	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;

	public class Main extends MovieClip {
		
		public function Main() {
			var _oLoader:QueueLoader = new QueueLoader();

			_oLoader.addItem("assets/test.css", null, {title:"CSS"});

			_oLoader.addEventListener(QueueLoaderEvent.ITEM_COMPLETE, onItemComplete,false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_PROGRESS, onQueueProgress, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_COMPLETE, onQueueComplete,false, 0, true);

			_oLoader.execute();

			function onQueueProgress(event:QueueLoaderEvent):void {
				trace("\t>>onQueueProgress: "+event.queuepercentage);
			}

			function onItemComplete(event:QueueLoaderEvent):void {
				trace("\t>> "+event.type, "item title: "+event.title);
				if (event.fileType == QueueLoader.FILE_CSS) {
					trace("\t\tCSS: "+event.content.styleNames);
				}
			}

			function onQueueComplete(event:QueueLoaderEvent):void {
				trace("** "+event.type);
			}
		}
	}
}