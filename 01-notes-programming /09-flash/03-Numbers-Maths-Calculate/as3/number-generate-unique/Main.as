package {

	import flash.display.Sprite;
	import ascb.util.NumberUtilities;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			for (var i:uint; i < 10; i++)
			{
				//The NumberUtilities.getUnique( ) method returns a number based on the current epoch milliseconds.
				trace(NumberUtilities.getUnique(  ));
			}
		}
	}
}
