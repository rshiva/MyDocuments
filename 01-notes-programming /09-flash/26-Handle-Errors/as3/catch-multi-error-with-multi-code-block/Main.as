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
				// if parameter <0 throw custom error 1
				// if parameter <5 throw custom error 2
				// if parameter <10 throw custom error 3
				var myTest:Test = new Test(8);
			}
			
			// code block handle MyError1
			catch (e:MyError1) {
				trace(e.message);
			}
			
			// code block handle MyError2
			catch (e:MyError2) {
				trace(e.message);
			}
			
			// code block handle MyError3
			catch (e:MyError3) {
				trace(e.message);
			}
			
			// code block handle other generic errors
			catch (e:Error){
				// retrive the generic error
				trace(e.message);
			}
		}
		
	}
	
}