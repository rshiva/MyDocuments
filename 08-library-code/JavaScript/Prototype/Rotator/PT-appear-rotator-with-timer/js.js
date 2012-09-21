// JavaScript Document
var flippy = Class.create({
	// containerName: ID for container
	// contentName: class name for content
	// btnName: class name for navigation button
	// navigationContainerName: ID for navigation container
	initialize: function(containerName,contentName,btnName,navigationContainerName){
		this.browserVersion=this.checkBrowser();
		
		this.contents=$$("#"+containerName+" "+"."+contentName);
		this.btns=$$("#"+containerName+" "+"."+btnName);
		this.navigationFlags=$$("#"+navigationContainerName+" "+"li");
		this.interval=5;
		this.currentID=0;
		
		
		for(var i=0; i<this.btns.length; i++){
			Event.observe(this.btns[i], 'click', this.clickHandler.bindAsEventListener(this, i));
		}
		
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
	
	timerHandler: function(){
		this.currentID = (this.currentID < this.btns.length-1) ? this.currentID + 1 : 0;
		this.cleanEffect();
		this.hideALLContent();
		this.updateNavigation();
		this.show(false);
	},
	
	clickHandler: function(event,btnID){
		if(btnID==this.currentID){
			return
		}else{
			this.currentID=btnID;
			this.cleanEffect();
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
	
	hideALLContent: function(){
		for(var i=0; i<this.contents.length; i++){
			this.contents[i].setStyle( {"display":"none"} );
		}
	},
	
	cleanEffect: function(){
		if (typeof(this.appear) != "undefined") this.appear.cancel();
	},
	
	updateNavigation: function(){
		// clean up
		for(var i=0; i<this.navigationFlags.length; i++){
			if(this.navigationFlags[i].hasClassName('current')){
				this.navigationFlags[i].removeClassName('current');
			}
		}
		
		// add class name for current flag
		this.navigationFlags[this.currentID].addClassName('current');
	},
	
	startTimer: function(){
		this.anInterval = setInterval(this.timerHandler.bind(this), this.interval*1000);
	},
	
	stopTimer: function(){
		clearInterval(this.anInterval);
	}
})