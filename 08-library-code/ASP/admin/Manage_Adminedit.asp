<%@ language="VBScript"%>
<%response.Expires = 0%>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<%
id=request("id")
set rs=server.createobject("adodb.recordset")
sql="select * from admin where Id=" & id
rs.open sql,conn,1,1
%>
<!-- #include file="Inc/Head.asp" -->
<SCRIPT language=javascript id=clientEventHandlersJS>
<!--
function myform_onsubmit()
{
if (document.myform.NewPassword.value!=document.myform.ConPassword.value)
{
alert ("新密码和确认密码不一致。");
document.myform.NewPassword.value='';
document.myform.ConPassword.value='';
document.myform.NewPassword.focus();
return false;
}
}
//-->
</SCRIPT>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <br> <strong><br>
      </strong> <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td class="back_southidc" height="25"> <div align="center"><strong>管理员密码修改</strong></div></td>
        </tr>
        <tr class="tr_southidc"> 
          <FORM language=javascript name=myform  onsubmit="return myform_onsubmit()"
action=Manage_Admineditok.asp?id=<%=rs("Id")%> method=post>            
            <td><table width="50%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr> 
                  <td height="25" colspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="29%" height="22"> <div align="right">管理员帐号：</div></td>
                  <td width="71%"><%=rs("UserName")%></td>
                </tr>
                <tr>
                  <td height="22"><div align="right">旧密码：</div></td>
                  <td><input name="OldPassword" type="password" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">新密码：</div></td>
                  <td><input name="NewPassword" type="password" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">密码确认：</div></td>
                  <td><input name="ConPassword" type="password" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22" colspan="2"><div align="center"> 
                      <INPUT  type=submit value='确认修改' name=Submit2>
                    </div></td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table>
      <br> <strong> </strong></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->