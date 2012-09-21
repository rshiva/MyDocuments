<%@language=vbscript codepage=936 %>
<!--#include file="Conn.asp"-->
<!--#include file="Admin.asp"-->
<!--#include file="Inc/Head.asp" -->
<%
dim sql,rsBigClass,rsSmallClass,ErrMsg
set rsBigClass=server.CreateObject("adodb.recordset")
rsBigClass.open "Select * From BigClass_Down",conn,1,3
%>
<script language="JavaScript" type="text/JavaScript">
function checkBig()
{
  if (document.form1.BigClassName.value=="")
  {
    alert("大类名称不能为空！");
    document.form1.BigClassName.focus();
    return false;
  }
}
function checkSmall()
{
  if (document.form2.BigClassName.value=="")
  {
    alert("请先添加大类名称！");
	document.form1.BigClassName.focus();
	return false;
  }

  if (document.form2.SmallClassName.value=="")
  {
    alert("小类名称不能为空！");
	document.form2.SmallClassName.focus();
	return false;
  }
}
function ConfirmDelBig()
{
   if(confirm("确定要删除此大类吗？删除此大类同时将删除所包含的小类和该类下的所有新闻，并且不能恢复！"))
     return true;
   else
     return false;
	 
}

function ConfirmDelSmall()
{
   if(confirm("确定要删除此小类吗？删除此小类同时将删除该类下的所有新闻，并且不能恢复！"))
     return true;
   else
     return false;
	 
}
</script>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td align="center" valign="top"><table width="560" border="0">
            <tr>
              <td><font color="#000000">管理选项：<a href="Down_ClassAddBig.asp"><strong>添加下载大类</strong></a></font></td>
            </tr>
          </table>
            <table width="560" border="0" cellpadding="2" cellspacing="1" bgcolor="#000000" class="table_southidc">
              <tr bgcolor="#A4B6D7" class="back_southidc">
                <td height="30" colspan="2" align="center"><strong>下 载 类 别 设 置</strong></td>
              </tr>
              <tr bgcolor="#A4B6D7"> 
                <td width="50%" height="25" align="center" bgcolor="#99CCFF"><strong>栏目名称</strong></td>
                <td height="25" align="center" bgcolor="#99CCFF"><strong>操作选项</strong></td>
              </tr>
              <%
	do while not rsBigClass.eof
%>
              <tr bgcolor="#ECF5FF" class="tdbg"> 
                <td width="50%" height="22" bgcolor="#ECF5FF"><img src="../Images/tree_folder4.gif" width="15" height="15"><%=rsBigClass("BigClassName")%></td>
                <td align="right" bgcolor="#ECF5FF" style="padding-right:10"><a href="Down_ClassAddSmall.asp?BigClassName=<%=rsBigClass("BigClassName")%>"><font color="#000000">添加二级分类</font></a> 
                  | <a href="Down_ClassModifyBig.asp?BigClassID=<%=rsBigClass("BigClassID")%>">修改</a> 
                  | <a href="Down_ClassDelBig.asp?BigClassName=<%=rsBigClass("BigClassName")%>" onClick="return ConfirmDelBig();">删除</a></td>
              </tr>
              <%
	  set rsSmallClass=server.CreateObject("adodb.recordset")
	  rsSmallClass.open "Select * From SmallClass_down Where BigClassName='" & rsBigClass("BigClassName") & "'",conn,1,1
	  if not(rsSmallClass.bof and rsSmallClass.eof) then
		do while not rsSmallClass.eof
	%>
              <tr bgcolor="#EAEAEA" class="tdbg"> 
                <td width="50%" height="22" bgcolor="#E3E3E3">&nbsp;&nbsp;<img src="../Images/tree_folder3.gif" width="15" height="15"><%=rsSmallClass("SmallClassName")%></td>
                <td align="right" bgcolor="#E3E3E3" style="padding-right:10"><a href="Down_ClassModifySmall.asp?SmallClassID=<%=rsSmallClass("SmallClassID")%>">修改</a> 
                  | <a href="Down_ClassDelSmall.asp?SmallClassID=<%=rsSmallClass("SmallClassID")%>&SmallClassName=<%=rsSmallClass("SmallClassName")%>" onClick="return ConfirmDelSmall();">删除</a></td>
              </tr>
              <%
			rsSmallClass.movenext
		loop
	  end if
	  rsSmallClass.close
	  set rsSmallClass=nothing	
	  rsBigClass.movenext
	loop
%>
            </table>
          <br> </td>
        </tr>
      </table>
      <%
rsBigClass.close
set rsBigClass=nothing
%> <br>
      <a href="Down_ClassAddBig.asp"></a></td>
  </tr>
</table>