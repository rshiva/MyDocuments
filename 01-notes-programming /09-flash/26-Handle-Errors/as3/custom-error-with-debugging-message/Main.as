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
				// if pass a negative number the Test class will throw a custom error MyError
				// custom error will be distinguished with generic error 
				var myTest:Test = new Test( -1);
			}
			catch (e:Error){
				// retrive the generic error
				trace(e.message);
			}
			catch (e:MyError) {
				// retrive the custom error object
				trace(e.message);
			}
		}
		
	}
	
}