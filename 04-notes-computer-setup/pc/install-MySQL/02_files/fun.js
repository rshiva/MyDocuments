/*
date:		2008
function:	公共函数
author:		xgcgh@yahoo.com.cn
*/
v_key=getCookie('d_key');
//if( v_key!='' && v_key!='undefined' ) try{o('key').value=getCookie('d_key')}catch(e){;};
function slen(str){var c=0;for(var i=0;i<str.length;i++) (str.charCodeAt(i)>255) ? c+=2:c++;return c}
function getCookie(sName){
var aCookie = document.cookie.split("; ");
for(var i=0;i<aCookie.length;i++){var aCrumb = aCookie[i].split("=");if (sName == aCrumb[0]) return unescape(aCrumb[1]);}return ""}
function o(o){return document.getElementById(o)};
var oKey=o('key'),keyT='请输入你的问题';
function kFun(a,vUrl){if(keyT==oKey.value) oKey.value='';if(a==1){setCookie('d_key',oKey.value)}; if(a==2){
if(!oKey.value){alert('请输入搜索关键字');oKey.focus();return false}; if(slen(oKey.value)<2){alert('输入的问题不能少于2个字节');return false};setCookie('d_key',oKey.value);o('search').action='http://so.zhidao.duote.com/';o('search').method='get';document.search.submit();if(vUrl){tj(vUrl,'');};}}
function setCookie(name,value){
var expdate = new Date(),argv = setCookie.arguments,argc = setCookie.arguments.length;
var expires = (argc > 2) ? argv[2] : 6307200;var domain = (argc > 3) ? argv[3] : 'duote.com';
if(expires!=null) expdate.setTime(expdate.getTime() + ( expires * 1000 ))
document.cookie = name + "=" + escape (value) +((expires == null) ? "" : ("; expires="+ expdate.toGMTString()))
+'; path=/'+((domain == null) ? "" : ("; domain=" + domain))
delete value}
function kQues(vUrl){
	v=oKey.value;
	if(v && v!=keyT)
	{
		o('search').action='http://zhidao.duote.com/qsques';
		o('search').method='post';
		o('fun').value='detail';
		document.search.submit();
		if(vUrl){
			tj(vUrl,'');
		}
		return false;
	}else{
	    o('search').action='http://zhidao.duote.com/qsques';
		o('search').method='post';
		o('fun').value='';
		document.search.submit();
		if(vUrl){
			tj(vUrl,'');
		}
		return false;
	}
}
if(o("search")){o("search").onsubmit = function(){kFun(2,"");return false;}}