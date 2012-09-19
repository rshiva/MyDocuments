package {
	
	import com.hydrotik.queueloader.QueueLoader;
	import com.hydrotik.queueloader.QueueLoaderEvent;
	
	import flash.display.*;
	import flash.events.*;
	import flash.media.*;
	import flash.utils.getDefinitionByName;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;

	public class Main extends MovieClip {
		
		// Calling a SWF's Library Class References - Application Domain Example
		public function Main() {
			
			// create a loading bar to show item loading
			var itemIndicator:LoadingIndicator = new LoadingIndicator(300, 150, 200, 5);
			addChild(itemIndicator);
			
			// create a loading bar to show total data loading
			var queueIndicator:LoadingIndicator = new LoadingIndicator(300, 200, 200, 5);
			addChild(queueIndicator);
			
			
			var addedDefinitions:LoaderContext = new LoaderContext();
			addedDefinitions.applicationDomain = ApplicationDomain.currentDomain;
			
			var _oLoader:QueueLoader = new QueueLoader(false, addedDefinitions, true, "testQueue");
			
			_oLoader.addItem("soundTest.swf", this, { title:"SWF" } );
			
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_START, onQueueStart, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.ITEM_START, onItemStart, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.ITEM_PROGRESS, onItemProgress, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.ITEM_COMPLETE, onItemComplete,false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.ITEM_ERROR, onItemError,false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_PROGRESS, onQueueProgress, false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_COMPLETE, onQueueComplete,false, 0, true);
			_oLoader.addEventListener(QueueLoaderEvent.QUEUE_COMPLETE, onQueueComplete, false, 0, true);
			
			_oLoader.execute();
			
			//Listener functions
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
				// when swf file loaded. 
				// create sound object from swf library class (Loop1 is the class name define in library)
				var loop:Sound = new (getDefinitionByName("Loop1"))();
				var soundChannel:SoundChannel = loop.play(0,999);
			}
		}
	}
}












