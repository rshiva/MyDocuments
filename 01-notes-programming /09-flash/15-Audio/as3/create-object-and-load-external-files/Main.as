package 
{
	import flash.display.*;
    import flash.media.Sound;
    import flash.net.URLRequest;
    import flash.events.*;

    public class Main extends Sprite {
        
        public function Main(  ) {
			var _sound:Sound = new Sound();
			var _req:URLRequest = new URLRequest("audio/test.mp3");
			_sound.load(_req);
			_sound.play();
        }
    }    
}
