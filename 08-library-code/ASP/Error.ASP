<!--#include file="inc/conn.asp" -->
<SCRIPT RUNAT=SERVER LANGUAGE=JAVASCRIPT></SCRIPT>
<style type="text/css">
<!--
td {
	font-size: 12px;
}
-->
</style>
<%on error resume next%>
<%error=request("error")%>
<html>
<head><title>操作提示 </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="Robots" content="index,follow">
</head>

<body bgcolor="#ffffff" leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr> 
    <td align="center" valign="middle"> 
      <table width="420" border="1" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF" bordercolor="#333300">
        <tr> 
          <td align="center"><font color="#000000"> 
            <%if error="001" then%>
            <br>
            <font size="2">对不起，您不是从本服务器上提交的表单信息！！！ 请进行正常操作<br>
            点此<a href="index.asp">返回首页</a><br>
            <%end if%>
            <%if error="002" then%>
            <br>
            对不起，您所选择的用户号已经被注册了<br>
            <br>
            您可以点此<a href="UserReg.asp">重新注册</a>您的帐号<br>
            <br>
            <%end if%>
            <%if error="003" then%>
            <br>
            对不起，没有您所填写的用户号，或者该用户号已经冻结<br>
            <br>
            您可以点此<a href="index.asp">重新登陆</a>您的帐号<br>
            <br>
            或者点此<a href="UserReg.asp">立即注册</a>新的帐号<br>
            <br>
            <%end if%>
            <%if error="004" then%>
            <br>
            对不起，您的密码错误.<br>
            <br>
            您可以点此<a href="index.asp">重新登陆</a>您的帐号<br>
            <br>
            如果密码遗忘，请管理员联系找回密码，您也可<a href="UserReg.asp">重新注册</a>一个帐号<br>
            <%end if%>
            <%if error="005" then%>
            <br>
            对不起，您的帐号已经登陆过了<br>
            <br>
            请您不要重复登陆，点此<a href="index.asp">返回首页</a><br>
            <%end if%>
            <%if error="006" then%>
            </font></font><font color="#CC3333"><font size="2">
            <p><font color="#000000" size="2"><br>
              亲爱的用户，您没有注册或者没有登陆，请先登陆或注册！<br>
              登陆后会自动回到刚才的页面<br>
              <br>
              点此<a href="index.asp">登陆</a> <br>
              <%end if%>
              <%if error="007" then%>
              <br>
              对不起，您的购物车为空<br>
              <br>
              点此<a href="index.asp">重新购物</a><br>
              <%end if%>
              <%if error="008" then%>
              <br>
              对不起，并没有这个帐号.<br>
              <br>
              请您检查后重新输入<br>
              <br>
              点此<a href="index.asp">返回首页</a><br>
              <br>
              <%end if%>
              <%if error="010" then%>
              <br>
              对不起，您输入的验证码有误<br>
              <br>
              <a href="index.asp">请您重新登陆</a><br>
              <%end if%>
              <br>
              <br>
              </font></font></font></td>
        </tr>
      </table>
      <br>
<div align=center><font color="#333333">&copy; 2002-2004 <B></B> 版权所有</font><br>
</div>
    </td>
  </tr>
</table>
</body>
</html>

