package  
{
	import flash.display.*;
    import flash.events.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Main extends MovieClip
	{
		var _shape:Shape = new Shape();
		
		public function Main() 
		{
			_shape.graphics.beginFill(0xff0000);
			_shape.graphics.drawCircle(300, 300, 150);
			_shape.graphics.endFill();
			addChild(_shape);
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, moveCircle);	
		}
		private function moveCircle(event:MouseEvent):void
		{
			if (event.delta > 0)
			{
				_shape.y += 5;
			};
			if (event.delta < 0)
			{
				_shape.y -= 5;
			};
		}
		
	}
	
}