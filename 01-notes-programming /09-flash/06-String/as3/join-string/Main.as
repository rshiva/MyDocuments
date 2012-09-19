package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		private var _sprite:Sprite = new Sprite();
		
		public function Main()
		{	
		   // joint 2 or more strings
			jointString1();
		}
		
		private function jointString1():void
		{
			var _string1:String = "String1";
			var _string2:String = "String2";
			var _string3:String = _string1 + _string2;
			
			trace(_string3);
		}
		
	}
}
