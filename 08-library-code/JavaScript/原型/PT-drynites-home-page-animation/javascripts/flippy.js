/**
	Automatically fade in and fade out a list of items (updating the navigation bar).
*/
var Flippy = Class.create({

	initialize: function(items, itemsNav, duration) {	
		this.duration = duration || 5; 
		this.items = items;
		this.navigation = itemsNav;

		if (this.items && this.navigation) {
			this.nodes = $A([]);
			this.currentIndex = 0;
			this.setupFader();		
			this.navigation.invoke('observe', 'click', this.showItem.bind(this));
			this.start();						
		}
	},

	setupFader: function() {     
		this.items.each(function(child) {
			this.nodes.push(child);
			child.hide();
		}.bind(this));
		this.items.first().show();
		this.nodes_length = this.nodes.length;
	},

	stop: function () { clearTimeout(this.timer); },

	start: function () { this.periodicallyUpdate(); },

	periodicallyUpdate: function () {
		if (this.timer != null) {
			clearTimeout(this.timer);
			this.next();
		}
		this.timer = setTimeout(this.periodicallyUpdate.bind(this), this.duration * 1000);
	},

    next: function() {
		var nextIndex = (this.items.length - 1 == this.currentIndex) ? 0 : this.currentIndex + 1;      
		// hide all the items
		this.items.each(function(child){ child.hide() });
		// display the next item
		Effect.Appear(this.items[nextIndex]);					
		this.updateNavigation(nextIndex);
		this.currentIndex = nextIndex;
    },

	showItem: function(event) {
		this.stop();			
		var element = event.findElement('a');
		var itemToShow = this.items.find(function(item){ return item.id == element.rel })
		
		// hide all the items
		this.items.each(function(child){ child.hide() });
		Effect.Appear(itemToShow);
		
		// update navigation
		this.navigation.each(function(nav){ nav.removeClassName('current') });
		element.up().addClassName('current');
    
		Event.stop(event);
	},
            
    updateNavigation: function(nextIndex) {
		var current_li = this.navigation[this.currentIndex];
		current_li.removeClassName('current');
		var next_li = this.navigation[nextIndex];
		next_li.addClassName('current');
    }

});