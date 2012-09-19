package {
	
	import com.hydrotik.queueloader.QueueLoader;
	import com.hydrotik.queueloader.QueueLoaderEvent;
	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;

	public class Main extends MovieClip {
		
		public function Main() {
			var _oLoader:QueueLoader = new QueueLoader();

			_oLoader.addItem("externalimages.swf", null, {title:"SWF Images", drawFrames:true});

			_oLoader.addEventListener(QueueLoaderEvent.ITEM_COMPLETE, onItemComplete,false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_PROGRESS, onQueueProgress, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_COMPLETE, onQueueComplete,false, 0, true);
			_oLoader.execute();

			function onItemComplete(event:QueueLoaderEvent):void {
				trace("\t>> "+event.type, "item title: "+event.title);
				if (event.title == "SWF Images") {
					var startX:int = 0; 
					var startY:int = 65;
					for (var i:int = 0; i<event.bmArray.length; i++) {
						var bm:Bitmap = new Bitmap(event.bmArray[i], "auto", true);
						bm.x = startX;
						bm.y = startY;
						addChild(bm);
						startX = startX + 85;
					}
				}
			}

			function onQueueProgress(event:QueueLoaderEvent):void {
				trace("\t>>onQueueProgress: "+event.queuepercentage);
			}

			function onQueueComplete(event:QueueLoaderEvent):void {
				trace("** "+event.type);
			}
		}
	}
}