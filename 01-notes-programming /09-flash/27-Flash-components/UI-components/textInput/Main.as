package  
{
	import fl.controls.TextInput;
    import flash.display.Sprite;
    import flash.events.*;    
	import flash.text.TextFormat;

    public class Main extends Sprite
    {  
        public function Main() {
			var iTextFormat:TextFormat = new TextFormat();
			iTextFormat.font = "Georgia";
			iTextFormat.color = 0xff0000;
			iTextFormat.size = 16;
			
			var iTextInput:TextInput = new TextInput();
			iTextInput.restrict = "A-Z,a-z";
			iTextInput.move(160, 100);
			iTextInput.setSize(200, 25);
			iTextInput.setStyle("textFormat", iTextFormat);
			
			addChild(iTextInput);
        }
    }
}