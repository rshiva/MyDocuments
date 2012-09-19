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
			
			// create a loading bar to show item loading
			var itemIndicator:LoadingIndicator = new LoadingIndicator(300, 150, 200, 5);
			addChild(itemIndicator);
			
			// create a loading bar to show total data loading
			var queueIndicator:LoadingIndicator = new LoadingIndicator(300, 200, 200, 5);
			addChild(queueIndicator);
			
			// create a container to hold all objects
			var imageContainer:Sprite = new Sprite();
			
			// for load swf and other media
			var addedDefinitions:LoaderContext = new LoaderContext();
			addedDefinitions.applicationDomain=ApplicationDomain.currentDomain;
			
			// all data information 
			var imageInfo:Array=[{img:"imgs/img0.jpg",x:0,y:0},{img:"imgs/img1.jpg",x:200,y:0},{img:"imgs/img2.jpg",x:400,y:0},{img:"imgs/img3.jpg",x:600,y:0}];
			
			// create QueueLoader
			var _oLoader:QueueLoader = new QueueLoader(false, addedDefinitions, true, "testQueue");
			
			// load data
			for (var i:int = 0; i < imageInfo.length; i++) {
				var img:Sprite = new Sprite();
				img.name="image_"+i;
				img.x=imageInfo[i].x;
				img.y=imageInfo[i].y;
				imageContainer.addChild(img);
				// turn the smoothing when load images
				_oLoader.addItem(imageInfo[i].img, img, {title:"Image "+i, cacheKiller:true, smoothing:true});
			}
			
			// add listeners to listen all loading event
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_START, onQueueStart, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.ITEM_START, onItemStart, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.ITEM_PROGRESS, onItemProgress, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.ITEM_COMPLETE, onItemComplete,false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.ITEM_ERROR, onItemError,false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_PROGRESS, onQueueProgress, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_COMPLETE, onQueueComplete,false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.ITEM_HTTP_STATUS, onHTTPError,false, 0, true);
			_oLoader.execute();
			
			// functions according to all loading event
			function onQueueStart(event:QueueLoaderEvent):void {
				trace("** "+event.type);
			}
			
			function onItemStart(event:QueueLoaderEvent):void {
				trace("\t>> "+event.type, "item title: "+event.title);
			}
			
			function onItemProgress(event:QueueLoaderEvent):void {
				// update indicator to show item loading status
				itemIndicator.updateProgressBar(event.percentage);
				itemIndicator.updateText(event.title.toUpperCase()+":          "+Math.round((event.percentage*100)).toString() + "% COMPLETE");
			}
			
			function onQueueProgress(event:QueueLoaderEvent):void {
				// update indicator to show total loading status
				queueIndicator.updateProgressBar(event.queuepercentage);
				queueIndicator.updateText("TOTAL:          "+Math.round((event.queuepercentage*100)).toString() + "% COMPLETE");
			}
			
			function onItemComplete(event:QueueLoaderEvent):void {
				trace("\t>> "+event.type, "item title: "+event.title);
			}
			
			function onItemError(event:QueueLoaderEvent):void {
				trace("\n>>"+event.message+"\n");
			}
			
			function onHTTPError(event:QueueLoaderEvent):void {
				//trace("\n\t\t>>"+event.message+"\n");
			}
			
			function onQueueComplete(event:QueueLoaderEvent):void {
				trace("** "+event.type);
				// when all data loaded. add container to displaylist and remove indicator
				addChild(imageContainer);
				removeChild(itemIndicator);
				removeChild(queueIndicator);
			}
		}
		
	}
}