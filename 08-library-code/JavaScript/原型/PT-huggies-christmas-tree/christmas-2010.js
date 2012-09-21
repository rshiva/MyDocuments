var Browser = {
  Version: function() {
    var version = 999; // we assume a sane browser
    if (navigator.appVersion.indexOf("MSIE") != -1)
      // bah, IE again, lets downgrade version number
      version = parseFloat(navigator.appVersion.split("MSIE")[1]);
    return version;
  }
};

var christmas_tree = Class.create({
  initialize: function(){
    
    // vars
    this.items = $$('#christmas .item');
    this.balls = $$('#christmas a.ball');
    this.interval = 5;
    this.currRec = 0;
  	
	// console.log(this.items);
	// console.log(this.balls);
	
    // timer
    // this.anInterval = setInterval(this.animate.bind(this), this.interval*1000);
    
    for (var i=0;i<this.balls.length;i++){
		Event.observe(this.balls[i], 'mouseover', this.highlightItem.bindAsEventListener(this, i));   
		Event.observe(this.balls[i], 'mouseout', this.unhighlightItem.bindAsEventListener(this, i));   	
    }
  },
  
  animate: function(e){
    var el = this.items[this.currRec];
    this.showItem(el);
    
    // update rec
    // this.currRec = (this.currRec < this.items.length-1) ? this.currRec + 1 : 0;
  },
  
  showItem : function(el){
   	el.setStyle({'display':'none'});
   	if (Browser.Version() <= 7) {
   		this.apperer = Effect.Appear(el, {duration:0});
   	}else{
   		this.apperer = Effect.Appear(el);
   	}
    if (typeof(bool)== "undefined"){
		this.timeoutItem(el); 
    }
  },
  
  hideItem : function(el){
    if (Browser.Version() <= 7) {
    	this.fader = Effect.Fade(el, {duration:0});
    }else{
    	this.fader = Effect.Fade(el);
    }
  },
  
  highlightItem: function(e,i){
  	// clean up
	this.stopAnimation();  	
  	this.clearEffects();
  	this.hideAllItems();
  	
	// set current animation target number
	console.log("highlight"+i)
	this.currRec = i;
  	this.animate(null);
  },
  
  unhighlightItem: function(e,i){
  	this.clearEffects();
  	this.hideItem(this.items[i]);
  	// this.startAnimation();
  },
  
  timeoutItem: function(el){
  	var thisObj = this;
	var time = (this.interval*900);
	this.aTimeout = setTimeout(function(){ thisObj.hideItem(el); }, time );   
  },
  
  hideAllItems: function(){
  	for (var q=0;q<this.items.length;q++){
		this.items[q].setStyle( {"display":"none"} );
  	}
  },
  
  clearEffects: function(){
	if (typeof(this.fader) != "undefined") this.fader.cancel();
  	if (typeof(this.appear) != "undefined") this.appear.cancel();
  },
  
  stopAnimation: function(){
  	clearInterval(this.anInterval);
  	clearTimeout(this.aTimeout);
  },
  
});

