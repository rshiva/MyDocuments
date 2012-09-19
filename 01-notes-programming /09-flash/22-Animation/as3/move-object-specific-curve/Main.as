package 
{
	import flash.display.*;
	import flash.events.*;
	import gs.TweenMax;

	public class Main extends Sprite 
	{
		private var _sprite:Sprite = new Sprite();
		
		public function Main()
		{
			
			// when set bezier curve as bezierThrough, the object move on a curve through control point (like draw path using path tools)
			// when set bezier curve as bezier, object move on a curve created by curveTo method
			
			createDisplayObject();
			// drawCurve();
			
			// object move on a curve created by curveTo method
			// TweenMax.to(_sprite, 1, { x:700, y:250, bezier:[ { x:400, y:50 } ] } );
			
			// object move on a curve through control point 
			// TweenMax.to(_sprite, 1, { x:700, y:250, bezierThrough:[ { x:400, y:50 } ] } );
			
			// object move on a curve through more than one control point
			TweenMax.to(_sprite, 1, { x:700, y:250, bezierThrough:[{x:306,y:56},{x:530,y:371}]});
		}
		
		private function createDisplayObject():void
		{
			_sprite.graphics.beginFill(0x000000);
			_sprite.graphics.drawCircle(0, 0, 50);
			_sprite.graphics.endFill();
			_sprite.x = 100;
			_sprite.y = 250;
			addChild(_sprite);
		}
		
		private function drawCurve():void
		{
			var _sprite1:Sprite = new Sprite();
			
			// set line style
			_sprite1.graphics.lineStyle(1, 0);
			
			// set curve start point at (100,250)
			_sprite1.graphics.moveTo(100, 250);
			
			// set curve control point at (400,50)
			// set curve end point at (700,250)
			_sprite1.graphics.curveTo(400, 50, 700, 250);
			
			// draw a circle at curve control point
			_sprite1.graphics.drawCircle(400, 50, 1);
			
			// after drawing, add display object to display list to render 
			addChild(_sprite1);
		}
	}
}
