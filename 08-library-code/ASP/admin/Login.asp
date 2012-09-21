<%@language=vbscript codepage=936 %>

<%
option explicit
'强制浏览器重新访问服务器下载页面，而不是从缓存读取页面
Response.Buffer = True 
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
'主要是使随机出现的图片数字随机
%>
<html>
<head>
<title>管理员登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
BODY
{
FONT-FAMILY: "宋体";
FONT-SIZE: 9pt;
text-decoration: none;
line-height: 150%;
background-color: #f7f7f7;
FONT-SIZE: 9pt;background:#ffffff;
text-decoration: none;
SCROLLBAR-FACE-COLOR: #DDDDDD; 
SCROLLBAR-HIGHLIGHT-COLOR: #FFFFFF; 
MARGIN-LEFT: 5px; 
SCROLLBAR-SHADOW-COLOR: #CCCCCC; 
SCROLLBAR-3DLIGHT-COLOR: #848484; 
SCROLLBAR-ARROW-COLOR: #ffffff; 
SCROLLBAR-DARKSHADOW-COLOR: #848484
}




TD{	FONT-FAMILY: "宋体";	FONT-SIZE: 9pt;}
Input{	FONT-SIZE: 9pt;	HEIGHT: 20px;}
Button{	FONT-SIZE: 9pt;	HEIGHT: 20px; }
Select{	FONT-SIZE: 9pt;	HEIGHT: 20px;}
A{	TEXT-DECORATION: none;	color: #000000;}
A:hover{	COLOR: #428EFF;	text-decoration: underline;}
.border{	border: 1px solid #39867B;}
.tdbg{	background:#E1F4EE;	line-height: 120%;}
-->
</style>
<script language=javascript>
<!--
function turnit(ss)   //紧缩表格
{ss.style.display="none"}
function gogo(xx){
a.style.display='none';
b.style.display='none';
c.style.display='none';
xx.style.display='';
}



function SetFocus()
{
if (document.Login.UserName.value=="")
	document.Login.UserName.focus();
else
	document.Login.UserName.select();
}
function CheckForm()
{
	if(document.Login.UserName.value=="")
	{
		alert("请输入用户名！");
		document.Login.UserName.focus();
		return false;
	}
	if(document.Login.Password.value == "")
	{
		alert("请输入密码！");
		document.Login.Password.focus();
		return false;
	}
	if (document.Login.CheckCode.value==""){
       alert ("请输入您的验证码！");
       document.Login.CheckCode.focus();
       return(false);
    }
}

function CheckBrowser() 
{
  var app=navigator.appName;
  var verStr=navigator.appVersion;
  if (app.indexOf('Netscape') != -1) {
}
//-->
</script>
</head>
<body class="bgcolor">
<p>&nbsp;</p>
<center>
<form name="Login" action="Admin_ChkLogin.asp" method="post" target="_parent" onSubmit="return CheckForm();">
<TABLE width=96% border=0 align="center" cellPadding=0 cellSpacing=0>
  <TBODY>
  <TR>
    <TD height="450" align=middle vAlign=top>
      <TABLE width=583 border=0 align="center" cellPadding=0 cellSpacing=0>
        <TBODY>
          <TR>
            <TD vAlign=top align=middle height=380>
              <TABLE cellSpacing=0 cellPadding=0 width=500 border=0>
                <TBODY>
                  <TR>
                    <TD height=70>&nbsp;</TD>
                </TR></TBODY></TABLE>   
		  <TABLE cellSpacing=1 cellPadding=0 width=500 bgColor=#cccccc 
            border=0>
		    <TBODY>
		      <TR>
		        <TD vAlign=top bgColor=#f7f7f7 height=230>
		          
		          <TABLE cellSpacing=0 cellPadding=0 width=498 border=0>
		            <TBODY>
		              <TR>
		                <TD vAlign=bottom height=121><img height=120 
                        src="Image/login2.jpg" width=498></TD>
                      </TR>
		              <TR>
		                <TD align=middle height=140><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#eeeeee">
		                  <tr>
		                    <td align="right">&nbsp;</td>
                            <td height="15">&nbsp;</td>
                          </tr>
		                  <tr>
		                    <td width="38%" align="right"><font color="#000000">用户名称：</font></td>
                            <td width="62%"><input name="UserName"  type="text"  id="UserName4" maxlength="20" style="width:160px;border-style:solid;border-width:1;padding-left:4;padding-right:4;padding-top:1;padding-bottom:1" onMouseOver="this.style.background='#e4e4e4';" onMouseOut="this.style.background='#FFFFFF'" onFocus="this.select(); "></td>
                          </tr>
		                  <tr>
		                    <td align="right"><font color="#000000">用户密码：</font></td>
                            <td><input name="Password"  type="password" maxlength="20" style="width:160px;border-style:solid;border-width:1;padding-left:4;padding-right:4;padding-top:1;padding-bottom:1" onMouseOver="this.style.background='#e4e4e4';" onMouseOut="this.style.background='#FFFFFF'" onFocus="this.select(); "></td>
                          </tr>
		                  <tr>
		                    <td align="right"><font color="#00000">验 证 码：</font></td>
                            <td><input name="CheckCode" size="6" maxlength="4" style="border-style:solid;border-width:1;padding-left:4;padding-right:4;padding-top:1;padding-bottom:1" onMouseOver="this.style.background='#e4e4e4';" onMouseOut="this.style.background='#FFFFFF'" onFocus="this.select(); ">
                              <font color="#FF0000">请在左边输入</font> <img src="inc/checkcode.asp"></td>
                          </tr>
		                  <tr>
		                    <td rowspan="3">&nbsp;</td>
		                    <td height="10" align="left">&nbsp;</td>
		                    </tr>
		                  <tr>
		                    <td height="29" align="left"><input   type="submit" name="Submit" value=" 确&nbsp;认 " >
                              <input name="reset" type="reset"  id="reset" value=" 清&nbsp;除 " >
                              <br></td>
                          </tr>
		                  <tr>
		                    <td height="50" align="left">&nbsp;</td>
		                    </tr>
		                  </table></TD>
                    </TR></TABLE></TD></TR></TABLE>
              <TABLE cellSpacing=0 cellPadding=0 width=500 border=0>
                <TBODY>
                  <TR>
                    <TD height=20><IMG height=20 src="Image/shape01.jpg" 
                  width=498></TD>
              </TR></TBODY></TABLE></TD></TR>
      </TABLE></TD>
    </TR></TBODY></TABLE>
  </form>
</CENTER></BODY></HTML>
<script language="JavaScript" type="text/JavaScript">
CheckBrowser();
SetFocus(); 
</script>
