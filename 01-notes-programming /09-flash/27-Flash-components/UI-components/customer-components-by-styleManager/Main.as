package  
{
	import fl.controls.Button;
	import fl.controls.Label;
    import flash.display.Sprite;
    import flash.events.*;    
	import fl.managers.StyleManager;
	import flash.text.TextFormat;

    public class Main extends Sprite
    {  
        public var btn1:Button = new Button();
		public var btn2:Button = new Button();
		public var iLabel:Label = new Label();
		
		public function Main() {
			// apply style to a component
			// demo1();
			
			// apply style to all component
			demo2();
        }
		
		public function demo1():void {
			var iTextFormat:TextFormat = new TextFormat();
			iTextFormat.color = 0xff0000;
			StyleManager.setComponentStyle(btn1, "textFormat", iTextFormat);
			
			btn1.move(100, 100);
			btn2.move(300, 100);
			iLabel.move(100, 200);
			
			addChild(btn1);
			addChild(btn2);
			addChild(iLabel);
		}
		
		public function demo2():void {
			var iTextFormat:TextFormat = new TextFormat();
			iTextFormat.color = 0xff0000;
			StyleManager.setStyle("textFormat", iTextFormat);
			
			btn1.move(100, 100);
			btn2.move(300, 100);
			iLabel.move(100, 200);
			
			addChild(btn1);
			addChild(btn2);
			addChild(iLabel);
		}
    }
}