package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Main extends Sprite 
	{
		private var os:String=Capabilities.os.substr(0, 3)
		
		public function Main():void 
		{
			if (os == "Win") {
				trace("windows user");
			}
			else if (os == "Mac"){
				trace("Mac user")
			}
			else {
				trace("other platform user");
			}
		}
		
	}
}
	