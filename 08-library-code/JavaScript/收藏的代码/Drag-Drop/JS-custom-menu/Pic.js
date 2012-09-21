var Pic = Class.create();

Pic.prototype = {
	
	initialize : function () {
		var wc = this;
		wc.parent = null;
		wc.ajax = new CDrag.Ajax;
	},
	
	edit : function (o) {
		alert(o.title.innerHTML);
	},
	
	load : function (json) {
		var wc = this;
		wc.parent.content.innerHTML = '<img width="180" height="100" alt="" src="' + json + '" \/>';
	},
	
	open : function () {
		var wc = this, ajax = wc.ajax;
		wc.parent.content.innerHTML = "loading";
		ajax.send("Pic.asp?", wc.load.bind(wc));
	}
	
};

Pic.loaded = true;