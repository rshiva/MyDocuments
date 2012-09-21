/* <![CDATA[ */
function nav(c, config){
	this.config = config || {speed: 10, num: 2};
	this.container = (typeof(c)=="object") ? c : document.getElementById(c);
	this.lineHeight = this.container.offsetHeight;
	this.scrollTimeId = null;
	var _this = this;
	this.__construct = function (){
		var inner,el,href;
		inner = _this.container.childNodes[0].innerHTML;
		href = _this.container.childNodes[0].href;
		el = document.createElement("a");
		el.innerHTML = inner;
		el.href = href;
		el.className = 'hover';
		_this.container.appendChild(el);
		//×¢²áÊÂ¼þ
		_this.container.onmouseover = function (){_this.start()};
		_this.container.onmouseout  = function (){_this.end()};
	}();
	this.start = function (){
		_this.clear();
		_this.scrollTimeId = setTimeout(function(){_this.scrollUp();}, _this.config.speed);
	};
	this.end = function (){
		_this.clear();
		_this.scrollTimeId = setTimeout(function(){_this.scrollDown();}, _this.config.speed);
	};
	this.scrollUp = function (){
		var c = _this.container;
			
		if(c.scrollTop >= _this.lineHeight){c.scrollTop = _this.lineHeight;return;}
		c.scrollTop += _this.config.num;
		_this.scrollTimeId = setTimeout(function(){_this.scrollUp();}, _this.config.speed);
	};
	this.scrollDown = function (){
		var c = _this.container;
		if(c.scrollTop <= 0){c.scrollTop = 0;return;}
		c.scrollTop -= _this.config.num;
		_this.scrollTimeId = setTimeout(function(){_this.scrollDown();}, _this.config.speed);
	};
	this.clear = function (){clearTimeout(_this.scrollTimeId)};
}
(function(){
	var container = document.getElementById('nav');
	var el_li = container.getElementsByTagName('li');
	var arr = [];
	for( var i = 0; i < el_li.length; i++){
		if(el_li[i].className == 'on') continue;
		arr[i] = new nav(el_li[i], {speed: 10, num: 4});
	}
})();
/* ]]> */
