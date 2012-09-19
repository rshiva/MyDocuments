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
	import flash.text.TextFieldAutoSize;

    public class Main extends Sprite {
        private var _connection:NetConnection;
		private var _stream:NetStream;
        private var _video:Video;
		private var _client:Object;
		
		private var _bufferTime:TextField = new TextField();
		private var _bufferLength:TextField = new TextField();
		private var _bufferProgress:TextField = new TextField();
		private var _bytesLoaded:TextField = new TextField();
		private var _bytesTotal:TextField = new TextField();

        
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
			
			// set buffer time as 5 seconds
			_stream.bufferTime = 5;
			
			
			createTextToShowBuffer();
			addEventListener(Event.ENTER_FRAME, updateText);
        }
		
		private function createTextToShowBuffer():void {
			_bufferTime.autoSize = TextFieldAutoSize.LEFT;
			_bufferTime.text = "bufferTime:";
			addChild(_bufferTime);
			
			_bufferLength.autoSize = TextFieldAutoSize.LEFT;
			_bufferLength.text = "bufferLength:";
			_bufferLength.y = 20;
			addChild(_bufferLength);
			
			_bufferProgress.autoSize = TextFieldAutoSize.LEFT;
			_bufferProgress.text = "bufferProgress:";
			_bufferProgress.y = 40;
			addChild(_bufferProgress);
			
			_bytesLoaded.autoSize = TextFieldAutoSize.LEFT;
			_bytesLoaded.text = "bytesLoaded:";
			_bytesLoaded.y = 60;
			addChild(_bytesLoaded);
			
			_bytesTotal.autoSize = TextFieldAutoSize.LEFT;
			_bytesTotal.text = "bytesTotal:";
			_bytesTotal.y = 80;
			addChild(_bytesTotal);
		}
		
		
		
		private function resizeVideo(event:NetStatusEvent):void {
			// set condition to reszie video
			if(_video.videoWidth > 0 && _video.width != _video.videoWidth) {
				
				// reszie video by encoded dimensions
				_video.width = _video.videoWidth;
				_video.height = _video.videoHeight;
			}
		}
		
		private function updateText(event:Event):void {
			// bufferTime property tells how many seconds set for buffer
			_bufferTime.text = "bufferTime:"+_stream.bufferTime;
			
			// bufferLength property tells you how many seconds have loaded into the buffer
			_bufferLength.text = "bufferLength:" + Math.round(_stream.bufferLength);
			
			// buffer progress
			_bufferProgress.text = "bufferProgress:" + Math.round((_stream.bufferLength / _stream.bufferTime));
			
			// 
			_bytesLoaded.text = "bytesLoaded:" + _stream.bytesLoaded;
			
			//
			_bytesTotal.text = "bytesTotal:"+_stream.bytesTotal;
		}
	}
}
