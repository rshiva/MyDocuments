package  
{
	import fl.controls.TextArea;
    import flash.display.Sprite;
    import flash.events.*;    

    public class Main extends Sprite
    {  
        public function Main() {
			var iTextArea:TextArea = new TextArea();
			iTextArea.move(100,100);
			iTextArea.setSize(200, 200);
			iTextArea.condenseWhite = true;
			iTextArea.htmlText = '<b>Lorem ipsum dolor</b> sit amet, consectetuer adipiscing elit. <u>Vivamus quis nisl vel tortor nonummy vulputate.</u> Quisque sit amet eros sed purus euismod tempor. Morbi tempor. <font color="#FF0000">Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos.</font> Curabitur diam. Suspendisse at purus in ipsum volutpat viverra. Nulla pellentesque libero id libero.';
			addChild(iTextArea);
        }
    }
}