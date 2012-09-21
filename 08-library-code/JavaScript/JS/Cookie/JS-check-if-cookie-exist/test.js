function checkCookie(){
	username=getCookie('username');
	if (username!=null && username!=""){
		alert('Welcome again '+username+'!');
	}else{
		username=prompt('Please enter your name:',"");
		if (username!=null && username!=""){
			setCookie('username',username,365);
		}
	}
}