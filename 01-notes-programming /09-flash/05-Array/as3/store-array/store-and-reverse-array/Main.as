package {

	import flash.display.Sprite;
	import flash.events.*;

	public class Main extends Sprite 
	{
		public function Main(  ) 
		{
			// var words:Array = ["Tricycle", "relative", "aardvark", "jargon"];
			// sort the elements of an array in ascending, alphabetical order.
			// words.sort(  );
			
			// sort the elements of an array descending order, alphabetical order
			// words.sort(Array.DESCENDING);
			
			//----------------------------------------------------------------------------//
			
			
			// by default the uppercase characters before lowercase characters. But can turn it off.
			// var words:Array = ["Tricycle", "relative", "aardvark", "jargon"];
			// words.sort();
			// trace(words);
			// words.sort(Array.CASEINSENSITIVE);
			// trace(words);
			
			
			//----------------------------------------------------------------------------//
			
			
			// by defalut values are sorted according to the ASCII equivalents of the digits rather than in numerical order
			// var scores:Array = [10, 2, 14, 5, 8, 20, 19, 6];
			// scores.sort(  );
			// trace(scores);
			// sort an array of numbers numerically
			// scores.sort(Array.NUMERIC);
			// trace(scores);  
			
			
			//----------------------------------------------------------------------------//
			
			
			// check if the elements in array is unique. if yes sort the array. if no return 0 and exit 
			// var ranking:Array = [2,5,6,3,1,1,4,8,7,10,9];
			// trace(ranking.sort(Array.UNIQUESORT));   
			// trace(ranking); 
			
			
			//----------------------------------------------------------------------------//
			
			
			// var words:Array = ["Tricycle", "relative", "aardvark", "jargon"];
			// // combine more than one midifier
			// words.sort(Array.CASEINSENSITIVE | Array.DESCENDING);
			// trace(words);
			
			
			//----------------------------------------------------------------------------//
			
			
			// // get the sorted order of an array's elements, but don't change the original array 
			/*
			 var words:Array = ["tricycle", "relative", "aardvark", "jargon"];
			var indices:Array = words.sort(Array.RETURNINDEXEDARRAY);
			trace(words); 
			trace(indices); 
			for(var i:int = 0; i < words.length; i++) 
			{
				trace(words[indices[i]]);
			}
			*/
			
			
			//----------------------------------------------------------------------------//
			
			
			// sort associative array by name
			
			/*
			var cars:Array = new Array(  );
			cars.push({make: "Honda",    year: 1997, color: "maroon"});
			cars.push({make: "Chrysler", year: 2000, color: "beige"});
			cars.push({make: "Mercedes", year: 1985, color: "blue"});
			
			// Sort the cars array according to the year property of each element, then by the make.
			// cars.sortOn(["year", "make"]);
			
			// sort array with modifier
			// cars.sortOn("year", Array.DESCENDING);
			
			for (var i:int = 0; i < cars.length; i++) 
			{
			  trace(cars[i].color + "\t" + cars[i].year + "\t" + cars[i].make);
			}
			*/
			
			
			//----------------------------------------------------------------------------//
			
			// // reverses the order of the elements
			// var words:Array = ["1", "2", "3", "4"];
			// words.reverse(  );
			// trace(words);   
			
		}
	}
}
