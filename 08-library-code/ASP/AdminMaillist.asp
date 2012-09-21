
<script language="javascript">
<!--  
  if (window == top)top.location.href = "Default.asp"; 
// -->
</script>
<html>
<head>
<title>南方数据企业网站管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.back_southidc{BACKGROUND-IMAGE:url('image/titlebg.gif');COLOR:000000;}
.table_southidc{BACKGROUND-COLOR: A4B6D7;}
.td_southidc{BACKGROUND-COLOR: F2F8FF;}
.tr_southidc{BACKGROUND-COLOR: ECF5FF;}

.t1 {font:12px 宋体;color:#000000} 
.t2 {font:12px 宋体;color:#ffffff} 
.t3 {font:12px 宋体;color:#ffff00} 
.t4 {font:12px 宋体;color:#800000} 
.t5 {font:12px 宋体;color:#191970} 

.weiqun:hover{
	Font-unline:yes;
	font-family: "宋体";
	color: #FFFFFF;
	text-decoration: underline;
	background-color: #CCCCCC;
}
td {
	font-size: 12px;
}

a:link {
	color: #000000;
	text-decoration: none;
}
a:active {
	color: #000000;
	text-decoration: none;
}
a:visited {
	color: #000000;
	text-decoration: none;
}

-->
</style>
<body>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000" class="border">
  <tr class="topbg"> 
    <td class="back_southidc" height="28" colspan="2" align="center" bgcolor="#FFFFFF"><strong>邮 
      件 列 表 管 理</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF" class="tdbg"> 
    <td width="101" height="30" bgcolor="#A4B6D7"><div align="right">管理导航：</div></td>
    <td width="595" height="30"><a href="AdminMaillist.asp">发送邮件列表</a> | <a href="AdminMaillist.asp?Action=Export">导出邮件列表</a> 
  </tr>
</table>
<br>

<form method="POST" action="AdminMaillist.asp?Action=Send">
  <table width="90%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#000000" Class="border">
    <tr bgcolor="#FFFFFF" class="title"> 
      <td class="back_southidc" height="28" colspan=2 align=center><b> 邮 件 列 表</b></td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td rowspan="3" align="right" bgcolor="#A4B6D7">收件人：</td>
      <td width="85%"> 
        <input type="radio" name="incepttype" value="1">
        邮件发给所有注册用户</td>
    </tr>
    <tr class="tdbg"> 
      <td width="85%" bgcolor="#FFFFFF"> 
        <input type="radio" name="incepttype" value="2">
        按用户姓名发送邮件&nbsp;
        <input type="text" name="inceptname" size="35">
        多个用户名请用<font color="#0000FF">英文的逗号</font>分隔。</td>
    </tr>
    <tr class="tdbg"> 
      <td width="85%" bgcolor="#FFFFFF"> 
        <input name="incepttype" type="radio" value="3" checked>
        按用户Email发送邮件 		
        <input name="inceptemail" type="text" value="" size="35">
        多个用户Email请用<font color="#0000FF">英文的逗号</font>分隔。</td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td width="15%" align="right" bgcolor="#A4B6D7">邮件主题：</td>
      <td width="85%"> 
        <input type=text name=subject size=64>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td align="right" bgcolor="#A4B6D7">邮件内容：</td>
      <td> 
        <textarea cols=80 rows=8 name="content"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td width="15%" align="right" bgcolor="#A4B6D7">发件人：</td>
      <td width="85%"> 
        <input type="text" name="sendername" size="64" value="南方数据企业网站管理系统">
        </td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td width="15%" align="right" bgcolor="#A4B6D7">发件人Email：</td>
      <td width="85%"> 
        <input type="text" name="senderemail" size="64" value="hdz2008@163.com">
        </td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td align="right" bgcolor="#A4B6D7">邮件优先级：</td>
      <td> 
        <input type="radio" name="Priority" value="1">
        高 
        <input type="radio" name="Priority" value="3" checked>
        普通 
        <input type="radio" name="Priority" value="5">
        低</td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td width="15%" align="right" bgcolor="#A4B6D7">注意事项：</td>
      <td width="85%"> 
        信息将发送到所有注册时完整填写了信箱的用户，邮件列表的使用将消耗大量的服务器资源，请慎重使用。
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td colspan=2 align=center> 
        <input name="Action" type="hidden" id="Action" value="Send">
        <input name="Submit" type="submit" id="Submit" value=" 发 送 " >
        &nbsp; 
        <input  name="Reset" type="reset" id="Reset2" value=" 清 除 ">
      </td>
    </tr>
  </table>
</form>

</body>
</html>