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
            // add enter frame event to trace sound play
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
            
			// create a sound object
			_sound = new Sound(new URLRequest("audio/test.mp3"));
            
			// create a sound channel object
			_channel = _sound.play(  );
        }
        
        public function onEnterFrame(event:Event):void
        {
            // parameter for trace bar
			var barWidth:int = 200;
            var barHeight:int = 5;
            
			// set parameter by sound object
            var loaded:int = _sound.bytesLoaded;
            var total:int = _sound.bytesTotal;
            var length:int = _sound.length;
            
			// set parameter by sound channel object
			var position:int = _channel.position;
            
            // Draw a background bar
            graphics.clear(  );
            graphics.beginFill(0xe0e0e0);
            graphics.drawRect(10, 10, barWidth, barHeight);
            graphics.endFill(  );

            if(total > 0) {
                // The percent of the sound that has loaded
                var percentBuffered:Number = loaded / total;

                // Draw a bar that represents the percent of the sound that has loaded
                graphics.beginFill(0x005826); // in green
                graphics.drawRect(10, 10, barWidth * percentBuffered, barHeight);
                graphics.endFill(  );
                
                // Correct the sound length calculation
				// the length will change continuely, untill all data had been loaded
				// so length=percentBufferef 
                length /= percentBuffered;
                
                // The percent of the sound that has played
                var percentPlayed:Number = position / length;
				
                // Draw a bar that represents the percent of the sound that has played
                graphics.beginFill(0x9e0b0f); // red
                graphics.drawRect(10, 10, barWidth * percentPlayed, barHeight);
                graphics.endFill(  );
            }
        }
    }    
}
