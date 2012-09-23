package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{	
		private var _string:String="my_Image.1008.jpg"
		
		public function Main()
		{	
			// get file name before last period
			trace(getFileName(_string));
			
			// get file extension after last period
			trace(getExtension(_string));
		}
		
		private function getFileName($string:String):String
		{
			var extensionIndex:Number = $string.lastIndexOf( '.' );
			if ( extensionIndex == -1 ) 
			{
				// Oops, there is no period. Just return the filename.
				return $string;
			} 
			else 
			{
				// return all characters before last period
				return $string.substr( 0, extensionIndex );
			} 
		}
		
		private function getExtension($string:String):String
		{
			// Find the location of the period.
			var extensionIndex:Number = $string.lastIndexOf( '.' );
			if ( extensionIndex == -1 ) 
			{
				// Oops, there is no period, so return the empty string.
				return "";
			} 
			else 
			{
				return $string.substr( extensionIndex + 1, $string.length );
			} 
		}
		
	}
}
