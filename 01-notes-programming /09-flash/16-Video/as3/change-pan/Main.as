package {
	import flash.events.MouseEvent;
	import flash.media.SoundTransform;
    import flash.media.Video;
    import flash.net.NetConnection;
    import flash.net.NetStream;
    import flash.events.NetStatusEvent;
    import flash.display.Sprite;
    import flash.events.Event;

    public class Main extends Sprite {
        private var _connection:NetConnection;
		private var _stream:NetStream;
        private var _video:Video;
		private var _client:Object;
		private var _soundTransform:SoundTransform = new SoundTransform();
		private var _btnL:Sprite;
		private var _btnR:Sprite;
        
        public function Main(  ) {
			_connection = new NetConnection(  );
			_connection.connect(null);
			_stream = new NetStream(_connection);
            
			_client= new Object(  );
			_client.onMetaData = function(metadata:Object):void {
				trace(metadata.duration);
				trace(metadata.width);
				trace(metadata.height);
			};
			_stream.client = _client;

			_video = new Video(293, 165);
			_video.x = _video.y = 100;
			
			_video.attachNetStream(_stream);
			addChild(_video);
			_stream.play("video/video1.flv");
			
			// create two sprite working as button
			_btnL = new Sprite();
			_btnL.graphics.beginFill(0x333333);
			_btnL.graphics.drawRect(100, 285, 100, 50);
			_btnL.graphics.endFill();
			addChild(_btnL);
			
			_btnR = new Sprite();
			_btnR.graphics.beginFill(0x333333);
			_btnR.graphics.drawRect(293, 285, 100, 50);
			_btnR.graphics.endFill();
			addChild(_btnR);
			
			// add pan function to button
			_btnL.addEventListener(MouseEvent.CLICK, panLeft);
			_btnR.addEventListener(MouseEvent.CLICK, panRight);
        }
		
		// change video sound pan
		private function panLeft(event:MouseEvent):void {
			_soundTransform.pan = -1;
			_stream.soundTransform = _soundTransform;
		}
			
		private function panRight(event:MouseEvent):void {
			_soundTransform.pan = 1;
			_stream.soundTransform = _soundTransform;
		}
    }

}
