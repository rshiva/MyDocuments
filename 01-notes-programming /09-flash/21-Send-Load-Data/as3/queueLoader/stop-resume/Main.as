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

			_oLoader.addItem("imgs/img0.jpg", img, {title:"Image 1"});
			_oLoader.addItem("imgs/img1.jpg", img2, {title:"Image 2"});

			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_PROGRESS, onQueueProgress, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.ITEM_COMPLETE, onItemComplete,false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_COMPLETE, onQueueComplete,false, 0, true);

			_oLoader.execute();

			function onQueueProgress(event:QueueLoaderEvent):void {
				trace("\t>>onQueueProgress: "+event.queuepercentage);
			}

			function onItemComplete(event:QueueLoaderEvent):void {
				trace("\t>> "+event.type, "item title: "+event.title);
				if (event.title == "Image 1") {
					_oLoader.stop();
					// Set a 4 second to pause and resume the load
					setTimeout(resumeLoad, 4000);
				}
			}

			function onQueueComplete(event:QueueLoaderEvent):void {
				trace("** "+event.type);
			}

			function resumeLoad():void{
				_oLoader.resume();
			}
		}
	}
}