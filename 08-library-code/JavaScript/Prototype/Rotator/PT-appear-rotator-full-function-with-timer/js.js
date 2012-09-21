// JavaScript Document
var rotater = Class.create({
	initialize: function(contentContainer, contentItem, navContainer, navBtn, leftArrow, rightArrow, interval){		
		this.contents=$$("#"+contentContainer+" "+"."+contentItem);
		this.navBtns=$$("#"+navContainer+" "+"."+navBtn);
		this.navFlags=$$("#"+navContainer+" "+"li");
		this.currentID=0;
		this.browserVersion=this.checkBrowser();
		this.leftBtn=$(leftArrow);
		this.rightBrn=$(rightArrow);
		this.interval=interval;
		
		for(var i=0; i<this.navBtns.length; i++){
			Event.observe(this.navBtns[i], 'click', this.clickHandler.bindAsEventListener(this, i));
		}
		
		Event.observe(this.leftBtn, 'click', this.arrowBtnHandler.bindAsEventListener(this, -1));
		Event.observe(this.rightBrn, 'click', this.arrowBtnHandler.bindAsEventListener(this, 1));
		
		this.startTimer();
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
			this.currentID=this.contents.length-1;
		}else if(this.currentID > this.contents.length-1){
			this.currentID=0;
		}
		
		this.stopTimer();
		this.updateNavigation();
		this.hideALLContent();
		this.show(true);
	},
	
	clickHandler: function(event,btnID){
		if(btnID==this.currentID){
			return
		}else{
			this.currentID=btnID;
			this.stopTimer();
			this.hideALLContent();
			this.updateNavigation();
			this.show(true);
		}
	},
	
	show: function(flag){
		if (this.browserVersion <= 7) {
			this.apperer = Effect.Appear(this.contents[this.currentID], {duration:0});
		}else{
			this.apperer = Effect.Appear(this.contents[this.currentID]);
		}

		// if the call from click handler, need restart the timer
		if(flag){
			this.startTimer();
		}
	},
	
	
	timerHandler: function(){
		this.currentID = (this.currentID < this.contents.length-1) ? this.currentID + 1 : 0;
		this.hideALLContent();
		this.updateNavigation();
		if (this.browserVersion <= 7) {
			this.apperer = Effect.Appear(this.contents[this.currentID], {duration:0});
		}else{
			this.apperer = Effect.Appear(this.contents[this.currentID]);
		}
	},
	
	startTimer: function(){
		this.anInterval = setInterval(this.timerHandler.bind(this), this.interval*1000);
	},
	
	stopTimer: function(){
		clearInterval(this.anInterval);
	}
})