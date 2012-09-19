package 
{
	import flash.display.Sprite;
	import flash.events.*;
	
	/**
	 * ...
	 * @author ...
	 */
	
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			/**
			* the formula to calculate the distance between any two points
			* var c:Number = Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2));
			* @param a:the difference between the points' X coordinates
			* @param b:the difference between their Y coordinates
			* @param c:the distance between a and b
			**/
			
			//calculate distance between (0,0) and (100,100)
			var c:Number = Math.sqrt(Math.pow(100, 2) + Math.pow(100, 2));
			trace(c);
		}
	}
	
}