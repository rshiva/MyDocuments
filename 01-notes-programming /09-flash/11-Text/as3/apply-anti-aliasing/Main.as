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
	import flash.text.AntiAliasType;
	import flash.text.GridFitType;
	

	public class Main extends Sprite 
	{
		// AntiAliasing must set for embedding font
		[Embed(source='../bin/fonts/julies.ttf',fontName="julies",mimeType="application/x-font-truetype")]
		
		// must define the embedding font as class
		private var julies:Class;
		
		public function Main(  ) 
		{
			applyAntiAliasing();
		}    
		
		private function applyAntiAliasing():void
		{
			// create textformat set it property
			var _textFormat:TextFormat = new TextFormat();
			_textFormat.size = 30;
			_textFormat.font = "julies";
			
			var _textField:TextField = new TextField();
			
			// must set embedFonts property if using embedded font
			_textField.embedFonts = true;
			
			// apply textFormat to textField
			_textField.defaultTextFormat = _textFormat;
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.text = "Apply text by embedding font";
			_textField.x = _textField.y = 200;
			
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			
			// only work for left align
			// if center or right align should use SUBPIXEL 
			_textField.gridFitType = GridFitType.NONE;
			
			// big number goes more sharpness
			// small number goes less sharpness
			_textField.sharpness = 300;
			
			addChild(_textField);
		}
	}
}
