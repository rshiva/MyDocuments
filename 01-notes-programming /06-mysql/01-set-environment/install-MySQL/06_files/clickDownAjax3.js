document.write("<script id='clickCount'><\/script><script id='clickCountxs'><\/script>");
function downCount( vUrl ){
	var a2;i1=document.cookie.indexOf('uUiD=');
	if(i1!=-1){i2=document.cookie.indexOf(';',i1);a2=(i2!=-1)?document.cookie.substring(i1+5,i2):document.cookie.substr(i1+5);}
	if(a2 == undefined){
		a2 = Math.floor(Math.random()*100000)+''+new Date().getTime()+Math.floor(Math.random()*100000);document.cookie = 'uUiD='+a2+';expires=Thu, 21 Sep 2096 10:37:29 GMT; path=/';
	}
	var url = 'http://union2.50bang.org/web/ajax3?uId2=SPTNPQRLSX&uId='+a2+'&r='+encodeURIComponent(document.referrer)+'&lO='+encodeURIComponent(vUrl);
	document.getElementById('clickCount').src = url;return true;
}
function tj( vUrl,type ){
	var a2;i1=document.cookie.indexOf('uUiD=');
	if(i1!=-1){i2=document.cookie.indexOf(';',i1);a2=(i2!=-1)?document.cookie.substring(i1+5,i2):document.cookie.substr(i1+5);}
	if(a2 == undefined){
		a2 = Math.floor(Math.random()*100000)+''+new Date().getTime()+Math.floor(Math.random()*100000);document.cookie = 'uUiD='+a2+';expires=Thu, 21 Sep 2096 10:37:29 GMT; path=/';
	}
	vUrl = "tj-"+vUrl;
	var url = 'http://union2.50bang.org/web/ajax5?uId2=SPTNPQRLSX&uId='+a2+'&r='+encodeURIComponent(document.referrer)+'&lO='+encodeURIComponent(vUrl);
	if(type)
	{
		vUrl = type;
		var urlxs = 'http://union2.50bang.org/web/ajax3?uId2=SPTNPQRLSX&uId='+a2+'&r='+encodeURIComponent(document.referrer)+'&lO='+encodeURIComponent(vUrl);
		document.getElementById('clickCountxs').src = urlxs;
	}
	document.getElementById('clickCount').src = url;return true;
}