// dom loaded
document.observe('dom:loaded', function() {
	// main loop
	var carousel = new Carousel('carousel-floral', $('carousel'), { offsetX:0, offsetY:-100 });
	
	document.observe('carousel:change_category', function(event) {
		carousel.changeCategory(event.memo.id);
	});
	
	document.observe('carousel:change_image', function(event) {
		carousel.changeImage(event.memo.id);
	});
});


// rotate carousel
var Carousel = function (catagory, dom, opts) {
	// ------------------------------------------------------------------
	// public
	this.dom = dom;
	opts = opts || {};
	
	// ------------------------------------------------------------------
	// private vars
	var currentImageID;
	var currentCategory = catagory;
	var allImages = dom.select('.images li'); // li contains product image
	var arrows = dom.select('#carousel-direction a'); // arrow btns
	var links = dom.select('#carousel-menu a'); // top nav btns
	
	var indicators = $('carousel-indicators');
	
	var centre = {x:dom.getWidth()/2+opts.offsetX,y:dom.getHeight()/2+opts.offsetY};
	var radius = {x:dom.getWidth()/2-150, y:25};
	
	var maxNumDisplay = 3;
	var speed = .2;
	var self = this;
	
	var images;
	var imagesOnDisplay;
	var imagesOrder;
	var imageRect;
	var rotation;
	var loopToken;
	
	// ------------------------------------------------------------------
	// public methods
	this.rotateItems = function (direction,steps) {
		// set default value
		steps = steps||1;
		direction = direction||1;
		
		// set local vars
		var velocity = speed*direction;
		var num = images.length;
		var numOnDisplay = maxNumDisplay;
		var	total = 360/numOnDisplay; // *steps;
		var pos = {x:0,y:0};
		
		// clear previous interval
		clearTimeout(loopToken);
		
		// update current ID
		currentImageID = currentImageID!=undefined ? currentImageID+(direction*-steps) : 0;
		currentImageID = currentImageID > num-1 ? currentImageID-num : (currentImageID < 0 ? num+currentImageID : currentImageID);
		
		// highlight indicator
		document.fire('carousel:image_changed', {id:currentImageID});
		(function(){
			if (indicators) {
				var item = indicators.select('li');
				item.invoke('removeClassName','active');
				item[currentImageID].addClassName('active');
			}
		})();
		
		// update image order
		imagesOrder = images.collect(function(o,i) { return i; });
		imagesOrder = imagesOrder.splice(currentImageID,imagesOrder.length-currentImageID).concat(imagesOrder); // add currentID to beginning of imagesOrder
		
		// extract images to display based on max number of items to display
		imagesOnDisplay = (function() {
			var ids = imagesOrder.slice(0, Math.min(maxNumDisplay, images.length)-1).concat(imagesOrder.last()); // show first a few and last image index on imagesOrder
			var newImagesOnDisplay = ids.collect(function(o){ return images[o]; });; //get display images
			var itemsWillDisappear = imagesOnDisplay.reject(function(o){ return newImagesOnDisplay.indexOf(o)!=-1; }).invoke('hide');
			return newImagesOnDisplay;
		})();
		rotation = (direction<0?-30:90)-Math.round(360/imagesOnDisplay.length);
		
		// console.log(imagesOnDisplay.collect(function(o){ return parseFloat(o.down('a').innerText); }));
		
		// perform loop
		(function loop () {
			var sin,cos,css,w,h,baseW,baseH,persp,angle,img;
			var incre = velocity*total;
			var container;
			rotation += incre;
			for (var i=0; i<numOnDisplay; i++) {
				container = imagesOnDisplay[i];
				if (!container) continue;
				img = container.down('img');
				angle = 360*(i/numOnDisplay) + rotation;
				sin = Math.sin(angle*Math.PI/180); cos = Math.cos(angle*Math.PI/180);
				persp = .3*sin + .7;
				
				if (container==images[currentImageID]) {
					baseW = imageRect.width*1.5; baseH = imageRect.height*1.5;
				} else {
					baseW = imageRect.width; baseH = imageRect.height;
				}
				
				w	= persp*baseW;
				h	= persp*baseH;
				pos.x = centre.x + radius.x*cos;
				pos.y = centre.y + radius.y*sin;
				css = { 
					top: pos.y+'px', left: pos.x+'px',
					opacity: persp, 
					zIndex: Math.round(sin*numOnDisplay)+500,
					width: w+'px', height: h+'px', lineHeight: h+'px',
					marginLeft: (-w/2)+'px'
				};
				container.show().setStyle(css);
				
				if (!img || img.getWidth()==0) {
					continue;
				} else if (img.getStyle('width')!='100%'||img.getStyle('height')!='100%') {
					img.setStyle((img.getWidth()>img.getHeight()?{'width':'100%'}:{'height':'100%'}));
				}
			}
			total -= Math.abs(incre);
			
			if(total <= .1) {
				loopToken = undefined;
				return false; 
			}
			loopToken = setTimeout(function() { loop(); }, 30);
		})();
	};
	
	this.changeImage = function(id) {
		var num = imagesOnDisplay.length;
		var diff;
		
		if (id == currentImageID) return;
		
		// exceptions
		var currentImage = images[currentImageID]; //currentImage
		var image = images[id]; // image need turn to
		
		if (!currentImage || !image) throw new Error('Cannot change to an undefined image - currentImageID: '+currentImageID+' id:'+id);
		
		// calculate positionedOffset().left to detect the clicked images is on right/left side of the currentImage
		if (image.positionedOffset().left < currentImage.positionedOffset().left) {
			// at left
			diff = -imagesOrder.indexOf(id);
		} else {
			// at right
			diff = imagesOrder.slice().reverse().indexOf(id)+1;
		}
		
		// determine direction
		var steps = Math.abs(diff);
		var dir = diff / steps;
		this.rotateItems(dir,steps);
	};
	
	this.changeCategory = function(name) {		
		// select holder, exit if there's no image holder
		imagesHolder = $$('#category-'+name+'.images')[0]; //get current images container	
		if (!imagesHolder) throw new Error('Images are not in DOM. Please check your code.');
		
		// reset active images (hide all images)
		this.dom.select('.images.active').each(function(o,i){ 
			o.removeClassName('active');
			o.select('li').invoke('writeAttribute', {'style':''}); 
		});
		
		// new set of images
		clearTimeout(loopToken); //kill timer
	  	images = imagesHolder.select('li').invoke('hide'); //all images in container
		currentImageID = undefined; 
		imagesHolder.addClassName('active');
		
		// new set of position indicators
		// according the image in container, rebuild the indicator at bottom
		if (indicators) {
			var w = 0;
			var fragment = document.createDocumentFragment(); //DocumentFragment is a DOM node and part of DOM tree
			images.each(function(o,i) {
				var id = i;
				var anchor = new Element('a', {'href':'#'});
				anchor.observe('click',function(event) {
					event.preventDefault ? event.preventDefault() : event.returnValue = false;
					document.fire('carousel:change_image', { id:id });
				});
				fragment.appendChild(new Element('li').insert(anchor.update(i)));
			});
			indicators.update('').appendChild(fragment);
			indicators.select('li').each(function(o,i){ w += o.getWidth() + parseFloat(o.getStyle('margin-right')); });
			indicators.setStyle({'width':''}).setStyle({'width':w+'px'});
		}
		
		// reset
		imagesOrder = images.collect(function(o,i) { return i; }); //array with all images'index
		imagesOnDisplay = [];
		imageRect = { width:images[0].getWidth(), height:images[0].getHeight() };
		
		// do a initial rotation
		this.rotateItems();
		
		// links
		var container = links[0].up('.nav');
		container.select('.active').invoke('removeClassName', 'active');
		container.down('.'+name).addClassName('active');
		// for IE css rounded corner (PIE.js)
		if (window.PIE) {
			container.select('li a').each(function(o) {
					PIE.detach(o);
					PIE.attach(o);
			});
		}
	};
	
	// ------------------------------------------------------------------
	// main
	// ------------------------------------------------------------------
	
	// add listener to all li contains product image
	allImages.each(function(o) {
		o.down('a').observe('click', function(event, currentTarget) {
			event.preventDefault ? event.preventDefault() : event.returnValue = false; // stop dom event
			var id = currentTarget.up().childElements().indexOf(currentTarget); //get index of clicked li
			document.fire('carousel:change_image', { id:id });
		}.bindAsEventListener(this,o));
	});
	
	// add listener to arrow btns
	arrows.each(function(o) {
		o.observe('click', function(event) { event.preventDefault ? event.preventDefault() : event.returnValue = false; });
		if (o.hasClassName('back')) o.observe('mouseup', function(event) { self.rotateItems(1); });
		if (o.hasClassName('forward')) o.observe('mouseup', function(event) { self.rotateItems(-1); });
	});
	
	// add listener to top nav btns
	links.each(function(o) {
		o.observe('click', function(event, currentTarget) {
			event.preventDefault ? event.preventDefault() : event.returnValue = false;
			var id = currentTarget.href.split('#')[1]; // get attribute from currentTarget.href
			document.fire('carousel:change_category', { id:id });
		}.bindAsEventListener(this,o));
	});
	
	// initial
	this.changeCategory('floral');
};