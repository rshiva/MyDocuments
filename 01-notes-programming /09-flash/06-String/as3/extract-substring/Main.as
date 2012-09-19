package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{	
		public function Main()
		{	
			// extract substring by substr method
			substrMethod();
			
			// extract substring by substring method
			subStringMethod();
			
			// extract substring by slice
			sliceMethod();
		}
		
		private function substrMethod():void
		{
			var _sprite:String = "testing";
			trace(_sprite.substr(0)); // testing
			trace(_sprite.substr(0, 3)); // tes
			trace(_sprite.substr( -1)); // g
			trace(_sprite.substr( -3, 4)); // ing
		}
		
		private function subStringMethod():void
		{
			var _sprite:String = "testing";
			trace(_sprite.substring(0)); // testing
			trace(_sprite.substring(0,3)); // tes
			trace(_sprite.substring(3,1)); // tes
			trace(_sprite.substring(-3,-1)); // empty
		}
		
		private function sliceMethod():void
		{
			var _sprite:String = "testing";
			trace(_sprite.slice(0)); // testing
			trace(_sprite.slice(0,3)); // testing
			trace(_sprite.slice(3,1)); // empty
			trace(_sprite.slice(-3,-1)); // in
		}
	}
}
