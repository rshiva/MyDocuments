package  
{
	import flash.events.*;
	import flash.display.*;
	
	/**
	 * ...
	 * @author Harry
	 */
	public class Main extends MovieClip
	{
		
		public function Main() 
		{
			try {
				// create an Test class and pass a parameter
				// if pass a negative number the Test class will throw an Error
				var myTest:Test = new Test( -1);
			}
			catch (e:Error){
				// retrive the error object
				trace(e.message);
			}
			finally {
				// finally can be omit
				// the code block will be execute whatever if error to be throw
				trace("this is the code need execute whatever if an error to be throw");
			}
		}
		
	}
	
}