package  
{
	import fl.containers.UILoader;
    import flash.display.Sprite;
    import flash.events.*;    

    public class Main extends Sprite
    {  
        public function Main() {
			var iUILoader:UILoader = new UILoader();
			iUILoader.source = "test.jpg";
			iUILoader.scaleContent = false;
			iUILoader.addEventListener(Event.COMPLETE, completeHandler);
			
			function completeHandler(e:Event):void {
				addChild(iUILoader);
			}
        }
    }
}