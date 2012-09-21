
var AnimatedMenu = Class.create({
    initialize: function(container, interval) {
        this.main_ctn  = $$('#' + container + ' .left-container')[0];
        this.menu_ctn  = $$('#' + container + ' .right-container')[0];
        this.menu_anim = $$('#' + container + ' .animated-menu')[0];
        this.items     = $$('#' + container + ' .item');
        this.active    = this.items.shift();

        var item = this.active.clone(true);
        this.toggle_image(item.select('img.large')[0]);
        this.menu_anim.insert(item);
        this.items.push(item);

        if (this.items.length > 4) {
            // setInterval(this.scroll.bind(this), interval*1000);
            return true;
        } else {
            return false;
        }
    },

    toggle_image: function(image) {
        var to, size;
        if(image.hasClassName('tiny')){
            to   = 'large';
            size = 304;
        }else{
            to   = 'tiny';
            size = 75;
        }
        
        // redefine image attribute
        image.writeAttribute('width', size);
        image.writeAttribute('height', size);
        image.writeAttribute('class', to);
    },

    scroll: function() {
        // left
        this.active = this.items.shift();
        this.menu_ctn.insert({top: this.active});
        new Effect.Move(this.active,{x:this.active.getWidth() * -1,y:0,duration:0.70});
        new Effect.Move(this.menu_anim,{x:0,y:this.active.getHeight() * -1,duration: 0.70})
        this.main_ctn.select('.text')[0].replace(this.active.select('.text')[0].clone(true));

        
        // right
        var image = this.active.select('.tiny')[0].clone();
        this.toggle_image(image);
        this.main_ctn.insert(image);
       new Effect.Move(image,{
            x:image.getWidth() * -1,
            y:0,
            delay: 0.35,
            duration: 0.5,
            beforeStart: function() {image.writeAttribute('style', 'position: absolute; top:0; left:' + image.getWidth() + 'px');},
            afterFinish: this.reset.bind(this)
       });
    },

    reset: function() {
        this.items.push(this.active);
        this.menu_anim.writeAttribute('style', '');
        this.items.invoke('writeAttribute','style', '');
        this.main_ctn.select('.large')[0].remove();
        this.menu_anim.insert(this.active);
    }
});