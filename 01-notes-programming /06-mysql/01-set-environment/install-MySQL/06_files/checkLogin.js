function GetCookie(sName)
{
	var aCookie = document.cookie.split("; ");
	for (var i=0; i < aCookie.length; i++)
	{
		var aCrumb = aCookie[i].split("=");
		if (sName == aCrumb[0])
		return unescape(aCrumb[1]);
	}
	return null;
}
var v_name=GetCookie('d_name');

var ologin = document.getElementById('userLogin_div');
if(ologin)
{
	if(v_name == '' || v_name==null)
	{
		ologin.innerHTML='<a href="http://login.duote.com/login.php">µÇÂ¼</a> | <a href="http://login.duote.com/reg.php">×¢²á</a>';
	}
	else
	{
		var v_name = GetCookie('d_name_ie');
		var v= v_name.split('%');
		if(v.length>1){
			v_name ='';for(i=0;i<v.length;i++)if(v[i]>0) v_name +=String.fromCharCode(v[i])
		}else{
			v_name = GetCookie('d_name');
		}
		ologin.innerHTML='ÄúºÃ,<a href="http://login.duote.com/my/" style=" color:#1f3d99; text-decoration:underline">'+v_name+'</a>! <a href="http://login.duote.com/login.php?cmd=logout" target="_self" style=" color:#1f3d99; text-decoration:underline">ÍË³ö</a>';
	}
}