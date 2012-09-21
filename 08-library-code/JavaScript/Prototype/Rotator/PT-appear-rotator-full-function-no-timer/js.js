// JavaScript Document
var rotater = Class.create({
	initialize: function(contentContainer, contentItem, navContainer, navBtn, leftArrow, rightArrow){		
		this.contents=$$("#"+contentContainer+" "+"."+contentItem);
		this.navBtns=$$("#"+navContainer+" "+"."+navBtn);
		this.navFlags=$$("#"+navContainer+" "+"li");
		this.currentID=0;
		this.browserVersion=this.checkBrowser();
		this.leftBtn=$(leftArrow);
		this.rightBrn=$(rightArrow);
		
		for(var i=0; i<this.navBtns.length; i++){
			Event.observe(this.navBtns[i], 'click', this.showContent.bindAsEventListener(this, i));
		}
		
		Event.observe(this.leftBtn, 'click', this.arrowBtnHandler.bindAsEventListener(this, -1));
		Event.observe(this.rightBrn, 'click', this.arrowBtnHandler.bindAsEventListener(this, 1));
	},
	
	// check broswer if ie6 or lower, kill transition
	checkBrowser: function(){
		var version = 999; 
		if (navigator.appVersion.indexOf("MSIE") != -1){
			// IE lets downgrade version number
			version = parseFloat(navigator.appVersion.split("MSIE")[1]);
		}
		return version;
	},
	
	hideALLContent: function(){
		for(var i=0; i<this.contents.length; i++){
			this.contents[i].setStyle( {"display":"none"} );
		}
	},
	
	updateNavigation: function(){
		// clean up
		for(var i=0; i<this.navFlags.length; i++){
			if(this.navFlags[i].hasClassName('current')){
				this.navFlags[i].removeClassName('current');
			}
		}

		// add class name for current flag
		this.navFlags[this.currentID].addClassName('current');
	},
	
	arrowBtnHandler: function(event, step){
		this.currentID +=step;
		if(this.currentID < 0){
			this.currentID=0;
		}else if(this.currentID >= this.contents.length-1){
			this.currentID=this.contents.length-1;
		}
		
		this.updateNavigation();
		this.hideALLContent();
		
		if (this.browserVersion <= 7) {
			this.apperer = Effect.Appear(this.contents[this.currentID], {duration:0});
		}else{
			this.apperer = Effect.Appear(this.contents[this.currentID]);
		}
	},
	
	showContent: function(event,btnID){
		if(btnID == this.currentID){
			return;
		}else{
			this.currentID = btnID;
			this.updateNavigation();
			this.hideALLContent();
			if (this.browserVersion <= 7) {
				this.apperer = Effect.Appear(this.contents[this.currentID], {duration:0});
			}else{
				this.apperer = Effect.Appear(this.contents[this.currentID]);
			}
		}
	}
})