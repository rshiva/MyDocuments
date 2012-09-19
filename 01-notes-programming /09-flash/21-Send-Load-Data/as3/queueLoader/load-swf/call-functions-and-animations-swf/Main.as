package {

	import com.hydrotik.queueloader.QueueLoader;
	import com.hydrotik.queueloader.QueueLoaderEvent;

	import flash.display.*;
	import flash.events.*;
	import flash.utils.getDefinitionByName;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;

	public class Main extends MovieClip {

		public function Main() {
			import com.hydrotik.queueloader.QueueLoader;
			import com.hydrotik.queueloader.QueueLoaderEvent;

			var _oLoader:QueueLoader = new QueueLoader();

			_oLoader.addItem("timeline.swf", this);

			_oLoader.addEventListener(QueueLoaderEvent.ITEM_COMPLETE, onItemComplete,false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_PROGRESS, onQueueProgress, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_COMPLETE, onQueueComplete,false, 0, true);

			_oLoader.execute();

			function onQueueProgress(event:QueueLoaderEvent):void {
				trace("\t>>onQueueProgress: "+event.queuepercentage);
			}

			function onItemComplete(event:QueueLoaderEvent):void {
				trace("\t>> "+event.type, "item title: "+event.title);
				if (event.fileType==QueueLoader.FILE_SWF) {
					// fireFunction refer a function in swf 
					event.content.fireFunction();

					// tell swf main timeline goto and play frame2
					event.content.gotoAndPlay(2);
				}
			}

			function onQueueComplete(event:QueueLoaderEvent):void {
				trace("** "+event.type);
			}
		}
	}
}