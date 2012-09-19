package 
{
	import flash.events.*;
	import flash.display.*;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
    import flash.media.Sound;
	import flash.media.SoundMixer;
    import flash.net.URLRequest;
    
    public class Main extends Sprite {
        
        public function Main(  ) {
			
			// stop all sound is playing by flash player
			stopSound();
        }
		
		private function stopSound():void {
			
			// create a textfield as button
			var button:TextField = new TextField();
			button.x = 10;
            button.y = 10;
            button.text = "STOP";
            button.border = true;
            button.background = true;
            button.selectable = false;
            button.autoSize = TextFieldAutoSize.LEFT;
            this.addChild(button);
			
			// add function to textfield
			button.addEventListener(MouseEvent.CLICK, stopAllSound);
			
			// create sound object and play
			var _sound:Sound = new Sound(new URLRequest("audio/test.mp3"));
			_sound.play();
			
			function stopAllSound(event:MouseEvent):void {
				SoundMixer.stopAll( );
			}
		}
    }

}
