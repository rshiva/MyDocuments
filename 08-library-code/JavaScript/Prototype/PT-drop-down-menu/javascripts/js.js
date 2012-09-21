var dropDown=Class.create({
    initialize:function(container,options){
        this.active=null;
        this.timeout=null;
        this.defaultOptions={
            timeout: 500,
            fade_duration: 0.25,
            menu_selector: 'ul',
            control_selector: 'li'
        };

        this.container=container;
        this.options=this.setOptions(options);
        this.controls=$$('#'+this.container+' '+this.options.control_selector);

        // add listener for every li in menu
        for(i=0; i<this.controls.length; i++){
            var node=this.controls[i];
            Event.observe(node,'mouseover',this.showMenu.bind(this,node));
        }
    },

    // check input argument, if property missing, get it from default option
    setOptions:function(options){
        if(typeof options!= "undefined") {
            var results=new Object();
            for(option in this.defaultOptions) {
                if(typeof options[option] == "undefined") {
                     results[option] = this.defaultOptions[option];
                }else{
                    results[option] = options[option];
                }
            }
           return results;
        }else{
           return this.defaultOptions;
        }
    },

    showMenu:function(node){
        if (this.active == node) return;
        if (this.active != null) this.hideMenu(this.active, false);

        // if there is ul in this.active, show it
        if (node.select(this.options.menu_selector).length > 0) {
            node.firstDescendant().addClassName('active');
            var menu = node.select(this.options.menu_selector).first();
            menu.show();
            menu.style.zIndex = 9999;

            /* unknown
            if(node.select('.content').first()) {
            active_id=node.select('.content').first().id;
            active_class='active-'+active_id;
            if($(this.container).parentNode) { $(this.container).parentNode.addClassName(active_class); }
            }
            */

            this.active = node; //
            this.setTimeOutEvents();
        }
    },

    // hide ul accroding flag
    hideMenu:function(node,flag){
        if (!node) return false;

        var menu = node.select(this.options.menu_selector).first();
        if (flag) {
            new Effect.Fade(menu, { duration: this.options.fade_duration });
        } else {
            menu.hide();
        }
        node.firstDescendant().removeClassName('active');
        
        /* unknow
        if(node.select('.content').first()) {
            active_id=node.select('.content').first().id;
            active_class='active-'+active_id;
            if($(this.container).parentNode) {  $(this.container).parentNode.removeClassName(active_class); }
        }
        */

       this.removeTimeOutEvents();
       if (this.active == node) this.active = null;
    },

    // add listener after show ul
    setTimeOutEvents: function() {
        dropdown = this.active.select(this.options.menu_selector).first();
        Event.observe(dropdown, 'mouseout', this.start_timeout.bind(this));
        Event.observe(dropdown, 'mouseover', this.stop_timeout.bind(this));
        Event.observe(this.active, 'mouseout', this.start_timeout.bind(this));
        Event.observe(this.active, 'mouseover', this.stop_timeout.bind(this));
    },

   // add listener after hide ul
   removeTimeOutEvents: function() {
        dropdown = this.active.select(this.options.menu_selector).first()
        Event.observe(dropdown, 'mouseout', this.start_timeout.bind(this));
        Event.observe(dropdown, 'mouseover', this.stop_timeout.bind(this));
        Event.observe(this.active, 'mouseover', this.stop_timeout.bind(this));
    },

    // start tiemout
    start_timeout: function() {
        if (this.timeout != null) return;
        this.timeout = window.setTimeout(function() {this.hideMenu(this.active, true)}.bind(this), this.options.timeout);
    },

    // hide timeout
    stop_timeout: function() {
        if (this.timeout != null) window.clearTimeout(this.timeout);
        this.timeout = null;
    }
})