package 
{
	
	/**
	 * ...
	 * @author Harry
	 */
	
	public class Person {
  
    private var _firstName:String;
    private var _age:int;
    
    public function Person(firstName:String, age:int) {
      _firstName = firstName;
      _age = age;    
    }
    
    public function detail():void {
		trace(_firstName);
		trace(_age);
    }
    
  }

	
}