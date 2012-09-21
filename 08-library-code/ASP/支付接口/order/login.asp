<!--#include file="../paysettings.asp"-->
<!--#include file="mysqlfire.asp"-->
<%
'#############################################################
'#              贺喜支付平台支付接口定单管理系统
'#                            v2.0
'#                   http://www.168reg.cn
'#
'#  版权所有: 株洲市和谐网络科技发展有限公司
'#
'#  主页地址: http://www.168reg.cn
'#  技术支持: support@168reg.cn
'#  技 术 QQ: 359465724
'#  技术QQ群：8246422，7048987
'#
'#############################################################
'# ·郑重声明:
'# ·此定单系统仅提供简易版定单管理功能，其他功能，请自行开发。
'# ·由于用户原因，可能导致定单数据丢失，请经常登录管理区查看定单。
'# ·此程序不得随意公开发布、销售或进行其他非法转让。
'# ·如对此程序有任何疑问，请在管理区留言。
'#############################################################
if Request.Form("orderuser")<>"" and Request.Form("orderpass")<>"" then
	if Request.Form("orderuser")=orderuser and Request.Form("orderpass")=orderpass then
		session("adminorder")=orderuser
		Response.Redirect("vieworder.asp")
		Response.end
	else
		Response.write "用户名和登录密码错误，请返回"
		Response.end
	end if
end if
%>
<html>
<head>
<title>定单管理系统登录</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body text="#FFFFFF" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<div align="center">
                  <table border="0" width="100%" cellspacing="0" cellpadding="0">
                    <tr>
<td valign="top" width="100%">
<br>
<form method="POST" action="login.asp">
<div align="center">
  <center>
<table cellpadding="3" cellspacing="0" border="0" width="50%">
<tr class="innerborder">
<td valign="top" nowrap align="center" colspan="2">
  <p align="center"><b>定单管理系统－登录</b></p>
</td>
</tr>
<tr class="active">
<td valign="middle" nowrap width="30%" align="right"><b>用 户 名:</b></td>       
<td valign="middle" nowrap width="70%"><input type="text" name="orderuser" size="20" maxlength="15"></td>
</tr>
<tr class="active">
<td valign="middle" nowrap width="30%" align="right"><b>密　　码:</b></td>
<td valign="middle" nowrap width="70%"><input type="password" name="orderpass" size="20" maxlength="16"></td>
</tr>
<tr class="active">
<td valign="middle" nowrap width="30%" align="right"></td>      
<td valign="middle" nowrap width="70%"><input type="submit" value="登 录" name="submit" style="background-color: #8099CC; color: #FFFFFF"></td>
</tr>
</table>
  </center>
</div>
</form>
</td>
                    </tr>
                  </table>
</div>
</BODY></HTML>