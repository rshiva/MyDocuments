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
	},
	
	show: function(content){
		if (Browser.Version() <= 7) {
			this.apperer = Effect.Appear(content, {duration:0});
		}else{
			this.apperer = Effect.Appear(content);
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

		this.currentID=btnID;
		this.show(this.contents[btnID])
	},
	
	hideContent: function(e,btnID){
		this.clearEffects();
		this.hide(this.contents[btnID]);
	},
	
	
	
	clearEffects: function(){
		if (typeof(this.fader) != "undefined") this.fader.cancel();
		if (typeof(this.appear) != "undefined") this.appear.cancel();
	},

	
	hideAllContents: function(){
		for (var i=0; i<this.contents.length; i++){
			this.contents[i].setStyle( {"display":"none"} );
		}
	}
});