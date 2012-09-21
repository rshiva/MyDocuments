		window.addEvent('domready', function(){
			var scroll = new Fx.Scroll('scrollwrapper', {
				wait: false,
				duration: 1500,
				offset: {'x': 0, 'y': 0},
				transition: Fx.Transitions.Quad.easeInOut
			});
			
			//Scroll to bottom left
			window.addEvent('domready', function(){
			scroll.toElement('bottomleftwrapper');
			});
			
			//Css change
			var style_1, style_2;
			 
			/* Style 1 */
			$('s1').addEvent('click', function(e) {
				e = new Event(e).stop();
			 
				if (style_1) style_1.remove();
				new Asset.css('http://www.nofrks.com/css/style.css', {id: 'style1'});
				style_1 = $('style1');
			 
				<!--$('log').setHTML('<a href="css/style.css">style1.css<\/a><\/span>');-->
			});
			 
			/* Style 2 */
			$('s2').addEvent('click', function(e) {
				e = new Event(e).stop();
			 
				if (style_2) style_2.remove();
				new Asset.css('http://www.nofrks.com/css/style1.css', {id: 'style2'});
				style_2 = $('style2');
			 
				<!--$('log').setHTML('<a href="css/style1.css">style2.css<\/a><\/span>');-->
			});
		
			
			$('linkHome').addEvent('click', function(event) {
				event = new Event(event).stop();
				scroll.toElement('bottomleftwrapper');
			});
			
			$('linkPack').addEvent('click', function(event) {
				event = new Event(event).stop();
				scroll.toElement('bottomrightwrapper');
			});
			
			$('linkPortfolio').addEvent('click', function(event) {
				event = new Event(event).stop();
				scroll.toElement('toprightwrapper');
			});
			
			$('linkContact').addEvent('click', function(event) {
				event = new Event(event).stop();
				scroll.toElement('topleftwrapper');
			});
			
			// middle wrappers currently not in use - to enable remove comments
			//$('linkMiddleleft').addEvent('click', function(event) {
			//	event = new Event(event).stop();
			//	scroll.toElement('middleleftwrapper');
			//});
			//$('linkMiddleright').addEvent('click', function(event) {
			//	event = new Event(event).stop();
			//	scroll.toElement('middlerightwrapper');
			//});
			
		}); 
		
			window.addEvent('domready', function(){
			var scroll = new Fx.Scroll('billboardscrollwrapper', {
				wait: false,
				duration: 500,
				offset: {'x': 0, 'y': 0},
				transition: Fx.Transitions.Cubic.easeInOut
			});
			
			//Scroll to intro packet
			window.addEvent('domready', function(){
			scroll.toElement('billboardintrotext');
			});
			
			// Packets
			$('billboardintro').addEvent('click', function(event) {
				event = new Event(event).stop();
				scroll.toElement('billboardintrotext');
			});
			$('billboardpack1').addEvent('click', function(event) {
				event = new Event(event).stop();
				scroll.toElement('paket1');
			});
			$('billboardpack2').addEvent('click', function(event) {
				event = new Event(event).stop();
				scroll.toElement('paket2');
			});
			$('billboardpack3').addEvent('click', function(event) {
				event = new Event(event).stop();
				scroll.toElement('paket3');
			});
			$('billboardpack4').addEvent('click', function(event) {
				event = new Event(event).stop();
				scroll.toElement('paket4');
			});
			
			
			//--language chooser			 
			//var mySlide2 = new Fx.Slide('languages', {mode: 'horizontal'});
			 
			 
			//$('toggle').addEvent('click', function(e){
			//	e = new Event(e);
			//	mySlide2.toggle();
			//	e.stop();
			//});
			
			////toggle languages
			//window.addEvent('domready', function(){
			//	mySlide2.toggle();
			//});
			 
			
			// Portfolio AJAX request
			
			// Portfolio
			$ES('a', 'clients').addEvent('click', function(e) {
			e = new Event(e).stop();
		 	
			var url = this;
		 
			new Ajax(url, {
				method: 'post',
				update: $('portfolio_content')
			}).request();
			});
			
		}); 
		