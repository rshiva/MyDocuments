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
		// console.log(this.navigationFlags);
		this.currentID=0;
		
		
		for(var i=0; i<this.btns.length; i++){
			Event.observe(this.btns[i], 'click', this.showContent.bindAsEventListener(this, i));
		}
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
	
	showContent: function(event,btnID){
		if(btnID==this.currentID){
			return;
		}else{
			this.currentID=btnID;
			this.updateNavigation();
			this.hideALLContent();
			if (this.browserVersion <= 7) {
				this.apperer = Effect.Appear(this.contents[this.currentID], {duration:0});
			}else{
				this.apperer = Effect.Appear(this.contents[this.currentID]);
			}
		}
	},
	
	hideALLContent: function(){
		for(var i=0; i<this.contents.length; i++){
			this.contents[i].setStyle( {"display":"none"} );
		}
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
	}
})