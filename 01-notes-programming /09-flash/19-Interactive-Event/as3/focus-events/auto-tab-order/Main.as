package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	/*
	 * ...
	 * @author Harry
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			var textField1:TextField = new TextField();
			textField1.type = TextFieldType.INPUT;
			textField1.border = true;
			textField1.x = 50;
			textField1.y = 50;
			textField1.height = 20;
			textField1.width = 100;
			
			var textField2:TextField = new TextField();
			textField2.type = TextFieldType.INPUT;
			textField2.border = true;
			textField2.x = 50;
			textField2.y = 100;
			textField2.height = 20;
			textField2.width = 100;
			
			var textField3:TextField = new TextField();
			textField3.type = TextFieldType.INPUT;
			textField3.border = true;
			textField3.x = 200;
			textField3.y = 50;
			textField3.height = 20;
			textField3.width = 100;
			
			addChild(textField1);
			addChild(textField2);
			addChild(textField3);
			
			stage.focus = textField1;
		}
	}
}