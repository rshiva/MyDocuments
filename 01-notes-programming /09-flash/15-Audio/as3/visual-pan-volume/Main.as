package 
{
	import flash.display.Sprite;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.net.URLRequest;
    import flash.events.Event;
    
    public class Main extends Sprite {
        private var _sound:Sound;
        private var _channel:SoundChannel;
        
        public function Main(  ) {
            
			// listen to enter frame event to draw animation
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
            
			// create sound object
			_sound = new Sound(new URLRequest("audio/test.mp3"));
            
			// create channel object
			_channel = _sound.play(  );
        }
        
        public function onEnterFrame(event:Event):void
        {
            // read volume from left and right channel
			var leftLevel:Number = _channel.leftPeak * 100;
            var rightLevel:Number = _channel.rightPeak * 100;
            
			// draw animation
			graphics.clear(  );
            graphics.beginFill(0xcccccc);
            graphics.drawRect(10, 10, leftLevel, 10);
            graphics.endFill(  );
            graphics.beginFill(0xcccccc);
            graphics.drawRect(10, 25, rightLevel, 10);
            graphics.endFill(  );
            
        }       
    }

}
