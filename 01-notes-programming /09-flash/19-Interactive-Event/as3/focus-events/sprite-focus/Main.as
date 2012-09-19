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
			var rect1:Sprite = new Sprite( );
			rect1.graphics.lineStyle(1);
			rect1.graphics.beginFill(0x0000FF);
			rect1.graphics.drawRect(50, 50, 100, 20);
			
			var rect2:Sprite = new Sprite( );
			rect2.graphics.lineStyle(1);
			rect2.graphics.beginFill(0x0000FF);
			rect2.graphics.drawRect(50, 100, 100, 20);
			
			var rect3:Sprite = new Sprite( );
			rect3.graphics.lineStyle(1);
			rect3.graphics.beginFill(0x0000FF);
			rect3.graphics.drawRect(200, 50, 100, 20);
			
			var rect4:Sprite = new Sprite( );
			rect4.graphics.lineStyle(1);
			rect4.graphics.beginFill(0x0000FF);
			rect4.graphics.drawRect(200, 100, 100, 20);
			
			// make sprite can be focused
			rect1.tabEnabled = true;
			rect2.tabEnabled = true;
			rect3.tabEnabled = true;
			rect4.tabEnabled = true;
			
			// 
			rect2.mouseEnabled = true;
			
			addChild(rect1);
			addChild(rect2);
			addChild(rect3);
			addChild(rect4);
			
			stage.focus = rect1;
		}
	}
}