/*
	GENERIC SCROLLER CLASS
	- created by Daniel Ireland for Red Ant Design
	- requires prototype & scriptaculous
	- see EOF for example useage
*/
var scroller = Class.create({

	initialize: function(obj) {		
		var feature = $$('#'+obj.container+' .'+obj.item); // put all items into feature array
		
		this.itemDimension = ( obj.type == "h" ) ? obj.width : obj.height; //if h use width as itemDimension, otherwise use height 
		this.constrainDimension = (obj.type == "h") ? $(obj.container).up().getWidth() : $(obj.container).up().getHeight(); // if h use mask width as constrainDimension, otherwise use mask height
		this.item_offset = -1*this.itemDimension; 
		
		this.totalWidth = ( obj.type == "h" ) ? feature.length * this.itemDimension : obj.width; // if h calculate total item width, otherwise use item width
		this.totalHeight = ( obj.type == "h" ) ? obj.height : feature.length * this.itemDimension; // if h use item height, otherwise calculate total item height		
		
		this.startObj = (obj.type == "h") ? { left : this.item_offset+'px'} : { top : this.item_offset+'px'}; // if h left= -item width, otherwise top = -item height
		this.endObj = (obj.type == "h") ? { left : '0px'} : { top : '0px'}; // if h left=0, otherwise top =0
		
		this.dir = obj.dir;
		this.interval = obj.interval;
		this.curr = 0;
		this.scrolling = false;	
		this.settings = obj;
		
		$(obj.container).setStyle({width:this.totalWidth+"px",height:this.totalHeight+"px",display:"block", overflow:"hidden"}); // reset items containers dimension
		
		// if scroll content is larger than mask, add listener, otherwise hide scroll btn
		if (feature.length > (this.constrainDimension/this.itemDimension)){
			Event.observe(obj.left, 'click', this.scroll.bindAsEventListener(this, -1));
			Event.observe(obj.right, 'click', this.scroll.bindAsEventListener(this, 1));			
			if (obj.auto) setInterval(this.scroll.bind(this), this.interval*1000); 
		}else{
			$(obj.left).hide();
			$(obj.right).hide();
		}
	},
	
	scrollPrepare: function(){
		var items = $$('.'+this.settings.item);
		if (this.dir < 0){
			items[0].insert({before:items[items.length-1]}); // if move previous insert last item before first item
			$(this.settings.container).setStyle( this.startObj ); // reset items container position
		}
	},

	scrollComplete: function(){
		var items = $$('.'+this.settings.item);
		if (this.dir > 0){
			items[items.length-1].insert({after:items[0]}); // if move next, insert first item after last item
			$(this.settings.container).setStyle( this.endObj ); // reset items container position
		}
		this.scrolling = false;
	},
	
	scroll: function(event, dir){
		// if animation is playing, it will not fire anything
		if (this.scrolling != true){		
			this.scrolling = true;
			var items = $$('.'+this.settings.item);
			this.dir = (dir == undefined) ? 1 : dir;
			
			var loc = (this.dir < 0) ? 0 : this.dir*(this.item_offset); // if scrolling previous, we only need to scroll to zero because the scrollPrepare function will move things around.
			var xloc = (this.settings.type == "h") ? loc : 0; // if h scroll x in loc, otherwise scroll x in 0
			var yloc = (this.settings.type == "h") ? 0 : loc; // if h scroll y in 0, otherwise scroll y in loc
			new Effect.Move($(this.settings.container),{ 
				x:xloc, 
				y:yloc, 
				duration:1/this.settings.speed, 
				mode:'absolute',
				transition: Effect.Transitions.sinoidal,
				beforeStart: this.scrollPrepare.bind(this), 
				afterFinish: this.scrollComplete.bind(this)
			});
      		try { event.stop() } catch(e) {}
		}
	}
		
});