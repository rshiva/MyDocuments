// JavaScript Document
var rotater = Class.create({
	initialize: function(container, item, itemWidth, navContainer, navBtn, leftArrow, rightArrow){
		this.container = $(container);
		this.items = $$("#"+container+" "+"."+item);
		this.itemWidth = itemWidth;
		this.leftBtn = $(leftArrow);
		this.rightBtn = $(rightArrow);
		this.navBtns=$$("#"+navContainer+" "+"." + navBtn);
		this.navFlags=$$("#"+navContainer+" "+"li");
		this.currentID = 0;

		// reset items container's width, make all items in one line
		this.container.setStyle({ width:( this.itemWidth*2 ) * this.items.length + 'px' });
		
		// reset items right margin
		for (var i=0; i<this.items.length; i++){
			this.items[i].setStyle({ marginRight:this.itemWidth + 'px'});
		};
		
		Event.observe(this.leftBtn, 'click', this.arrowBtnHandler.bindAsEventListener(this, -1));
		Event.observe(this.rightBtn, 'click', this.arrowBtnHandler.bindAsEventListener(this, 1));
		
		for(var i=0; i<this.navBtns.length; i++){
			Event.observe(this.navBtns[i], 'click', this.scrollContent.bindAsEventListener(this, i));
		}
	},
	
	arrowBtnHandler: function(event, step){
		this.currentID +=step;
		if(this.currentID < 0){
			this.currentID = 0;
		}else if(this.currentID > this.items.length-1){
			this.currentID = this.items.length-1;
		}
		
		new Effect.Morph(this.container, {style:'margin-left:'+(this.currentID*this.itemWidth*2*-1) +'px', duration:0.5, transition: Effect.Transitions.sinoidal});
		this.updateNav();
	},	
	
	
	scrollContent: function(event, clickID){
		var _self=this;
		if(clickID > this.currentID){
			// console.log('click project on right side');
			// this.container.setStyle({ marginLeft:(-1*this.itemWidth*2*clickID) +'px'});
			// this.container.setStyle({ marginLeft:(-1*this.itemWidth*2*clickID+this.itemWidth) +'px'});
			new Effect.Morph(this.container, {style:'margin-left:'+ (-1*this.itemWidth*2*clickID) +'px', duration:0.5, transition: Effect.Transitions.sinoidal,
					beforeStart:function(){
						_self.container.setStyle({ marginLeft:(-1* _self.itemWidth * 2 * clickID+_self.itemWidth) + 'px'});
					}
			});
		}else if(clickID < this.currentID){
			// console.log('click project on left side')
			new Effect.Morph(this.container, {style:'margin-left:'+ (-1*this.itemWidth*2*clickID) + 'px', duration:0.5, transition: Effect.Transitions.sinoidal,
					beforeStart:function(){
						_self.container.setStyle({ marginLeft:(-1* _self.itemWidth * 2 * clickID - _self.itemWidth) + 'px'});
					}
			});
		}else{
			return
		}
		
		this.currentID = clickID;
		this.updateNav();
		
	},
	
	updateNav: function(){
		// clean up
		for(var i=0; i<this.navFlags.length; i++){
			if(this.navFlags[i].hasClassName('current')){
				this.navFlags[i].removeClassName('current');
			}
		}

		// add class name for current flag
		this.navFlags[this.currentID].addClassName('current');
	}
})