// need work with cookies_helper.js

// need work with cookies_helper.js

var pushDownBanner = Class.create({
	// content: ID for push down banner content
	// openBtn: ID for push down banner open button
	// closeBtn: ID for push down banner close button
	// autoclose: if use auto close
	initialize: function(contentID, openBtn, closeBtn, autoclose) {
		this.bannerContent=$(contentID);
		this.openBtn=$(openBtn);
		this.closeBtn=$(closeBtn);
		this.autoclose=autoclose;
		this.cookieName=contentID+"_hide";
		
		// check if data in cookie. readCookie is the method from cookie helper
		var hideFlag = readCookie(this.cookieName);
		
		
		// if the banner hasn't been show before, show it with auto close
		if(!(hideFlag=="true")) { 
			this.show(true); 
		}
		
		Event.observe(this.closeBtn,"click",this.close.bind(this));
		Event.observe(this.openBtn,"click",this.show.bind(this,this.autoclose));
	},
	
	
	show: function(autohide) {
		Effect.BlindDown(this.bannerContent, { duration: 1.0 });
		
		if(autohide==true) {
			var timeOut=setTimeout(this.close.bind(this), 3000);
		}		
	},
	
	close: function() {
		Effect.BlindUp(this.bannerContent, { duration: 1.0 });
		createCookie(this.cookieName, true, 1);
	}
	
});