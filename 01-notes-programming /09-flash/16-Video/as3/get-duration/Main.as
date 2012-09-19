package {
	import flash.events.MouseEvent;
	import flash.media.SoundTransform;
    import flash.media.Video;
    import flash.net.NetConnection;
    import flash.net.NetStream;
    import flash.events.NetStatusEvent;
    import flash.display.Sprite;
    import flash.events.Event;
	import flash.text.TextField;

    public class Main extends Sprite {
        private var _connection:NetConnection;
		private var _stream:NetStream;
        private var _video:Video;
		private var _client:Object;
		private var _playTime:TextField;
        
        public function Main(  ) {
			_connection = new NetConnection(  );
			_connection.connect(null);
			_stream = new NetStream(_connection);
            
			_client= new Object(  );
			_client.onMetaData = function(metadata:Object):void {
				// get the duration of the video
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
        }
    }

}
