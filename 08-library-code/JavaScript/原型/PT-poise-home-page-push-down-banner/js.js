// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var PoiseOverlay = Class.create({
	
	initialize: function(overlay_id, page_id, autoclose) {						
		this.overlay_item = $(overlay_id);
		this.page_id = page_id;
		this.cookie_name = this.page_id+"_"+overlay_id+"_hide";
		this.autoclose = autoclose || true;
		
		this.close_link = $$("#"+overlay_id+" span.close");
		this.close_link.invoke('observe', 'click', this.close.bind(this));
		
		// method from cookie helper
		// if this.cookie_name in the cookie, will get true. otherwise will get null
		var hide_overlay = readCookie(this.cookie_name);
		
		// as if hide_overlay = null, will show banner
		if(!(hide_overlay=="true")) { 
			this.show(this.autoclose); 
		}			
		
		_self = this;
		Event.observe(overlay_id+"_trigger", 'click', function(event) {
			event.stop();
			_self.show(false);
		});
	},
	
	show: function(autohide) {
		_self = this;
		Effect.BlindDown(this.overlay_item, { duration: 1.0 });	
		if(autohide==true) {
			setTimeout('_self.close()', 5000)
		}
	},
	
	close: function() {
		Effect.BlindUp(this.overlay_item, { duration: 1.0 });		
		
		// method from cookie helper
		createCookie(this.cookie_name, true, 1);
	}
	
});