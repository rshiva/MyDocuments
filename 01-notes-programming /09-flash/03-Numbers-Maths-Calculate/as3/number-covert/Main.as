package {
  import flash.display.Sprite;
  import flash.display.*;

  //
  public class Main extends Sprite {
    public function Main(  ) {
		
		// toString( ) method of a Number, uint, or int object with the radix parameter to convert a decimal number to a string representation of the value in another base.
		// parseInt( ) function with the radix parameter (the radix is the number's base) to convert a string to a decimal representation
		
		//binary
		trace(new Number(35).toString(2));
		trace(parseInt("100011", 2));
		
		// octal literals start with 0
		trace(new Number(35).toString(8));
		trace(parseInt("043", 8));
		
		//Hexadecimal literals start with 0x 
		trace(new Number(35).toString(16));
		trace(parseInt("0x23", 16));
		
    }
  }
}

