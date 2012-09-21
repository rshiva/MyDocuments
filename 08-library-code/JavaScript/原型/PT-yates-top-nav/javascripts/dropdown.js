// This has been modified to work with prototype 1.5
// if we upgrade all other scripts in the site to work with prototype 1.6+
// change all occurances of node.getElementsBySelector() with node.select()
// to make this script prototype 1.6+ compatible 

var Dropdown = Class.create();
Dropdown.prototype = {
  active: null,
  timeout: null,

  initialize: function(container, options) {
    
    if (!$(container)) { throw(container+" doesn't exist!"); return false; }
    
    this.container = container;
    this.options = this._set_options(options);    
    this.controls = $$("#"+this.container+" "+this.options.control_selector);
        
    for(var i = 0; i < this.controls.length; i++) {		
      var node = this.controls[i];
      Event.observe(node, 'mouseover', this.show_menu.bind(this, node));
    }
    
  },
  
  show_menu: function(node) {
    if (this.active == node) return;
    if (this.active != null) this.hide_menu(this.active, false);
    
    if (node.getElementsBySelector(this.options.menu_selector).length > 0) {
      node.firstDescendant().addClassName('active');
      
      var menu = node.getElementsBySelector(this.options.menu_selector).first();
    
      menu.setOpacity(1.0);
      menu.show();
      menu.style.zIndex = 9999;      
      
      this.active = node;    
      this.setup_timeout_events(); 
    }   
  },
  
  hide_menu: function(node, grace) {
    if (!node) return false;    
    var menu = node.getElementsBySelector(this.options.menu_selector).first();
    
    if (grace) {
      new Effect.Fade(menu, { duration: this.options.fade_duration });
    } else {
      menu.hide();
    }
  	  	
    node.firstDescendant().removeClassName('active');
    this.remove_timeout_events();  	
    if (this.active == node) this.active = null;    
  },
  
  setup_timeout_events: function() {
    dropdown = this.active.getElementsBySelector(this.options.menu_selector).first()    
    Event.observe(dropdown, 'mouseout', this.start_timeout.bind(this));
    Event.observe(dropdown, 'mouseover', this.stop_timeout.bind(this));
    Event.observe(this.active, 'mouseout', this.start_timeout.bind(this));
    Event.observe(this.active, 'mouseover', this.stop_timeout.bind(this));
  },
  
  remove_timeout_events: function() {
    dropdown = this.active.getElementsBySelector(this.options.menu_selector).first()
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
  
  _option_defaults: {
    timeout: 500,
    fade_duration: 0.25,
    menu_selector: 'ul',
    control_selector: 'li'
  },
  
  _set_options: function(options) {
    if(typeof options != "undefined") {		
      var results = [];
      for(option in this._option_defaults) {
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
