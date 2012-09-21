<!--#include file="Conn.asp"-->
<!--#include file="Admin.asp"-->
<!-- #include file="Inc/Head.asp" -->
<script language="JavaScript" type="text/JavaScript">function checkBig()
{
  if (document.form1.BigClassName.value=="")
  {
    alert("大类名称不能为空！");
    document.form1.BigClassName.focus();
    return false;
  }
}
</script>
<%
dim Action,BigClassName,rs,FoundErr,ErrMsg
Action=trim(Request("Action"))
BigClassName=trim(request("BigClassName"))
if Action="Add" then
	if BigClassName="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>下载大类名不能为空！</li>"
	end if
	if FoundErr<>True then
		Set rs=Server.CreateObject("Adodb.RecordSet")
		rs.open "Select * From BigClass_down Where BigClassName='" & BigClassName & "'",conn,1,3
		if not (rs.bof and rs.EOF) then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>下载大类“" & BigClassName & "”已经存在！</li>"
		else
    	 	rs.addnew
     		rs("BigClassName")=BigClassName
    	 	rs.update
     		rs.Close
	     	set rs=Nothing
    	 	call CloseConn()
			Response.Redirect "Down_ClassManage.asp"  
		end if
	end if
end if
if FoundErr=True then
	call WriteErrMsg()
else
%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"><br>
        <br>
        <form name="form1" method="post" action="Down_ClassAddBig.asp" onSubmit="return checkBig()">
          <table width="560" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#ECF5FF" class="table_southidc">
            <tr class="title">
              <td height="25" colspan="2" align="center" bgcolor="#A4B6D7" class="back_southidc"><strong>添加下载大类</strong></td>
            </tr>
            <tr class="tdbg">
              <td width="126" height="22" bgcolor="#99CCFF"><div align="right"><strong>大类名称：</strong></div></td>
              <td width="218" bgcolor="#ECF5FF"><input name="BigClassName" type="text" size="20" maxlength="30">
              </td>
            </tr>
            <tr class="tdbg">
              <td height="22" align="center" bgcolor="#ECF5FF">&nbsp;</td>
              <td height="22" align="center" bgcolor="#ECF5FF"><div align="left">
                  <input name="Action" type="hidden" id="Action" value="Add">
                  <input name="Add" type="submit" value=" 添 加 ">
              </div></td>
            </tr>
          </table>
        </form></td>
  </tr>
</table>
<br>
<%
end if
%>
