package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;

	public class Main extends Sprite 
	{
		
		public function Main(  ) 
		{
			// when textField had been select or deselect (focus in or focus out)
			// call another function
			selectText();
			
			// when change focus by key or mouse, check the content on textfield
			// if there is on content on textfield, cancal change focus
			checkInput();
		}
		
		private function selectText():void
		{
			var _textField:TextField = new TextField();
			_textField.border = true;
			_textField.type = TextFieldType.INPUT;
			_textField.x = 100;
			_textField.y = 100;
			
			// call another function when textFiled had been selected
			_textField.addEventListener(FocusEvent.FOCUS_IN, repSelect);
			
			// call another function when textfield had been deselected
			_textField.addEventListener(FocusEvent.FOCUS_OUT,repDeselect);
			
			addChild(_textField);
			
			function repSelect(event:FocusEvent):void
			{
				trace("textField had been selected");
			}
			
			function repDeselect(event:FocusEvent):void
			{
				trace("textField had been deselected");
			}
		}
		
		private function checkInput():void
		{
			var _textField1:TextField = new TextField();
			var _textField2:TextField = new TextField();
			
			_textField1.type = TextFieldType.INPUT;
			_textField2.type = TextFieldType.INPUT;
			
			_textField1.x = _textField2.x = 300;
			_textField1.y = 100;
			_textField2.y = 220;
			
			_textField1.border = _textField2.border = true;
			
			// add listener, if foucs changed by key or mouse, check the content on textfield
			_textField1.addEventListener(FocusEvent.KEY_FOCUS_CHANGE, checkContent);
			_textField1.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, checkContent);
			
			
			function checkContent(event:FocusEvent):void
			{
				if (_textField1.text =="")
				{
					// if the content is blank, cancel the change focus event. 
					event.preventDefault(  );
					trace("you need fill it");
				}	
			}
			
			
			addChild(_textField1);
			addChild(_textField2);
		}
		
	}	
}
