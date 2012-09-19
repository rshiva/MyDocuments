package  
{
	
	/**
	 * ...
	 * @author ...
	 */
	public class B extends A 
	{
		// overwrite function 
		public function B() 
		{
			
		}
		
		// overwrite instance method inherit
		override  public function a():void 
		{
			trace("this is the a method in class B");
			
			// call the a method in class A
			super.a();
		}
		
	}
	
}