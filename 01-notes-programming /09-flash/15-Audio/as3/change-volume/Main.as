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
			// create sound object and sound channel object
			var _sound:Sound = new Sound(new URLRequest("audio/test.mp3"));
			var _soundChannel:SoundChannel = new SoundChannel();
			_soundChannel = _sound.play();
			
			// create a sprite as a button
			var _btn:Sprite = new Sprite();
			_btn.graphics.beginFill(0xe0e0e0);
			_btn.graphics.drawRect(50, 50, 100, 20);
			_btn.graphics.endFill();
			addChild(_btn);
			
			// add event handler to the button
			_btn.addEventListener(MouseEvent.CLICK, volumnDown);
			
			function volumnDown(event:MouseEvent):void {
				// create soundtransform object
				var transform:SoundTransform = new SoundTransform(  );
				
				// set the volume property of the transform object
				transform.volume = .5;
				
				// set transform object to sound channel's soundtransform property 
				_soundChannel.soundTransform = transform;
			}
        }  
    }

}
