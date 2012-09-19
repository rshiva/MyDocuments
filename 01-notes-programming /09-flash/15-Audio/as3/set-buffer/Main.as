package 
{
	import flash.display.*;
    import flash.media.Sound;
	import flash.media.SoundLoaderContext;
    import flash.net.URLRequest;
    import flash.events.*;

    public class Main extends Sprite {
        
        public function Main(  ) {
			var _sound:Sound = new Sound();
			var _req:URLRequest = new URLRequest("audio/test.mp3");
			
			// set buffer to 5 seconds
			// default is 1 second
			var buffer:SoundLoaderContext = new SoundLoaderContext(5000);
			
			_sound.load(_req,buffer);
			_sound.play();
        }
    }    
}
