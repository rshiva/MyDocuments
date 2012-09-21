
var AnimatedMenu = Class.create({
    initialize: function(container, interval) {
       
        this.menu_ctn  = $$('#' + container + ' .menu-container')[0];
        this.menu_anim = $$('#' + container + ' .animated-menu')[0];
        this.items     = $$('#' + container + ' .item');

        if (this.items.length > 4) {
            // setInterval(this.scroll.bind(this), interval*1000);
            return true;
        } else {
            return false;
        }
    },

    scroll: function() {
        // left
        this.active = this.items.shift();
        this.menu_ctn.insert({top: this.active});
        new Effect.Move(this.active,{x:this.active.getWidth() * -1,y:0,duration:0.70});
        new Effect.Move(this.menu_anim,{
            x:0,
            y:this.active.getHeight() * -1,
            duration: 0.70,
            afterFinish: this.reset.bind(this)
        })
    },

    reset: function() {
        this.items.push(this.active);
        this.menu_anim.writeAttribute('style', '');
        this.items.invoke('writeAttribute','style', '');
        this.menu_anim.insert(this.active);
    }
});