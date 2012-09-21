var Dropdown = Class.create();

Dropdown.prototype = {
    // set default properties
    active: null,
    timeout: null,
    _option_defaults: {
        timeout: 500,
        fade_duration: 0.25,
        menu_selector: 'ul',
        control_selector: 'li'
    },

    initialize: function(container, options) {
        if (!$(container)) { throw(container+" doesn't exist!"); return false; }

        this.container = container; 
        this.options = this._set_options(options); // check options, if some key properties missing, use properties in this._option_defaults
        this.controls = $$("#"+this.container+" "+this.options.control_selector); // get all li in container, whatever which level
        // console.log(this.controls);

        for(var i = 0; i < this.controls.length; i++) {
            var node = this.controls[i];
            Event.observe(node, 'mouseover', this.show_menu.bind(this, node)); 
        }
    },

    show_menu: function(node) {
        if (this.active == node) return; // if mouseover same li
        if (this.active != null) this.hide_menu(this.active, false); // if no active li, hide dropdown immediatly

        // check if there is a ul under node
        if (node.select(this.options.menu_selector).length > 0) {
            // show drop down
            node.firstDescendant().addClassName('active'); // make the alink in node as active
            var menu = node.select(this.options.menu_selector).first(); // get the first ul under node. the first() is an Array method
            menu.show(); // show ul hide by inline css
            menu.style.zIndex = 9999; 

            if(node.select('.content').first()) {
                console.log("call");
                active_id=node.select('.content').first().id;
                active_class='active-'+active_id;
                if($(this.container).parentNode) { $(this.container).parentNode.addClassName(active_class); }
            }

            this.active = node; //
            this.setup_timeout_events();
        }
    },
  
    hide_menu: function(node, grace) {
        if (!node) return false;

        var menu = node.select(this.options.menu_selector).first();

        if (grace) {
            new Effect.Fade(menu, { duration: this.options.fade_duration });
        } else {
            menu.hide();
        }

        node.firstDescendant().removeClassName('active');

        if(node.select('.content').first()) {
            active_id=node.select('.content').first().id;
            active_class='active-'+active_id;
            if($(this.container).parentNode) {  $(this.container).parentNode.removeClassName(active_class); }
        }

        this.remove_timeout_events();
        if (this.active == node) this.active = null;
    },
  
    setup_timeout_events: function() {
        dropdown = this.active.select(this.options.menu_selector).first(); 
        // console.log(dropdown);
        Event.observe(dropdown, 'mouseout', this.start_timeout.bind(this)); 
        Event.observe(dropdown, 'mouseover', this.stop_timeout.bind(this)); 
        Event.observe(this.active, 'mouseout', this.start_timeout.bind(this));
        Event.observe(this.active, 'mouseover', this.stop_timeout.bind(this));
    },
  
    remove_timeout_events: function() {
        dropdown = this.active.select(this.options.menu_selector).first()
        Event.observe(dropdown, 'mouseout', this.start_timeout.bind(this));
        Event.observe(dropdown, 'mouseover', this.stop_timeout.bind(this));
        Event.observe(this.active, 'mouseover', this.stop_timeout.bind(this));
    },
  
    start_timeout: function() {
        if (this.timeout != null) return; 
        this.timeout = this.set_timeout(this); 
    },
  
    stop_timeout: function() {
        if (this.timeout != null) window.clearTimeout(this.timeout);
        this.timeout = null;
    },
  
    set_timeout: function() {
        return window.setTimeout(function() {this.hide_menu(this.active, true)}.bind(this), this.options.timeout);
    },
  

    // check options, if some key properties missing, use properties in this._option_defaults
    _set_options: function(options) {
        if(typeof options != "undefined") {
            var results = {};
            for(option in this._option_defaults) { // use for...in to get object property name in _option_defaults
                if(typeof options[option] == "undefined") {
                    results[option] = this._option_defaults[option]; 
                } else {
                    results[option] = options[option];
                }
            }
            return results;
        } else {
            return this._option_defaults;
        }
    }
  
}