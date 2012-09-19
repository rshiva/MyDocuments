package  
{


import fl.containers.UILoader;
import fl.controls.Label;
import fl.controls.ProgressBar;
import fl.controls.ProgressBarMode;
import fl.events.ComponentEvent;

import flash.display.Sprite;
import flash.events.*;
import flash.text.*;

	
	/**
	 * ...
	 * @author Harry
	 */
	
	public class Main extends Sprite{	
		
		
		public function Main() {
			// listen to load external source file
			// demo1();
		}
		
		public function demo1():void {
			var url:String = "sea.jpg";
			
			var myUILoader:UILoader = new UILoader();
			myUILoader.scaleContent = false;
			myUILoader.autoLoad = false;
			myUILoader.source = url;
			myUILoader.load();
			
			var myProgressBar:ProgressBar = new ProgressBar();
			myProgressBar.mode = ProgressBarMode.EVENT;
			myProgressBar.indeterminate = false; // show solid fill with know amount data. if set true will show a strip parten. 
			myProgressBar.source = myUILoader;
			myProgressBar.setSize(320, 12);
			myProgressBar.move((stage.stageWidth - myProgressBar.width) / 2, (stage.stageHeight - myProgressBar.height) / 2);
			myProgressBar.addEventListener(Event.COMPLETE, completeHandler);
			myProgressBar.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			addChild(myProgressBar);
			
			var myLabel:Label = new Label();
			myLabel.text = "";
			myLabel.autoSize = TextFieldAutoSize.LEFT;
			myLabel.move(myProgressBar.x, myProgressBar.y + myProgressBar.height);
			addChild(myLabel);

			function progressHandler(event:ProgressEvent):void {
				// trace("progress:", event.bytesLoaded, "of", event.bytesTotal, "bytes");
				myLabel.text = event.bytesLoaded + " of " + event.bytesTotal + " (" + event.currentTarget.percentComplete.toFixed(1) + "%)";
			}

			function completeHandler(event:Event):void {
				trace("complete:");
				removeChild(myLabel);
				removeChild(myProgressBar);
				myProgressBar.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
				myProgressBar.removeEventListener(Event.COMPLETE, completeHandler);
				addChild(myUILoader);
			}
		}
	}

}