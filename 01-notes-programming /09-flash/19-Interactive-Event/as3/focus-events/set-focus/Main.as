package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	/**
	 * ...
	 * @author Harry
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			var rect:Sprite = new Sprite( );
			rect.graphics.lineStyle(1);
			rect.graphics.beginFill(0x0000FF);
			rect.graphics.drawRect(100, 100, 150, 75);
			
			addChild(rect);
			stage.focus = rect;
		}
	}
}