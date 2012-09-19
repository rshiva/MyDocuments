package {

	import flash.display.*;
	import flash.events.*;
	
	public class Main extends Sprite 
	{
		
		
		public function Main(  ) 
		{
			var _date:Date = new Date();
			
			// retrive year 1-12
			trace(_date.fullYear);
			
			// retrive month 0 (January) to 11 (December)
			trace(_date.month);
			
			// retrive date 1-31
			trace(_date.date);
			
			// retrive day 0 (Sunday) to 6 (Saturday)
			trace(_date.day);
			
			// retrive hours from 0 (midnight) to 23 (11 p.m.)
			trace(_date.hours);
			
			// retrive seconds from 0 to 59
			trace(_date.seconds);
			
			// retrive millseconds from 0 to 999
			trace(_date.milliseconds);

		}
	}
}
