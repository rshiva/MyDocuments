// JavaScript Document
var Browser = {
  Version: function() {
    var version = 999; // we assume a sane browser
    if (navigator.appVersion.indexOf("MSIE") != -1)
      // bah, IE again, lets downgrade version number
      version = parseFloat(navigator.appVersion.split("MSIE")[1]);
    return version;
  }
};

var beach_bag = Class.create({
	initialize: function(){
		this.btns=$$('#container .btn');
		this.contents=$$("#container .content");
		this.interval = 10;
	    this.currentID = 0;
		
		for(var i=0; i<this.btns.length; i++){
			Event.observe(this.btns[i], 'mouseover', this.showContent.bindAsEventListener(this, i));
			Event.observe(this.btns[i], 'mouseout', this.hideContent.bindAsEventListener(this, i));
		}
		
		this.anInterval = setInterval(this.animate.bind(this), this.interval*1000);
	},

	
	animate: function(e, flag){
		var content=this.contents[this.currentID];
		this.show(content,flag);
		this.currentID = (this.currentID < this.btns.length-1) ? this.currentID + 1 : 0;
	},
	
	show: function(content, flag){
		if (Browser.Version() <= 7) {
			this.apperer = Effect.Appear(content, {duration:0});
		}else{
			this.apperer = Effect.Appear(content);
		}
		
		if (typeof(flag)== "undefined"){
			this.timeoutContent(content); 
	    }
	},
	
	hide: function(content){
		if (Browser.Version() <= 7) {
	    	this.fader = Effect.Fade(content, {duration:0});
	    }else{
	    	this.fader = Effect.Fade(content);
	    }
	},
	
	
	
	showContent: function(e,btnID){
		this.hideAllContents();
		this.clearEffects();
		this.stopAnimation();

		this.currentID=btnID;
		this.animate(null, true);
	},
	
	hideContent: function(e,btnID){
		this.clearEffects();
		this.hide(this.contents[btnID]);
		this.anInterval = setInterval(this.animate.bind(this), this.interval*1000);
	},
	
	
	stopAnimation:function(){
		clearInterval(this.anInterval);
	  	clearTimeout(this.aTimeout);
	},
	
	
	clearEffects: function(){
		if (typeof(this.fader) != "undefined") this.fader.cancel();
		if (typeof(this.appear) != "undefined") this.appear.cancel();
	},

	
	hideAllContents: function(){
		for (var i=0; i<this.contents.length; i++){
			this.contents[i].setStyle( {"display":"none"} );
		}
	},
	
	timeoutContent: function(content){
		var thisObj = this;
		var time = (this.interval*900);
		this.aTimeout = setTimeout(function(){ thisObj.hide(content); }, time );
	}
});