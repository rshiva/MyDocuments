package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextFormat
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextLineMetrics;
	

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// highLight clicked character in textField
			// highLightClickChar();
			
			// hightLight clicked paragraph in textField 
			// highLightParagraph();
		}    
		
		private function highLightClickChar():void
		{
			var _textField:TextField = new TextField();
			var _container:Sprite = new Sprite();
			var _sprite:Sprite = new Sprite();
			_textField.border = true;
			_textField.background = true;
			_textField.backgroundColor = 0xffff00;
			_textField.multiline = true;
			_textField.wordWrap = true;
			_textField.selectable = false;
			_textField.width = 400;
			_textField.height = 400;
			_container.x = 100;
			_container.y = 50;
			_container.addChild(_textField);
			addChild(_container);
			_textField.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi tortor purus, aliquet a, ornare ac, suscipit a, est. Nullam hendrerit molestie erat. Nunc nulla tortor, ullamcorper et, elementum vel, fringilla sed, dui. Praesent fermentum interdum orci.";
			
			_textField.addEventListener(MouseEvent.CLICK,drawHighLight);
			addChild(_sprite);
			
			function drawHighLight(event:MouseEvent):void
			{
				// get mouse local point from textField (can not use mouse global position if textField or it container not at (0,0))
				// then retrieve character's index at textfield
				var _index:int = _textField.getCharIndexAtPoint(_textField.mouseX, _textField.mouseY);
				
				// get character boundary by it's index
				var _rect:Rectangle = _textField.getCharBoundaries(_index);
				
				// save the boundary position in a point and convert to global 
				var _point1:Point = new Point(_rect.x, _rect.y);
				var _point2:Point = _textField.localToGlobal(_point1);
				
				// draw character's boundary in different color
				_sprite.graphics.clear();
				_sprite.graphics.lineStyle(0, 0, 0);
				_sprite.graphics.beginFill(0x00ffff, 0.25);
				_sprite.graphics.drawRect(_point2.x, _point2.y, _rect.width, _rect.height);
				_sprite.graphics.endFill();
			}
			
		}
		
		private function highLightParagraph():void
		{
			var _field:TextField;
			var _highlight:Sprite;
			_field = new TextField(  );
			_field.border = true;
			_field.background = true;
			_field.multiline = true;
			_field.wordWrap = true;
			_field.selectable = false;
			_field.width = 400;
			_field.height = 400;
			addChild(_field);
			
			// add two paragraph text
			_field.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi tortor purus, aliquet a, ornare ac, suscipit a, est. Nullam hendrerit molestie erat. Nunc nulla tortor, ullamcorper et, elementum vel, fringilla sed, dui. Praesent fermentum interdum orci.";
			_field.appendText("\n");
			_field.appendText ("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi tortor purus, aliquet a, ornare ac, suscipit a, est. Nullam hendrerit molestie erat. Nunc nulla tortor, ullamcorper et, elementum vel, fringilla sed, dui. Praesent fermentum interdum orci.");
			
			// when click textField, call highLight function
			_field.addEventListener(MouseEvent.CLICK, highLight);
			
			_highlight = new Sprite(  );
			addChild(_highlight);
			
			function highLight(event:MouseEvent):void 
			{
				// get the character index on mouse position
				// if the textFiled or textFiled container no at (0,0), should use textField.mouseX,
				var index:int = _field.getCharIndexAtPoint(mouseX, mouseY);
				
				// get the first character index in paragraph
				var startIndex:int = _field.getFirstCharInParagraph(index);
				
				// get the last character index in paragraph
				var stopIndex:int = startIndex + _field.getParagraphLength(index);
				
				// get prargraph first line index 
				var startLine:int = _field.getLineIndexOfChar(startIndex);
				
				// get paragraph last line index
				var stopLine:int = _field.getLineIndexOfChar(stopIndex - 1);
				
				var metrics:TextLineMetrics;
				var lineCharacter:int;
				var rectangle:Rectangle;
				
				_highlight.graphics.clear(  );
				_highlight.graphics.lineStyle(0, 0, 0);
				
				for (var i:int = startLine; i <= stopLine; i++) 
				{
					// Returns the character index of the first character in the line that the i specifies. 
					lineCharacter = _field.getLineOffset(i);
					
					// get boundary of first character in each line
					rectangle = _field.getCharBoundaries(lineCharacter);
					
					// create textLineMetrics object to save the information for line of text 
					metrics = _field.getLineMetrics(i);
					_highlight.graphics.beginFill(0x00FFFF, .25);
					
					// draw rectangle start first first character in each line
					// width and height according to the width and height of each line
					_highlight.graphics.drawRect(rectangle.x, rectangle.y, metrics.width, metrics.height);
					_highlight.graphics.endFill(  );
				}
			}
    
		}
		
	}
}
