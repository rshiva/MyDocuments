package {
	
	import com.hydrotik.queueloader.QueueLoader;
	import com.hydrotik.queueloader.QueueLoaderEvent;
	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;

	public class Main extends MovieClip {
		
		public function Main() {
			var _oLoader:QueueLoader = new QueueLoader(true); //<- true arg sets ignore errors

			var img:Sprite = new Sprite();
			img.x = 0;
			img.y = 0;
			addChild(img);

			var img2:Sprite = new Sprite();
			img2.x = 200;
			img2.y = 0;
			addChild(img2);

			var img3:Sprite = new Sprite();
			img3.x = 400;
			img3.y = 0;
			addChild(img3);

			_oLoader.addItem("/imgs/img0.jpg", img);
			_oLoader.addItem("/imgs/img5.jpg", img2);
			_oLoader.addItem("/imgs/img2.jpg", img3);

			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_PROGRESS, onQueueProgress, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_COMPLETE, onQueueComplete,false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.ITEM_ERROR, onItemError,false, 0, true);

			_oLoader.execute();

			function onQueueProgress(event:QueueLoaderEvent):void {
				trace("\t>>onQueueProgress: "+event.queuepercentage);
			}

			function onItemError(event:QueueLoaderEvent):void {
				trace("\n>>"+event.message+"\n");
			}

			function onQueueComplete(event:QueueLoaderEvent):void {
				trace("** "+event.type);
			}
		}
	}
}