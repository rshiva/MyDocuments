package 
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends Sprite 
	{
		private var _string:String = "This is cool."
		private var _subString:String = "Is";
		
		public function Main()
		{	
			// search substring in specific string from left to right
			// string:_string
			// substring:_substring
			// casesensitive:true
			searchSubStringFromLeftToRight(_string, _subString,true);
		}
		
		private function searchSubStringFromLeftToRight($string:String,$subString:String,$sensitive:Boolean):void
		{
			if ($sensitive == false)
			{
				$subString = $subString.toLowerCase();
				
			}else
			{
				$subString = $subString ;
			}
			
			if (($string.indexOf($subString)) == -1)
			{
				trace("no matching")
			}
			else
			{
				var index:int = -1;
				while (( index = $string.indexOf( $subString, index + 1 ) ) != -1)
				{
					trace(index);
				}
			}
		}
		
	}
}
