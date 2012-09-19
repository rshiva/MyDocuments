package  
{
	import fl.containers.ScrollPane;
    import flash.display.Sprite;
    import flash.events.*;    

    public class Main extends Sprite
    {  
        public function Main() {
			var iScrollPanel:ScrollPane = new ScrollPane();
			iScrollPanel.setSize(700, 400);
			iScrollPanel.move(50, 50);
			iScrollPanel.source = "sea.jpg";
			
			addChild(iScrollPanel);
        }
    }
}