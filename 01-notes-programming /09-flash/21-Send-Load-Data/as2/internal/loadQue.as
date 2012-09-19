/**
******************************************

	@class: LoadQue Class v1.02
	@author: Kenneth Bunch (krb0723@hotmail.com)
	@usage:
		que = new LoadQue();
		que.addItem("http://www.foo.com/foo.swf", container_mc, "the foo swf");
		que.onItemData = function(iPercent, sID){ trace("ITEM " + sID + " is " + iPercent  + "% loaded"); };
		que.onTotalData = function(iPercent){ trace("TOTAL percent loaded::" + iPercent + "%"); };
		que.onLoad = function(){	trace("COMPLETELY LOADED ALL ASSETS"); };
		que.start();

	IMPLEMENTS
		ASBroadcaster
	
	PUBLIC METHODS
		addItem
		clear
		start

	PRIVATE METHODS
		$preloadNext
		$loadItem
		$onItemData
		$onTotalData

	EVENTS 
		onItemData
		onTotalData
		onLoadError
		onLoad

******************************************
*/
/**
	@class LoadQue
*/
LoadQue = function () {
	this._$que = new Array();
	this._$index = 0;
	this._$currItem = null;
	this._$interval = null;
	this._$startLoadTime = null;
	AsBroadcaster.initialize(this);
	this.addListener(this);
};
/**
	@method (PRIVATE): $preloadNext

	@description
		-  preloads the next item in the que
*/
LoadQue.prototype.$preloadNext = function() {
	this._$currItem = this._$que[this._$index++];
	// monitor load of item
	clearInterval(this._$interval);
	// get start time for loading items
	this._$startLoadTime = getTimer();
	// load item
	this.$loadItem();
	// monitor on interval
	this._$interval = setInterval(this, "$onItemData", 100);
};
/**
	@method (PRIVATE): $onItemData

	@description
		-  handles data as it is received for an item
*/
LoadQue.prototype.$onItemData = function() {
	var item, itemPercent;
	item = (this._$currItem.returnitem == "") ? this._$currItem.item : this._$currItem.returnitem;
	itemPercent = (item.getBytesLoaded()/item.getBytesTotal())*100;
	if (!isNaN(itemPercent)&&isFinite(itemPercent)) {
		this.broadcastMessage("onItemData", itemPercent, this._$currItem.id, item);
	}
	if (item.getBytesTotal() == -1 && (getTimer()-this._$startLoadTime)>7000) {
		this.$onLoad(false);
	}
	if (itemPercent == 100) {
		this.$onLoad(true);
	}
};
/**
	@method (PRIVATE): $onTotalData

	@description
		-  handles data as each item is completely loaded
*/
LoadQue.prototype.$onTotalData = function() {
	var totalPercent;
	// report total percent loaded
	totalPercent = (this._$index/this._$que.length)*100;
	if (!isNaN(totalPercent)) {
		this.broadcastMessage("onTotalData", totalPercent, this._$currItem.item);
	}
};
/**
	@method (PRIVATE): $onLoad

	@description
		-  fired when all data for an item is loaded 
*/
LoadQue.prototype.$onLoad = function(bSuccess) {
	clearInterval(this._$interval);
	//trace(bSuccess + "::onLOAD");
	if (!bSuccess) {
		// report non loaded items
		trace("FAILURE LOADING ASSET");
		this.broadcastMessage("onLoadFailure", this._$currItem.id);
	}
	this.$onTotalData();
	// que next or report completed preload
	if (this._$que.length>(this._$index)) {
		this.$preloadNext();
	} else {
		this.broadcastMessage("onLoad");
	}
};
/**
	@method (PRIVATE): $loadItem

	@description
		-  loads current item into container
*/
LoadQue.prototype.$loadItem = function() {
	if (this._$currItem.item == null) {
		this._$currItem.item = new LoadVars();
	}
	// load item into assigned holder
	if (this._$currItem.url == "_root"){
		this._$currItem.item = _root;
	// load into level
	}else if(typeof this._$currItem.item == "number"){
		var vLevel = this._$currItem.item;
		this._$currItem.item = eval("_level"+vLevel);
		loadMovieNum(this._$currItem.url,vLevel);
	// load into movieclip
	}else if (typeof this._$currItem.item == "movieclip") {
		this._$currItem.item.loadMovie(this._$currItem.url);
	// load a sound
	} else if (this._$currItem.item instanceof Sound) {
		this._$currItem.item.loadSound(this._$currItem.url, false);
	// send and load data
	}else if (this._$currItem.returnitem != "") {
		this._$currItem.item.sendAndLoad(this._$currItem.url,this._$currItem.returnitem,"POST");
	// load data
	}else{
		this._$currItem.item.load(this._$currItem.url);
	}
};
/**
	@method (PUBLIC): addItem

	@param : sUrl
		- url of item to load
	@param : [oTarget, sID]
		- [OPTIONAL] target to load item into OR id to associate with item
	@param : [sID]
		- [OPTIONAL] id to be associated with item
	
	@description
		- adds items to preload into movie
		method is overload and can be passed args in the following combos
		addItem(sUrl); 
		addItem(sUrl, oTarget); 
		addItem(sUrl, sID); 
		addItem(sUrl, oTarget, sID);
*/
LoadQue.prototype.addItem = function(sUrl) {
	var target, idString;
	if (arguments.length<3) {
		target = (typeof arguments[1] != "string") ? arguments[1] : null;
		idString = (typeof arguments[1] == "string") ? arguments[1] : this._$que.length+1;
		returnObj = "";
	} else if (arguments.length == 3){
		target = arguments[1];
		idString = (typeof arguments[2] != null) ? arguments[2] : this._$que.length+1;
		returnObj = "";
	}else if (arguments.length > 3){
		target = arguments[1];
		returnObj = arguments[2];
		idString = (typeof arguments[3] != null) ? arguments[3] : this._$que.length+1;
	}
	this._$que.push({url:sUrl, item:target, returnitem:returnObj, id:idString});
};
/**
	@method (PUBLIC): clear

	@description
	-  clears the que
*/
LoadQue.prototype.clear = function() {
	this._$que = new Array();
	this._$index = 0;
};
/**
	@method (PUBLIC): start

	@description
	-  starts loading the elements of the que
*/
LoadQue.prototype.start = function() {
	this.$preloadNext();
};
/**
	@event (ABSTRACT): onItemData

	@param : iPercent
		- percent of item loaded
	@param : sID
		- id associated with item

	@description
		-  fired as data for an item is received
*/
LoadQue.prototype.onItemData = function(iPercent, sID) {
};
/**
	@event (ABSTRACT): onLoadError

	@param : sID
		- id associated with item

	@description
		-  fired when a qued item fails to load
*/
LoadQue.prototype.onLoadFailure = function(sID) {
};
/**
	@event (ABSTRACT): onItemData

	@param : iPercent
		- percent of item loaded

	@description
		-  fired when a qued item is completely loaded
*/
LoadQue.prototype.onTotalData = function(iPercent) {
};
/**
	@event (ABSTRACT): onLoad

	@description
		-  fired when all qued items are loaded
*/
LoadQue.prototype.onLoad = function() {
};
