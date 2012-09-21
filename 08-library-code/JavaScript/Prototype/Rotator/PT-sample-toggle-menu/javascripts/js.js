var toggleController={
    setFlag:function(flag){
        this.animation=flag;
    },

    toggleContent:function(btn,contentID){
        // console.log(btn);
        // console.log(contentID);
        if(btn.hasClassName('active')){
            // console.log('hiden');
            if(this.animation==undefined||this.animation!=true){
                this.hideContent(btn,contentID);
            }
        }else{
            // console.log('show')
            if(this.animation==undefined||this.animation!=true){
                this.showContent(btn,contentID);
            }
        }
    },

    showContent:function(btn,contentID){
        // console.log('show'+contentID);
        btn.addClassName('active');
        new Effect.SlideDown(contentID,{
            duration:0.5,
            beforeStart: this.setFlag(true),
            afterFinish: this.setFlag(false)
        })
        
    },

    hideContent:function(btn,contentID){
        // console.log('hide'+contentID);
        btn.removeClassName('active');
        new Effect.SlideUp(contentID,{
            duration:0.5,
            beforeStart: this.setFlag(true),
            afterFinish: this.setFlag(false)
        })
    }
};