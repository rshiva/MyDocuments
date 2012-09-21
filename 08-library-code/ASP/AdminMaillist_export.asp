
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

<form method="POST" action="AdminMaillist.asp?Action=DoExport">
  <table width="90%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#000000" Class="border">
    <tr bgcolor="#FFFFFF" class="title"> 
      <td  height="28" colspan=2 align=center class="back_southidc"><b> 邮件列表批量导出到数据库</b></td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td width="24%" height="80" align="right" bgcolor="#A4B6D7">导出邮件列表到数据库：</td>
      <td width="76%" height="80"> 
        <input name="ExportType" type="hidden" id="ExportType" value="1">
        &nbsp;&nbsp;<font color=blue>导出</font>&nbsp;&nbsp; 
        <select name="UserType" id="UserType">
          <option value="0" selected>全部用户</option>          
        </select>
        &nbsp;<font color=blue>到</font>&nbsp;
        <input name="ExportFileName" type="text" id="ExportFileName" value="Emaillist.mdb" size="30" maxlength="200">
        <input name="Submit1" type="submit" id="Submit1" value="开始">
      </td>
    </tr>
  </table>
</form>
<form method="POST" action="AdminMaillist.asp?Action=DoExport">
  <table width="90%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#000000" Class="border">
    <tr bgcolor="#FFFFFF" class="title"> 
      <td height="28" colspan=2 align=center class="back_southidc"><b>邮件列表批量导出到文本</b></td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td width="24%" height="80" align="right" bgcolor="#A4B6D7">导出邮件列表到数据库：</td>
      <td width="76%" height="80"> 
        <input name="ExportType" type="hidden" id="ExportType" value="2">
        &nbsp;&nbsp;<font color=blue>导出</font>&nbsp;&nbsp; 
        <select name="UserType" id="UserType">
          <option value="0" selected>全部用户</option>        
        </select>
        &nbsp;<font color=blue>到</font>&nbsp;
		<input name="ExportFileName" type="text" id="ExportFileName" value="Emaillist.txt" size="30" maxlength="200">
        <input type="submit" name="Submit2" value="开始" > 
		
      </td>
    </tr>
  </table>
</form>

</body>
</html>