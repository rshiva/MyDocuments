package  
{
	import fl.containers.UILoader;
	import fl.controls.Label;
	import fl.controls.Slider;
	import fl.events.SliderEvent;
    import flash.display.Sprite;
    import flash.events.*;    

    public class Main extends Sprite
    {  
        public function Main() {
			var iUILoader:UILoader = new UILoader();
			iUILoader.source = "test.jpg";
			iUILoader.scaleContent = false;
			iUILoader.move(100, 100);
			addChild(iUILoader);
			
			var iSlider:Slider = new Slider();
			iSlider.width = 200;
			iSlider.snapInterval = 10; // slider thumb movement
			iSlider.tickInterval = 10; // space of tick mark
			iSlider.maximum = 100; // max value
			iSlider.value = 100; // set start value 
			iSlider.move(100, 400);
			addChild(iSlider);
			
			iSlider.addEventListener(SliderEvent.CHANGE, changeHandler);
			
			function changeHandler(e:SliderEvent):void {
				trace(e.value);
				iUILoader.alpha = e.value * 0.01;
			}
        }
    }
}