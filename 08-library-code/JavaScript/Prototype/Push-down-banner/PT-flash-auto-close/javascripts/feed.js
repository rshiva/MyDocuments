var huggies = {
	openBanner : function(fBanner,fHeight){	
		var el = $(fBanner);		
		var effects = [];
		var scaleDuration = 0.35;
		var options = {
			sync: true,
			scaleFrom: 1,
			scaleContent: false,
			transition: Effect.Transitions.sinoidal,
			scaleMode: {
				originalHeight: fHeight + 10
			},
			scaleX: false,
			scaleY: true
		};
		effects.push(new Effect.Scale(el, 100, options));
		new Effect.Parallel(effects, {
			duration: scaleDuration,
			queue: {
				position: 'end',
				scope: 'accordionAnimation'
			},
			beforeStart: function() {
				el.setStyle({ visibility: "visible" });
			},
			afterFinish: function() {
				el.setStyle({ height: "190px" });
			}
		});
	},

        collapsBanner : function(fBanner,fHeight){
            	var el = $(fBanner);
		var effects = [];
		var scaleDuration = 0.35;
		var options = {
			sync: true,
			scaleFrom: 100,
			scaleContent: false,
			transition: Effect.Transitions.sinoidal,
			scaleMode: {originalHeight: fHeight},
			scaleX: false,
			scaleY: true
		};
                effects.push(new Effect.Scale(el, 0, options));
                new Effect.Parallel(effects, {
			duration: scaleDuration,
			queue: {
				position: 'end',
				scope: 'accordionAnimation'
			},
			beforeStart: function() {
				el.setStyle({ visibility: "visible" });
			},
			afterFinish: function() {
				el.setStyle({ height: "0px" });
			}
		});
        },

	closeBanner : function(fBanner) {
		$(fBanner).setStyle({display:'none'});
	},
	
	onFlashLoaded : function(){
		return (true);
	}

}
  	
function make_flash(){
	
	var vars = {};
	var params = {bgcolor: '#fff', menu: 'false', wmode: 'transparent', allowScriptAccess: 'always'};
	var attributes = {id: 'openx_wide_zone', name:'openx_wide_zone'};
		
	swfobject.embedSWF('960x180_au.swf', 'openx_wide_zone', '960', '180', '10.0.0.0', 'swfobject/expressinstall.swf', vars, params, attributes );
}

Event.observe(window, 'load', make_flash);
