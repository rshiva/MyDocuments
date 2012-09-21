package com.redant{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.external.ExternalInterface;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import flash.net.navigateToURL;

	/**
	 * ...
	 * @author Harry
	 */

	public class FlashTracker extends Sprite {
		private var _scope:MovieClip;
		private var _reDirectURL:String;
		private var _countTotalClick:String;
		private var _countClickLocation:String;
		private var _googleAsynch:Boolean;

		public function FlashTracker(scope:MovieClip,googleAsynch:Boolean=false) {
			_scope=scope;
			_googleAsynch=googleAsynch;
		}

		public function countTotalClick():void {

			_countTotalClick=_scope.promoName+"/"+_scope.sourceType+"/"+_scope.adType+"/"+_scope.action+"/"+"Total";
			if(_googleAsynch){
				ExternalInterface.call("_gaq.push(['_trackPageview',"+"'"+_countTotalClick+"'"+"])");// for google asynch
			}else{
				ExternalInterface.call("pageTracker._trackPageview", _countTotalClick);// for Google Analytics traditional installation 
			}
		}

		public function countClickLocation():void {
			_countClickLocation=_scope.promoName+"/"+_scope.sourceType+"/"+_scope.adType+"/"+_scope.action+"/"+_scope.clickLocation;
			if(_googleAsynch){
				ExternalInterface.call("_gaq.push(['_trackPageview',"+"'"+_countClickLocation+"'"+"])");// for google asynch
			}else{
				ExternalInterface.call("pageTracker._trackPageview", _countClickLocation);// for traditional installation Google Analytics
			}
		}

		public function reDirect(reDirectURL:String):void {
			_reDirectURL=_scope.baseURL+reDirectURL;

			var iTimer:Timer=new Timer(1000,1);
			iTimer.addEventListener(TimerEvent.TIMER, timerHandler);
			iTimer.start();

			function timerHandler(e:TimerEvent):void {
				navigateToURL(new URLRequest(_reDirectURL),"_blank");
				
			}

		}

		public function trackingVars():void {
			showTextOnStage("baseURL: " + _scope.baseURL, 20, 100);
			showTextOnStage("promotionName: " + _scope.promoName, 20, 130);
			showTextOnStage("sourceType: " + _scope.sourceType, 20, 160);
			showTextOnStage("adType: " + _scope.adType, 20, 190);
			showTextOnStage("action: " + _scope.action, 20, 220);
			showTextOnStage("reDirectURL: " + _reDirectURL, 20, 250);
			showTextOnStage("countTotalClick: " + _countTotalClick, 20, 280);
			showTextOnStage("countClickLocation: " + _countClickLocation, 20, 310);
		}

		private function showTextOnStage(inPutString:String,locX:int,locY:int):void {
			var iTextFormat:TextFormat = new TextFormat();
			iTextFormat.size=20;

			var iTextField:TextField = new TextField();
			iTextField.width=760;
			iTextField.multiline=true;
			iTextField.wordWrap=true;

			iTextField.autoSize=TextFieldAutoSize.LEFT;
			iTextField.background=true;
			iTextField.text=inPutString;
			iTextField.setTextFormat(iTextFormat);
			iTextField.x=locX;
			iTextField.y=locY;

			_scope.addChild(iTextField);
		}
	}

}