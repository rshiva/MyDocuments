package 
{
	import flash.display.Sprite;
    import flash.net.URLRequest;
    import flash.media.Sound;    
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.events.MouseEvent;
    import flash.errors.IOError;
    import flash.events.IOErrorEvent;

    // this code control the streaming, will cause error when test on local
	
	public class Main extends Sprite {
        private var snd:Sound = new Sound();
        private var button:TextField = new TextField();
        private var req:URLRequest = new URLRequest("audio/test.mp3");
        
        public function Main() {
            button.x = 10;
            button.y = 10;
            button.text = "START";
            button.border = true;
            button.background = true;
            button.selectable = false;
            button.autoSize = TextFieldAutoSize.LEFT;

            button.addEventListener(MouseEvent.CLICK, clickHandler);

            this.addChild(button);
        }

        private function clickHandler(e:MouseEvent):void {

            if(button.text == "START") {

                snd.load(req);
                snd.play();        

                snd.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);

                button.text = "STOP";
            }
            else if(button.text == "STOP") {
                    
                try {
                    snd.close();
                    button.text = "Wait for loaded stream to finish.";
                }
                catch (error:IOError) {
                    button.text = "Couldn't close stream " + error.message;    
                }
            }
        }
        
        private function errorHandler(event:IOErrorEvent):void {
                button.text = "Couldn't load the file " + event.text;
        }
    }

}
