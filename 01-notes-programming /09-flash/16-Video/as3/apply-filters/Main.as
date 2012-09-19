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
		
        public function Main(  ) {
			_connection = new NetConnection(  );
			_connection.connect(null);
			_stream = new NetStream(_connection);
            
			_client= new Object(  );
			_client.onMetaData = function(metadata:Object):void {
				// get the duration of the video
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
			
			// set Listener to call resize function 
			_stream.addEventListener(NetStatusEvent.NET_STATUS, resizeVideo);
			
			applyFilter();
        }
		
		
		
		
		private function resizeVideo(event:NetStatusEvent):void {
			// set condition to reszie video
			if(_video.videoWidth > 0 && _video.width != _video.videoWidth) {
				
				// reszie video by encoded dimensions
				_video.width = _video.videoWidth;
				_video.height = _video.videoHeight;
			}
		}
		
		private function applyFilter():void {
			var _drapShadow:DropShadowFilter = new DropShadowFilter(5);
			var _glow:GlowFilter = new GlowFilter();
			var _filters:Array = [_drapShadow, _glow];
			
			_video.filters = _filters;
		}
		
		
	}
}
