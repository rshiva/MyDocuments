/**
 * AS3 PV3D Preloader v2.0
 * Copyright (c) 2009 Marco Di Giuseppe	- http://designmarco.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

 //harry Change perloading animation
 
package
{
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import fl.motion.easing.Exponential;
	import gs.TweenLite;

	public class Preloader extends Sprite
	{
		private static const MAIN_SWF:String = "scene.swf"; //name of swf we are preloading
		private static const BAR_INERTIA:Number = 5; //amount of easing applied to progress bar
		private static const POST_DELAY:Number = 2; //time in seconds before loading begins
		private var preloader:PreloadClip; // library movieclip of logo
		private var widthRatio:Number; //total length of progress bar divided by 100

		public function Preloader()
		{
			addEventListener(Event.ENTER_FRAME, checkStage, false, 0, true);
		}
		
		private function checkStage(event:Event):void
		{
			if (stage.stageHeight > 0 && stage.stageWidth > 0)
			{
				removeEventListener(Event.ENTER_FRAME, checkStage);
				init();
			}
		}

		private function init():void
		{
			stage.quality = StageQuality.HIGH;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			preloader = new PreloadClip();
			widthRatio = preloader.progress_mc.bar.width / 100;
			preloader.x = stage.stageWidth * 0.5 - preloader.width * 0.5;
			preloader.y = stage.stageHeight * 0.3;
			preloader.progress_mc.bar.width = 0;
			preloader.progress_mc.visible = false;
			addChild(preloader);
			
			initSequence();
		}

		// logo animation sequence
		private function initSequence():void
		{
			
			// allows entire animation to complete smoothly
			TweenLite.delayedCall(POST_DELAY, loadContent);
		}


		// begin loading process
		private function loadContent():void
		{
			var loader:Loader = new Loader();
			var request:URLRequest = new URLRequest(MAIN_SWF);
			trace(request);
			initListeners(loader.contentLoaderInfo);
			if (request)
			{
				loader.load(request);
				preloader.progress_mc.visible = true;
			}
		}

		//display loading progress
		private function progressHandler(event:ProgressEvent):void
		{
			var percentLoaded:Number = int(((event.bytesLoaded / 1024) / (event.bytesTotal / 1024)) * 100);
			var barWidth:Number = widthRatio * percentLoaded;
			preloader.progress_mc.loading_txt.text = String(int(percentLoaded) + "%");
			preloader.progress_mc.bar.width += (barWidth - preloader.progress_mc.bar.width) / BAR_INERTIA;

			if (percentLoaded == 100)	preloader.progress_mc.visible = false;
		}

		// handle possible error
		private function ioErrorHandler(event:IOErrorEvent):void
		{
			trace("ioErrorHandler: " + event);
			killListeners(event.target.content);
			destroy();
		}

		// fade out preloader and remove listeners
		private function completeHandler(event:Event):void
		{
			var main:Sprite = event.target.content as Sprite;
			TweenLite.to(preloader, 1, {alpha:0, ease:Exponential.easeOut, onComplete:showContent, onCompleteParams:[main]});
			killListeners(main);
		}
		
		private function showContent(swf:Sprite):void
		{
			addChild(swf);
			destroy();
		}

		//clean-up
		private function destroy():void
		{
			if (preloader && preloader.parent)
			{
				preloader.parent.removeChild(preloader);
				preloader = null;
			}
		}

		//listen for loading events
		private function initListeners(dispatcher:IEventDispatcher):void
		{
			dispatcher.addEventListener(Event.COMPLETE, completeHandler);
			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler, false, 0, true);
			dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler, false, 0, true);
		}

		private function killListeners(dispatcher:IEventDispatcher):void
		{
			dispatcher.removeEventListener(Event.COMPLETE, completeHandler);
			dispatcher.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			dispatcher.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
		}
	}
}
