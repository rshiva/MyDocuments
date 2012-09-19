package  
{
    import flash.display.Sprite;
    import flash.events.*;    
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	import fl.controls.UIScrollBar;
	import fl.controls.ScrollBarDirection;


    public class Main extends Sprite
    {  
        public function Main() {
			var url:String = "http://www.helpexamples.com/flash/text/lorem.txt";

			var uLdr:URLLoader = new URLLoader(new URLRequest(url));
			uLdr.addEventListener(Event.COMPLETE, completeHandler);

			var tf:TextField = new TextField();
			tf.width = 320;
			tf.height = 140;
			tf.x = 10;
			tf.y = 10;
			tf.border = true;
			tf.multiline = true;
			tf.wordWrap = false;
			addChild(tf)

			var hScrollBar:UIScrollBar = new UIScrollBar();
			hScrollBar.direction = ScrollBarDirection.HORIZONTAL;
			hScrollBar.move(tf.x, tf.y + tf.height);
			hScrollBar.width = tf.width;
			hScrollBar.scrollTarget = tf;
			addChild(hScrollBar);

			var vScrollBar:UIScrollBar = new UIScrollBar();
			vScrollBar.direction = ScrollBarDirection.VERTICAL;
			vScrollBar.move(tf.x + tf.width, tf.y);
			vScrollBar.height = tf.height;
			vScrollBar.scrollTarget = tf;
			addChild(vScrollBar);

			function completeHandler(event:Event):void {
				tf.text = event.target.data;
				hScrollBar.update();
				vScrollBar.update();
			}
			
        }
    }
}