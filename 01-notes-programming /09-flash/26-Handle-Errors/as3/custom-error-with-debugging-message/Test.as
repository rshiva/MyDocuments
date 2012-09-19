package  
{
	
	/**
	 * ...
	 * @author Harry
	 */
	public class Test 
	{
		
		public function Test(inputNumber:Number) 
		{
			if (inputNumber < 0) {
				throw new MyError("Custom debugging message");
			}
		}
		
	}
	
}