package {
	import flash.display.*;
	import flash.text.*;
	import flash.events.*
	import flash.net.*;
	import flash.net.URLLoaderDataFormat;


	public class Main extends Sprite {
		private var _output:TextField;
		public function Main(  ) {
			initializeOutput(  );
			loadData(  );
		}

		private function initializeOutput(  ):void {
			_output = new TextField( );
			_output.width = stage.stageWidth;
			_output.height = stage.stageHeight;
			addChild( _output );    
		}

		private function loadData(  ):void {
			var loader:URLLoader = new URLLoader(  );
			// Instruct the loader to read the file as plain text - This line is not
			// necessary because the dataFormat is DataFormat.TEXT by default.
			loader.dataFormat= URLLoaderDataFormat.TEXT;
			
			// Register an event handler for when the data is finished downloading
			loader.addEventListener( Event.COMPLETE, handleComplete );
			
			// Load the HTML text from the example.html file
			loader.load( new URLRequest( "http://money.ninemsn.com.au/article.aspx?id=826208" ) );
		}

		private function handleComplete( event:Event ):void {
			var loader:URLLoader = URLLoader( event.target );
			// Assign the htmlText of the text field to the HTML text that was contained
			// in example.html. The data property of the URLLoader is the file contents.
			_output.htmlText = loader.data;
		}
	}
}
