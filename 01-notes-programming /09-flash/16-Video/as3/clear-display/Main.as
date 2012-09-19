package {
	import flash.events.MouseEvent;
	import flash.media.SoundTransform;
    import flash.media.Video;
    import flash.net.NetConnection;
    import flash.net.NetStream;
    import flash.events.NetStatusEvent;
    import flash.display.Sprite;
    import flash.events.Event;
	import flash.filters.*;

    public class Main extends Sprite {
        private var _connection:NetConnection;
		private var _stream:NetStream;
        private var _video:Video;
		private var _client:Object;
		private var _duration:Number;
		
        public function Main(  ) {
			_connection = new NetConnection(  );
			_connection.connect(null);
			_stream = new NetStream(_connection);
            
			_client= new Object(  );
			_client.onMetaData = function(metadata:Object):void {
				// get the duration of the video
				_duration = metadata.duration;
				// trace(metadata.duration);
				// trace(metadata.width);
				// trace(metadata.height);
			};
			_stream.client = _client;
			
			// create video object, the default size is 320x240
			_video = new Video();
			_video.x = _video.y = 100;
			_video.attachNetStream(_stream);
			addChild(_video);
			_stream.play("video/video1.flv");
			
			var _btn:Sprite = new Sprite();
			_btn.graphics.beginFill(0x333333);
			_btn.graphics.drawRect(10, 10, 80, 30);
			_btn.graphics.endFill();
			addChild(_btn);
			
			_btn.addEventListener(MouseEvent.CLICK, clearVideo);
        }
		
		private function clearVideo(event:MouseEvent):void {
			_stream.close();
			
			// can use clear method
			// _video.clear();
			
			// use remove child method
			removeChild(_video);
		}
		
		
	}
}
