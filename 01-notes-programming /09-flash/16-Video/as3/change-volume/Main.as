package {
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
		private var _soundTransform:SoundTransform;
        
        public function Main(  ) {
			_connection = new NetConnection(  );
			_connection.connect(null);
			_stream = new NetStream(_connection);
            
			_client= new Object(  );
			_client.onMetaData = function(metadata:Object):void {
				// get the information for metadata (flv file)
				trace(metadata.duration);
				trace(metadata.width);
				trace(metadata.height);
			};
			_stream.client = _client;

			_video = new Video(293, 165);
			_video.x = _video.y = 100;
			
			// create sound transform object
			_soundTransform = new SoundTransform();
			
			// set volume for the soundtransform object
			_soundTransform.volume = 0.5;
			
			// assign sound transform object to the stream object's sound transform property 
			_stream.soundTransform = _soundTransform;
			
			_video.attachNetStream(_stream);
			addChild(_video);
			_stream.play("video/video1.flv");
        }
    }

}
