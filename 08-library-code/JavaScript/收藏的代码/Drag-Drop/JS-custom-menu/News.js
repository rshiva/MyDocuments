var News = Class.create();

News.prototype = {
	
	initialize : function () {
		var wc = this;
		wc.parent = null;
		wc.ajax = new CDrag.Ajax;
	},
	
	edit : function (o) {
		alert("这个是扩展类的一个方法，可以从News.js里自己设置，比如现在改变内容为标题");
		o.content.innerHTML = o.title.innerHTML;
	},
	
	load : function (json) {
		var wc = this;
		wc.parent.content.innerHTML = json;
	},
	
	open : function () {
		var wc = this, ajax = wc.ajax;
		wc.parent.content.innerHTML = "loading";
		ajax.send("News.asp?", wc.load.bind(wc));
	}
	
};

News.loaded = true;