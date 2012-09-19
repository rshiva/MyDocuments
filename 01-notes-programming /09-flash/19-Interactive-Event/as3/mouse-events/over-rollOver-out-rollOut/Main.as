package 
{
	
	import flash.display.*;
	import flash.utils.*;
	import flash.events.*;

	public class Main extends MovieClip 
	{
		public function Main():* 
		{
			var mc1:MovieClip = new MovieClip();
			var mc2:MovieClip = new MovieClip();
			
			mc1.name="MC1";
			mc2.name="MC2";

			mc1.x = 70;
			mc1.y = 40;
			mc2.x = 60;
			mc2.y = 20;

			drawRect(mc1.graphics, 0, 0, 100, 100, 0xFF0000);
			drawRect(mc2.graphics, 0, 0, 100, 100, 0x0000FF);

			mc1.addChild(mc2);

			initEvents(stage);
			initEvents(this);
			initEvents(mc1);
			initEvents(mc2);
			
			this.addChild(mc1);
		}

		public function initEvents(obj:InteractiveObject):* 
		{

			obj.addEventListener(MouseEvent.MOUSE_OVER, handler, false);
			obj.addEventListener(MouseEvent.MOUSE_OVER, handler, true);


			obj.addEventListener(MouseEvent.MOUSE_OUT, handler, false);
			obj.addEventListener(MouseEvent.MOUSE_OUT, handler, true);

			obj.addEventListener(MouseEvent.ROLL_OUT, handler, false);
			obj.addEventListener(MouseEvent.ROLL_OUT, handler, true);

			obj.addEventListener(MouseEvent.ROLL_OVER, handler, true);
			obj.addEventListener(MouseEvent.ROLL_OVER, handler, false);

		}

		public function handler(evtObj:MouseEvent):* 
		{
			trace("eventPhase : " + evtObj.eventPhase + ", currentTarget : " + evtObj.currentTarget.name + ", target : " + evtObj.target.name + ", type : " + evtObj.type);
		}

		static public function drawRect(g:Graphics, x = 0, y = 0, w = 100, h = 100, c = 0x0):* 
		{
			g.lineStyle(1,0x0,1,true);
			g.beginFill(c,0.6);
			g.drawRect(x,y,w,h);
			g.endFill();
		}

	}
}
// Ticore's Blog - http://ticore.blogspot.com/


