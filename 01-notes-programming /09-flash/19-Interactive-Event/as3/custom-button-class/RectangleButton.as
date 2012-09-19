package  
{
	import flash.display.*;
	import flash.text.*;
	import flash.filters.DropShadowFilter;
	
	/**
	 * ...
	 * @author ...
	 */
	public class RectangleButton extends SimpleButton
	{
		// create local variable to store constructor arguments
		private var _text:String;
		private var _width:uint;
		private var _height:uint;
		
		public function RectangleButton(text:String,width:uint,height:uint)
		{
			// pass constructor arguments to local variable
			_text = text;
			_width = width;
			_height = height;
			
			// define button state by private functions
			upState = createUpState();
			overState = createOverState();
			downState = createDownState();
			hitTestState = upState;
		}
		
		private function createUpState():Sprite
		{
			// create container
			var _sprite:Sprite = new Sprite();
			
			// create button base by call another function
			var _base:Shape = createdRectangle(0x33FF66);
			
			// create text for button
			var _copy:TextField = createText(false);
			
			// add display object to container
			_sprite.addChild(_base);
			_sprite.addChild(_copy);
			
			// return container as button state
			return _sprite;
		}
		
		private function createOverState():Sprite
		{
			var _sprite:Sprite = new Sprite();
			var _base:Shape = createdRectangle(0x70FF94);
			var _copy:TextField = createText(false);
			_sprite.addChild(_base);
			_sprite.addChild(_copy);
			return _sprite;
		}
		
		private function createDownState():Sprite
		{
			var _sprite:Sprite = new Sprite();
			var _base:Shape = createdRectangle(0xCCCCCC);
			var _copy:TextField = createText(true);
			_sprite.addChild(_base);
			_sprite.addChild(_copy);
			return _sprite;
		}
		
		private function createdRectangle(color:uint):Shape
		{
			var _shape:Shape = new Shape();
			_shape.graphics.lineStyle(1, 0x000000);
			_shape.graphics.beginFill(color);
			_shape.graphics.drawRect(0, 0, _width, _height);
			_shape.graphics.endFill();
			_shape.filters = [new DropShadowFilter(5)];
			//
			return _shape;
		}
		
		private function createText(down:Boolean):TextField
		{
			// create text
			var myText:TextField = new TextField();
			myText.text = _text;
			
			// define text location
			myText.width = _width;
			var format:TextFormat = new TextFormat();
			format.align = TextFormatAlign.CENTER;
			myText.setTextFormat(format);
			myText.y = (_height - myText.textHeight) / 2;
			myText.y -= 2;
			
			// when define button down state, move the text a little bit
			if (down)
			{
				myText.x += 1;
				myText.y += 1;
			}
			
			//
			return myText;
		}
		
	}
	
}