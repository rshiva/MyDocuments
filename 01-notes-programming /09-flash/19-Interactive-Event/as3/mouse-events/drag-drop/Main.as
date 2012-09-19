package 
{
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.filters.DropShadowFilter;

	public class Main extends Sprite 
	{

		private var _red:Sprite;
		private var _green:Sprite;
		private var _blue:Sprite;
		private var _white:Sprite;

		// Saves the starting coordinates of a dragging Sprite so it can be placed back
		private var startingLocation:Point;

		// Create the rectangles that comprise the interface and wire the mouse events to make them interactive
		public function Main(  ) 
		{
			createRectangles(  );
			addEventListeners(  );
		}

		private function createRectangles(  ):void 
		{
			_red = new Sprite(  );
			_red.graphics.beginFill( 0xFF0000 );
			_red.graphics.drawRect( 0, 10, 10, 10 );
			_red.graphics.endFill(  );

			_green = new Sprite(  )
			_green.graphics.beginFill( 0x00FF00 );
			_green.graphics.drawRect( 0, 30, 10, 10 );
			_green.graphics.endFill(  );

			_blue = new Sprite(  );
			_blue.graphics.beginFill( 0x0000FF );
			_blue.graphics.drawRect( 0, 50, 10, 10 );
			_blue.graphics.endFill(  );

			_white = new Sprite(  );
			_white.graphics.lineStyle(1, 0);
			_white.graphics.beginFill( 0xFFFFFF );
			_white.graphics.drawRect( 20, 10, 50, 50 );
			_white.graphics.endFill(  );

			addChild( _red );
			addChild( _green );
			addChild( _blue );
			addChild( _white );  
		}

		private function addEventListeners(  ):void 
		{
			_red.addEventListener( MouseEvent.MOUSE_DOWN, pickup );
			_red.addEventListener( MouseEvent.MOUSE_UP, place );

			_green.addEventListener( MouseEvent.MOUSE_DOWN, pickup );
			_green.addEventListener( MouseEvent.MOUSE_UP, place );

			_blue.addEventListener( MouseEvent.MOUSE_DOWN, pickup );
			_blue.addEventListener( MouseEvent.MOUSE_UP, place );
		}

		public function pickup( event:MouseEvent ):void 
		{
			// Save the original location so you can put the target back
			startingLocation = new Point(  );
			startingLocation.x = event.target.x;
			startingLocation.y = event.target.y;

			// Start dragging the Sprite that was clicked on and apply a drop shadow filter to give it depth
			event.target.startDrag(  );
			event.target.filters = [ new DropShadowFilter(  ) ];

			// Bring the target to front of the display list so it appears on top of everything else
			setChildIndex( DisplayObject( event.target ), numChildren - 1 );
		}

		public function place( event:MouseEvent ):void 
		{
			// Stop dragging the Sprite around and remove the depth effect (i.e., the drop shadow) from the filter
			event.target.stopDrag(  );
			event.target.filters = null;

			// Check to see if the Sprite was dropped over the white rectangle, and if so, update the color
			if ( event.target.dropTarget == _white ) 
			{
				// Determine which color was dropped, and apply that color to the white rectangle
					var color:uint;
					switch ( event.target ) {
					case _red: 
					color = 0xFF0000; break;
					
					case _green: 
					color = 0x00FF00; break;
					
					case _blue: 
					color = 0x0000FF; break;
				}

				_white.graphics.clear(  );
				_white.graphics.beginFill( color );
				_white.graphics.drawRect( 20, 10, 50, 50 );
				_white.graphics.endFill(  );
			}

			// Place the dragging Sprite back to its original location
			event.target.x = startingLocation.x;
			event.target.y = startingLocation.y;
		}

	}
}
