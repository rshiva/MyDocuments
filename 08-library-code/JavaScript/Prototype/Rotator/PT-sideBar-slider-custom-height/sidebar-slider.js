var sideBarSlider=Class.create({
	initialize:function(contentContainer,displayContainer,mask){
		this.contentContainer=$(contentContainer);
		this.displayContainer=$(displayContainer);
		this.mask=$(mask);
		
		this.interval=3;
		this.maxDisplayItem=3;
		this.maskHeight=0;
		
		var contentItems=$$('#'+contentContainer+' .item');
		
		// add initial content to display container
		for(var i=0; i<this.maxDisplayItem; i++){
			this.displayContainer.insert(contentItems[i]); // add items to display container 
			this.maskHeight+=contentItems[i].getHeight(); // count the total items' height
		}
		
		this.mask.setStyle({height:this.maskHeight+'px'}); // set the clipping mask height
		
		
		this.displayContainer.observe('mouseover', this.stopTimer.bindAsEventListener(this));
		this.displayContainer.observe('mouseout', this.startTimer.bindAsEventListener(this));
		
		this.startTimer();
		
	},
	

	animate: function(){
		var newItem=this.contentContainer.down(0);
		var oldItem=this.displayContainer.down(0);
		
		_self=this
		new Effect.Morph(oldItem, {style:'margin-top:'+-oldItem.getHeight()+'px', duration:0.6, // move old item up
							beforeStart:function(){ 
								_self.displayContainer.insert(newItem);
								_self.maskHeight=_self.maskHeight-oldItem.getHeight()+newItem.getHeight();
								new Effect.Morph(_self.mask, {style:'height:'+_self.maskHeight+'px', duration:0.6 });
							},
							afterFinish:function(){ 
								_self.contentContainer.insert(oldItem);
								_self.resetStyle(oldItem);
							} 
		});
	},
	
	
	resetStyle: function(item){
		item.writeAttribute('style','')
	},
	
	startTimer: function(){
		this.timer=setInterval(this.animate.bind(this), this.interval*1000);
	},
	
	stopTimer: function(){
		clearInterval(this.timer);
	}
})