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
			var mc3:MovieClip = new MovieClip();
			
			mc1.name="MC1";
			mc2.name="MC2";
			mc3.name = "MC3";
			
			// mc1 global position
			mc1.x = 100;
			mc1.y = 100;
			
			// mc2 local position in mc1
			mc2.x = 50;
			mc2.y = 50;
			
			// mc3 local position in mc2
			mc3.x = 50;
			mc3.y = 50;
			
			drawRect(mc1.graphics);
			drawRect(mc2.graphics);
			drawRect(mc3.graphics);
			
			mc1.addChild(mc2);
			// mc2.addChild(mc3);
			
			// add event listener to mc1.
			initEvents(mc1);
			
			this.addChild(mc1);
		}

		public function initEvents(obj:InteractiveObject):* 
		{
			obj.addEventListener(MouseEvent.MOUSE_OVER, handler);
			obj.addEventListener(MouseEvent.MOUSE_OUT, handler);
			obj.addEventListener(MouseEvent.ROLL_OUT, handler);
			obj.addEventListener(MouseEvent.ROLL_OVER, handler);
		}
		
		public function handler(evtObj:MouseEvent):* 
		{
			trace(evtObj.currentTarget.name + "\t" +evtObj.target.name + "\t" + evtObj.type);
		}

		static public function drawRect(g:Graphics, x:uint = 0, y:uint = 0, w:uint = 200, h:uint = 200):* 
		{
			g.lineStyle(1,0x0,1,true);
			g.beginFill(0x0,0.1);
			g.drawRect(x,y,w,h);
			g.endFill();
		}

	}
	// Ticore's Blog - http://ticore.blogspot.com/
}

