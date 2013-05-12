<!--#include file="../Include/Const.Asp" -->
<%
'强制浏览器重新访问服务器下载页面，而不是从缓存读取页面
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.Expires = 0
Response.CacheControl = "no-cache"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>爱克思伦企业管理顾问</title>
<link href="AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="AdminDefaultTheme/MasterPage.css" type="text/css" rel="stylesheet" />
<link href="AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="AdminDefaultTheme/Login.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
<!--
if(self!=top){
    top.location=self.location;
}
CheckBrowser();
var closestr=0;
function SetFocus() {
    if(document.Login.UserName.value == "")
    document.Login.UserName.focus();
    else
    document.Login.UserName.select();
}
function CheckForm() {
    if(document.Login.UserName.value == "") {
        alert("请输入用户名！");
        document.Login.UserName.focus();
        return false;
    }
    if(document.Login.password.value == "") {
        alert("请输入密码！");
        document.Login.password.focus();
        return false;
    }
    if (document.Login.CheckCode.value == "") {
        alert ("请输入您的验证码！");
        document.Login.CheckCode.focus();
        return(false);
    }
}
function CheckBrowser() {
    var app=navigator.appName;
    var verStr=navigator.appVersion;
    if(app.indexOf("Netscape") != -1) {
        alert("友情提示：\n您使用的是Netscape、Firefox或者其他非IE浏览器，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
    }
     else if(app.indexOf("Microsoft") != -1) {
        if (verStr.indexOf("MSIE 3.0")!=-1 || verStr.indexOf("MSIE 4.0") != -1 || verStr.indexOf("MSIE 5.0") != -1 || verStr.indexOf("MSIE 5.1") != -1)
        alert("友情提示：\n您的浏览器版本太低，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
    }
}
function refreshimg(){
    document.all.checkcode.src="../Include/CheckCode/CheckCode.Asp";
}
-->
</script>
</head>

<body id="loginbody">
<form action="CheckLogin.Asp" method="post" name="Login" onSubmit="return CheckForm()">
  <div id="adminboxall">
    <div class="adminboxtop"></div>
    <div id="adminboxmain">
      <div class="menu">
          <input type="image" name="Submit" src="AdminDefaultTheme/LoginImages/admin_menu.gif" style="border-width: 0px; width: 76px; height: 26px;" />
      </div>
    </div>
    <div class="adminboxbottom">
      <div id="login">
        <ul>
          <li class="text">用户名：<br />
            <div class="box1">
              <input name="UserName" type="text" maxlength="20" class="boxcontent" style="font-family: 宋体;" />
            </div>
          </li>
          <li class="text">密 码：<br />
            <div class="box2">
              <input name="password" type="password" maxlength="20" class="boxcontent" />
            </div>
          </li>
          <li class="textCode">验证码：<br />
            <div class="box4">
              <input name="CheckCode" type="password" maxlength="20" class="boxcontent2" style="ime-mode: disabled;" />
              <a href="javascript:refreshimg()" title="看不清楚，换个图片。"><img id="checkcode" src="../Include/CheckCode/CheckCode.Asp" style="border: 1px solid #ffffff" align="absmiddle" /></a></div>
          </li>
        </ul>
      </div>
    </div>
    <a href="http://www.qianbo.com.cn/" target="_blank"><img src="AdminDefaultTheme/LoginImages/admin_text.gif" width="186" border="0" height="10" /></a>
    <div class="clearbox"></div>
  </div>
</form>
</body>
</html>