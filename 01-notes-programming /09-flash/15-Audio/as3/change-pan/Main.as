package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
    public class Main extends Sprite {
        public function Main(  ) {
			// create sound object, sound channel object and sound transform
			var _sound:Sound = new Sound(new URLRequest("audio/test.mp3"));
			var _soundChannel:SoundChannel = new SoundChannel();
			var transform:SoundTransform = new SoundTransform(  );
			_soundChannel = _sound.play();
			
			// create 2 sprites as a button
			var _btnL:Sprite = new Sprite();
			_btnL.graphics.beginFill(0xe0e0e0);
			_btnL.graphics.drawRect(50, 50, 50, 50);
			_btnL.graphics.endFill();
			addChild(_btnL);
			
			var _btnR:Sprite = new Sprite();
			_btnR.graphics.beginFill(0xe0e0e0);
			_btnR.graphics.drawRect(200, 50, 50, 50);
			_btnR.graphics.endFill();
			addChild(_btnR);
			
			function panLeft(event:MouseEvent):void {
				// set transform as -1
				// pan left
				transform.pan = -1.0;
				_soundChannel.soundTransform = transform;
			}
			
			function panRight(event:MouseEvent):void {
				// set transform as -1
				// pan right
				transform.pan = 1.0;
				_soundChannel.soundTransform = transform;
			}
			
			// add event listener call specific function when mouse click 
			_btnL.addEventListener(MouseEvent.CLICK, panLeft);
			_btnR.addEventListener(MouseEvent.CLICK, panRight);
			
        }  
    }

}
