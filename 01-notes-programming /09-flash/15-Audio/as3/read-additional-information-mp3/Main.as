package 
{
	import flash.display.*;
    import flash.media.Sound;
    import flash.net.URLRequest;
    import flash.events.*;
	import flash.text.TextField;
    
    public class Main extends Sprite {
        private var _sound:Sound;
		
        public function Main(  ) {
			_sound = new Sound(new URLRequest("audio/test.mp3"));
            _sound.addEventListener(Event.ID3, outPutInformation);
            // _sound.play(  );
        }
		
		private function outPutInformation(event:Event):void {
			var id3Display:TextField = new TextField(  );
            addChild(id3Display);
            id3Display.x = 10;
            id3Display.y = 20;
            id3Display.width = 200;
            id3Display.height = 200;
            id3Display.background = true;
            id3Display.multiline = true;
            id3Display.wordWrap = true;

            // Add some info about the song to the text field
            id3Display.appendText(_sound.id3.songName + "\n");
            id3Display.appendText(_sound.id3.artist + "\n");
            id3Display.appendText(_sound.id3.album + "\n");
            id3Display.appendText(_sound.id3.year + "\n");  
		}
    }    
}
