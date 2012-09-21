// name=tasty1&fav=Chocolate Chip

function read_it() {
	var mycookie=document.cookie;
	
	var fixed_cookie= unescape(mycookie); // switch characters back
	var thepairs= fixed_cookie.split("&"); // remove divid characters, this method will return an array
	var pair1=thepairs[0]; // assign array elements to variable 
	var pair2=thepairs[1];
	var namevalue1=pair1.split("="); // remove "="
	var namevalue2=pair2.split("=");
}