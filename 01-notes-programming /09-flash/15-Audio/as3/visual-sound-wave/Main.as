package 
{
	import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.media.Sound;
    import flash.media.SoundChannel;
	import flash.media.SoundMixer;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    
        
    public class Main extends Sprite {
        private var _sound:Sound;
        private var _channel:SoundChannel;
        private var _spectrumGraph:BitmapData;
                
        public function Main(  ) {
            // Create bitmap for spectrum display
            _spectrumGraph = new BitmapData(256,60,true,0x00000000);
            var bitmap:Bitmap = new Bitmap(_spectrumGraph);
            addChild(bitmap);
            bitmap.x = 10;
            bitmap.y = 10;
			
            // listen to enter frame event to draw animation
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
            _sound = new Sound(new URLRequest("audio/test.mp3"));
            _channel = _sound.play(  );
        }
        
        public function onEnterFrame(event:Event):void
        {
            // Create the byte array and fill it with data
            var spectrum:ByteArray = new ByteArray(  );
            SoundMixer.computeSpectrum(spectrum);
            
            // Clear the bitmap
            // draw background
			_spectrumGraph.fillRect(_spectrumGraph.rect,0xff000000);
            
            // Create the left channel visualization
            // draw the curve from left to right pixel by pixel
			for(var i:int=0;i<256;i++) {
                _spectrumGraph.setPixel32(i, 20 + spectrum.readFloat(  ) * 20, 0xff9e0b0f);
            }
            
            // Create the right channel visualization
			// draw the curve from left to right pixel by pixel
            for(var n:int=0;n<256;n++) {
                _spectrumGraph.setPixel32(n,40 + spectrum.readFloat(  ) * 20, 0xff005e20);
            }
        }       
    }

}
