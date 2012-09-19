package 
{
	import flash.display.Sprite;
    import flash.media.Sound;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.media.SoundChannel;
    
    public class Main extends Sprite {
        private var _sound:Sound;
        private var _channel:SoundChannel;
        private var _playList:Array;      // the list of songs
        private var _index:int = 0;       // the current song

        public function Main(  ) {
            // Create the playlist
            _playList = ["audio/01.mp3", "audio/02.mp3","audio/03.mp3"];
            playNextSong(  );
        }
        
        private function playNextSong(  ):void
        {
            // If there are still songs in the playlist
            if(_index < _playList.length) {
                _sound = new Sound(  );
                _sound.load(new URLRequest(_playList[_index]));
                
				// assign sound object play method to a sound channel object
				_channel = _sound.play(  );
				
                // Add the listener to the channel
				// when sound object finish play. the sound channel object will fire a sound complete event
                _channel.addEventListener(Event.SOUND_COMPLETE,onComplete);
                
				// Increase the counter
                _index++;
            }
        }
        
        public function onComplete(event:Event):void
        {
            playNextSong(  );
        }
	}
}
