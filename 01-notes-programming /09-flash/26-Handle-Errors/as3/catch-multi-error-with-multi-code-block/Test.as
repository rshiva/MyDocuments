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
				throw new MyError1();
			}else if (inputNumber < 5) {
				throw new MyError2();
			}else if (inputNumber < 10) {
				throw new MyError3();
			}
		}
		
	}
	
}