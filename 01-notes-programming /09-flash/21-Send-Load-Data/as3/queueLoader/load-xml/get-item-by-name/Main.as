package {

	import com.hydrotik.queueloader.QueueLoader;
	import com.hydrotik.queueloader.QueueLoaderEvent;

	import flash.display.*;
	import flash.events.*;


	public class Main extends MovieClip {

		public function Main() {
			var _oLoader:QueueLoader = new QueueLoader();

			_oLoader.addItem("test.xml", null, {title:"XML"});

			_oLoader.addEventListener(QueueLoaderEvent.ITEM_COMPLETE, onItemComplete,false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_PROGRESS, onQueueProgress, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_COMPLETE, onQueueComplete,false, 0, true);

			_oLoader.execute();

			function onQueueProgress(event:QueueLoaderEvent):void {
				trace("\t>>onQueueProgress: "+event.queuepercentage);
			}

			function onItemComplete(event:QueueLoaderEvent):void {
				trace("\t>> "+event.type, "item title: "+event.title);
				if (event.fileType==QueueLoader.FILE_XML) {
					// 
					trace("\t\tXML: "+event.content);
				}
			}

			function onQueueComplete(event:QueueLoaderEvent):void {
				trace("** "+event.type);
				// 1) first cast the item's content in queueloader which name is "XML" as XMLList
				// 2) the queueloader refer a xml node which name is queueloader
				// 3) the item refer several node under queueloader node  they share the same name "item"
				// 4) so get certain node in XMl file in this way
				trace("\n\nXML Node:\n"+XMLList(_oLoader.getItemByTitle("XML").content).queueloader.item[1]);
			}
		}
	}
}