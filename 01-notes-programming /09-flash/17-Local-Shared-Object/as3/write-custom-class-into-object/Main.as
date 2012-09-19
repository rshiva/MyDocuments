package {
	import flash.events.*;
	import flash.display.*;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	import flash.net.registerClassAlias;
	import Person;
	

    public class Main extends Sprite {
		
        public function Main(  ) {
			// Map "Person" to the Person class
			registerClassAlias( "Person", Person );
			
			// Create a shared object and store a Person instance in it
			var example:SharedObject = SharedObject.getLocal( "example" );
			
			// Test to see if the person instance has been saved already
			if ( example.data.person == undefined ) {
				var person:Person = new Person("Darron", 24);
				// Write the class instance to the local shared object
				example.data.person = person;
			}
			
			example.data.person.detail(  );
		}
	}
}
