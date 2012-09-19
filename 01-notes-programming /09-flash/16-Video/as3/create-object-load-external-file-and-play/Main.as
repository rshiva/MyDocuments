package {
    import flash.media.Video;
    import flash.net.NetConnection;
    import flash.net.NetStream;
    import flash.events.NetStatusEvent;
    import flash.display.Sprite;
    import flash.events.Event;

    public class Main extends Sprite {
        private var connection:NetConnection;
		private var _stream:NetStream;
        private var _video:Video;
		private var client:Object;
        
        public function Main(  ) {
            // create a Net Connection object
			connection = new NetConnection(  );
            
			// for progress download set parameter as null
			// for stream media server, point parameter to server 
			connection.connect(null);
            
			// create net stream object using net connection object
			_stream = new NetStream(connection);
            
			// under FLex SDK, the Net Stream object need onMeta Data property when load flv file
			// need define an onMetaData( ) method for an object 
			// and assign that object to the client property of the NetStream object
			client= new Object(  );
			client.onMetaData = function(metadata:Object):void {
				// get the information for metadata (flv file)
				trace(metadata.duration);
				trace(metadata.width);
				trace(metadata.height);
			};
			_stream.client = client;
            
			// create video object
			// default is 320x240
			_video = new Video(293, 165);
			_video.x = _video.y = 100;
			
			
			// use video object render the data from Net Stream object
			_video.attachNetStream(_stream);
            
			// add video object to display list
			addChild(_video);
			
			// 
			_stream.play("video/video1.flv");
        }
    }

}
