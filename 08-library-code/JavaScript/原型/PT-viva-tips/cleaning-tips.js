document.observe('dom:loaded', function() {
	var currentSlide = 0;
	var arrows = $$('.button'); // left and right buttons
	var slides = $$('.area'); // sections
	var tabs = $$('.nav li'); // nav buttons
	var hlTabArrow = new Element('span', {'class':'arrow'}); // nav flag
	var triggers = $$('.area .trigger'); // tips button in each section
	var fadeEffects = {};
	var isAnimating = false;
	
	function toggleTab (newSlide) {
		tabs[currentSlide].removeClassName('active'); // change state for current btn
		tabs[newSlide].addClassName('active'); // change state for new btn
		tabs[newSlide].insert({top:hlTabArrow}); // add flag for new btn
	}
	
	function changeSlide (newSlide) {
		// if newSlide == currentSlide, stop
		// if newSlide <0, stop
		// if animation is playing, stop
		if (newSlide == currentSlide || newSlide < 0 || isAnimating) return;
		
		// if newSlide > currentSlide, right to left
		// if newSlide < currentSlide, left to right
		var direction = newSlide > currentSlide ? 'right-to-left' : 'left-to-right';
		
		var animateTarget;
		var animateTargetDestPos;
		var newSlideInitPos;
		var width = slides[currentSlide].getWidth();
		
		// 
		if (direction == 'right-to-left') {
			// right to left
			animateTarget = slides[currentSlide];
			animateTargetDestPos = -width;
			newSlideInitPos = 0;
		} else {
			// left to right
			animateTarget = slides[newSlide];
			animateTargetDestPos = 0;
			newSlideInitPos = -width;
		}
		
		new Effect.Morph(animateTarget, {style:'margin-left:'+animateTargetDestPos+'px', duration:0.6,
			beforeStart:function() { 
				isAnimating = true;
				slides[newSlide].setStyle({marginLeft:newSlideInitPos+'px'}); // position new area
				slides[newSlide].removeClassName('hidden').show(); // show new area
				slides[newSlide].down('ul').setStyle({opacity:0}); // hide tip btns in new area
				slides[currentSlide].down('ul').fade({duration:.3}); // hide tip btns in current area

				toggleTab(newSlide);
			},
			afterFinish:function() { 
				isAnimating = false; 
				slides[currentSlide].hide(); // hide current srea 
				slides[newSlide].down('ul').appear({duration:.3}); // show tip btns in current area
				
				// set new index
				currentSlide = newSlide;
			}
		});
	}
	
	var buttonClicked = function (event, currentTarget) {
		var newSlide = 0; //reset nnewSlide
		
		// the logicl here will make the scrolling stop on first ot last section
		if (currentTarget.hasClassName('next')) {
			// click next, 
			// if the currentSlice + 1 < slides.length-1 the newSlide=currentSlice + 1, otherwise  newSlide=slides.length-1
			newSlide = Math.min(Math.max(0,currentSlide+1),slides.length-1);
		} else {
			// click previous
			// if currentSlide-1 >0, newSlide=currentSlide-1, otherwise newSlide=0
			newSlide = Math.min(Math.max(0,currentSlide-1),slides.length-1);
		}
		
		changeSlide(newSlide); //change section
		event.preventDefault ? event.preventDefault() : event.returnValue = false; // stop event
	}
	
	var tabClicked = function (event, currentTarget) {
		var tabName = currentTarget.down().innerHTML.toLowerCase();
		var slide = slides.detect(function(slide,index) { return slide.hasClassName(tabName); });
		var newSlide = slides.indexOf(slide);
		
		changeSlide(newSlide);
		event.preventDefault ? event.preventDefault() : event.returnValue = false;
	}
	
	var triggerMouseOver = function (event, currentTarget) {
		var trigger = currentTarget;
		var popup = trigger.next('.popup');
		var area = popup.up('.area');
		var id = popup.identify();
		var x,y=0;
		
		if (fadeEffects[id]) { fadeEffects[id].cancel(); }
		popup.up('li').setStyle({zIndex:1000});
		popup.removeClassName('hidden').setStyle({opacity:0, display:'block'});
		
		// position popups
		var right = popup.positionedOffset().left + popup.getWidth() + popup.up('li').positionedOffset().left;
		if (right > area.getWidth()) {
			trigger.addClassName('right');
			x = trigger.getWidth()-popup.getWidth()-parseInt(popup.getStyle('margin-left'))*2+parseInt(trigger.getStyle('margin-left'));
			
			if (!isNaN(x)) { popup.setStyle({'left':x+'px'}); }
		}
		var bottom = popup.positionedOffset().top + popup.getHeight() + popup.up('li').positionedOffset().top;
		if (bottom > area.getHeight()) {
			y = -trigger.getHeight()-popup.getHeight()-parseInt(popup.getStyle('margin-top'))*2;
			if (!isNaN(y)) { popup.setStyle({'top':y+'px'}); }
		}
		
		fadeEffects[id] = new Effect.Appear(popup, {duration:0.2} );
		// fade other tips
		area.select('.trigger').reject(function(o){ return o==trigger; }).each(function(trigger){
			var id = trigger.identify();
			if (fadeEffects[id]) { fadeEffects[id].cancel(); }
			if (trigger.style.opacity!==undefined) {
				fadeEffects[id] = new Effect.Morph(trigger, { style:'opacity:.3;', duration:.3 });
			}
		});
	}
	
	var triggerMouseOut = function (event, currentTarget) {
		var trigger = currentTarget;
		var popup = trigger.next('.popup');
		var area = popup.up('.area');
		var id = popup.identify();
		
		if (fadeEffects[id]) { fadeEffects[id].cancel(); }
		fadeEffects[id] = new Effect.Fade(popup, {duration:0.3, afterFinish:function() { popup.up('li').setStyle({zIndex:0}); }});
			
		// fade other tips
		area.select('.trigger').reject(function(o){ return o==trigger; }).each(function(trigger){
			var id = trigger.identify();
			if (fadeEffects[id]) { fadeEffects[id].cancel(); }
			if (trigger.style.opacity!==undefined) {
				fadeEffects[id] = new Effect.Morph(trigger, { style:'opacity:1;', duration:.3 });
			}
		});
	}
	
	arrows.each(function(o,i){ o.observe('click', buttonClicked.bindAsEventListener(this,o)); }); // o is the elements in arrow array
	
	tabs.each(function(o,i){ o.observe('click', tabClicked.bindAsEventListener(this,o)); }); // o is the elements in tab array
	
	triggers.each(function(o,i){ o.observe('mouseover', triggerMouseOver.bindAsEventListener(this,o)); });
	triggers.each(function(o,i){ o.observe('mouseout', triggerMouseOut.bindAsEventListener(this,o)); });
	
	toggleTab(currentSlide);
});