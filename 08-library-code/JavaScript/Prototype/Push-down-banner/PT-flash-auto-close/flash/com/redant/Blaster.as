
package com.redant {
	
	import flash.external.ExternalInterface;
	import flash.events.*;
    import flash.net.*;
	import flash.utils.Timer;
	import flash.display.MovieClip;	
	import com.carlcalderon.arthropod.Debug;
	
	public class Blaster extends MovieClip {
		
		private var _bannerID					:String;
		private var _bannerContainingDIV		:String;
		private var _bannerElementDIV			:String;
		private var _bannerHeight				:Number;
		private var _collapsable				:Boolean;
		private var _perm				:Boolean;
		private var _cookie						:SharedObject;
		
		public function Blaster(scope, id:String, div:String="flash_wide_banner", el:String="openx_wide_zone", collapsable:Boolean=true, height:Number=180, width:Number=960, permanant:Boolean=true){
			// set up vars
			_bannerID = id;
			_bannerContainingDIV = div;
			_bannerElementDIV = el;
			_bannerHeight = height;
			_collapsable = collapsable;
			_perm = permanant;
			
			this.addEventListener(MouseEvent.CLICK, hideBanner);
			this.x = width;
			this.y = 0;			
			this.mouseChildren = false;
			this.buttonMode = true;			
			
			scope.addChild(this);

			// check js is ready
			bridgeInit();
		}
		
		public function collapsBanner():void{
			ExternalInterface.call("huggies.collapsBanner", _bannerContainingDIV, _bannerHeight);
			hideBanner();
		}
		
		
		public function hideBanner(e:MouseEvent=null, useElementDiv:Boolean=false, updateCookie:Boolean=true):void{
			if (updateCookie) setCookie();
			(useElementDiv) ? ExternalInterface.call("huggies.closeBanner", _bannerElementDIV) : ExternalInterface.call("huggies.closeBanner", _bannerContainingDIV);
		}
		
		public function revealBanner():void{
			Debug.log("Revealing DIV");
			this.visible = (_collapsable) ? true : false;
			ExternalInterface.call("huggies.openBanner", _bannerContainingDIV, _bannerHeight);
		}
		
		private function bridgeInit():void{
			if (ExternalInterface.available) {
				var readyTimer:Timer = new Timer(100, 0);
				readyTimer.addEventListener(TimerEvent.TIMER, timerHandler);
				readyTimer.start();
			} 
		}
		
		private function checkJavaScriptReady():Boolean {
			Debug.log("Attempting to connect to JS");
			var isReady:Boolean = ExternalInterface.call("huggies.onFlashLoaded");
			return isReady;
		}
		
		private function timerHandler(event:TimerEvent):void {
			var isReady:Boolean = checkJavaScriptReady();
			if (isReady) {
				
				Debug.log("JS is loaded! Woo :)");
			
				// all set - js is ready
				Timer(event.target).stop();
				
				// check if we should show or not
				var closed:Boolean = getCookie();
				
				(closed && _collapsable) ? hideBanner(null, true, false) : revealBanner();
			}
		}	
		
		/*  //////////////
			HIDE ME COOKIE 
			////////////// */
			
		private function getCookie():Boolean{
			_cookie = SharedObject.getLocal("huggiesOpenXFlashBanner"+_bannerID, "/");		
			//_cookie.clear();
			var hidden:Boolean = (_cookie.data.hidden == null) ? false : _cookie.data.hidden;		
			Debug.log("Retreiving Cookie. Value of hidden: "+hidden);
			return (hidden);
		}
		
		private function setCookie():void{
			_cookie.data.hidden = _perm;
			var saved:String = "";
			try {
				saved = _cookie.flush();
			} catch (error:Error) {
				Debug.log("Error...Could not write SharedObject to disk");
			}
		}
		
		private function clearCookie(e:MouseEvent=null):void{	
			_cookie.clear();
		}
	}
}