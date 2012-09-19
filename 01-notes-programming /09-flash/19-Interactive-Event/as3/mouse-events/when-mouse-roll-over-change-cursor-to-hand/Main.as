package 
{
	import flash.display.*;
    import flash.events.*;
	

    public class Main extends MovieClip {
		
		
        public function Main(  ) {
			var _shape:Sprite = new Sprite();
			_shape.graphics.lineStyle(1, 0);
			_shape.graphics.beginFill(0xcccccc);
			_shape.graphics.drawCircle(200, 200, 100);
			_shape.graphics.endFill();
			
			
			// on mouse rollover, change cursor to hand
			_shape.buttonMode = true; 
			_shape.mouseChildren = false;
			
			addChild(_shape);
        }
    }
}
