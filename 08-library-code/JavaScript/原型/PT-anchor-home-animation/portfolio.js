var portfolio_slider = Class.create({

	initialize: function(obj) {		
		// 
		var projects = $$('#portfolio .client'); 
		this.itemWidth = obj.width;
		this.item_hoffset = -1*this.itemWidth;
		this.totalWidth = projects.length * this.itemWidth;
		this.totalHeight = obj.height;
		this.scrolling = false;
		this.interval = obj.interval;
		
		//
		Event.observe($('next-btn'), 'click', this.scroll.bindAsEventListener(this, 1));
		
		$('clients').setStyle({width:this.totalWidth+"px",height:this.totalHeight+"px",display:"block"});
		
		setInterval(this.scroll.bind(this), this.interval*1000); 
	},
	
	scrollPrepare: function(){
		if (this.dir < 0){
			console.log('see?');
			var items = $$('.client');
			items[0].insert({before:items[items.length-1]});
			$('clients').setStyle({left:this.item_hoffset+'px'});
		}
	},

	scrollComplete: function(){
		if (this.dir > 0){
			var items = $$('.client');
			items[items.length-1].insert({after:items[0]});
			$('clients').setStyle({left:0+'px'});
		}
		this.scrolling = false;
	},
	
	scroll: function(event, dir){
		if (this.scrolling != true){ // check if animation is playing		
			this.scrolling = true;
			var items = $$('.client');
			
			// if scrolling previous, we only need to scroll to zero because the scrollPrepare function will move things around.
			this.dir = (dir == undefined) ? 1 : dir;
			
			var loc = (this.dir < 0) ? 0 : this.dir*(this.item_hoffset); 
			new Effect.Move($('clients'),{ 
				x:loc, 
				y:0, 
				duration:0.35, 
				mode:'absolute',
				transition: Effect.Transitions.sinoidal,
				beforeStart: this.scrollPrepare.bind(this), 
				afterFinish: this.scrollComplete.bind(this)
			}); 
		}
      	try { event.stop() } catch(e) {}
	}
		
});

document.observe('dom:loaded', function(){
	var rSlider = new portfolio_slider( {width:962, height: 316, interval: 7} );
});