<%@language=vbscript codepage=936 %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!-- #include file="Inc/Head.asp" -->
<%
dim BigClassID,Action,rs,NewBigClassName,OldBigClassName,FoundErr,ErrMsg
BigClassID=trim(Request("BigClassID"))
Action=trim(Request("Action"))
NewBigClassName=trim(Request("NewBigClassName"))
OldBigClassName=trim(Request("OldBigClassName"))

if BigClassID="" then
  response.Redirect("News_ClassManage.asp")
end if
Set rs=Server.CreateObject("Adodb.RecordSet")
rs.Open "Select * from BigClass_New where BigClassID=" & CLng(BigClassID),conn,1,3
if rs.Bof and rs.EOF then
	FoundErr=True
	ErrMsg=ErrMsg & "<br><li>此产品大类不存在！</li>"
else
	if Action="Modify" then
		if NewBigClassName="" then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>产品大类名不能为空！</li>"
		end if
		if FoundErr<>True then
			rs("BigClassName")=NewBigClassName
    	 	rs.update
			rs.Close
	     	set rs=Nothing
			if NewBigClassName<>OldBigClassName then
				conn.execute "Update SmallClass_New set BigClassName='" & NewBigClassName & "' where BigClassName='" & OldBigClassName & "'"
				conn.execute "Update NEWS set BigClassName='" & NewBigClassName & "' where BigClassName='" & OldBigClassName & "'"
     		end if		
			call CloseConn()
     		Response.Redirect "News_ClassManage.asp" 
		end if
	end if
	if FoundErr=True then
		call WriteErrMsg()
	else
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
</script>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><table width="80%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td align="center" valign="top"><br>
          <br> 
          <br> <form name="form1" method="post" action="News_ClassModifyBig.asp">
              <table width="560" border="0" align="center" cellpadding="2" cellspacing="1" class="table_southidc">
                <tr bgcolor="#A4B6D7" class="back_southidc"> 
                  <td height="25" colspan="2" align="center"><strong>修改新闻大类名称</strong></td>
                </tr>
                
                <tr class="tdbg"> 
                  <td width="126" bgcolor="#99CCFF"><strong>大类名称：</strong></td>
                  <td width="204" class="td_southidc"> <input name="NewBigClassName" type="text" id="NewBigClassName" value="<%=rs("BigClassName")%>" size="20" maxlength="30"></td>
                </tr>
                <tr class="tr_southidc"> 
                  <td align="center">&nbsp;</td>
                  <td align="center"> <div align="left"> 
                      <input name="Action" type="hidden" id="Action" value="Modify">
                      <input name="Save" type="submit" id="Save" value=" 修 改 ">
                      <input name="OldBigClassName" type="hidden" id="OldBigClassName" value="<%=rs("BigClassName")%>">
                      <input name="BigClassID" type="hidden" id="BigClassID" value="<%=rs("BigClassID")%>">
                  </div></td>
                </tr>
              </table>
            </form></td>
        </tr>
      </table>
      <%
	end if
end if
rs.close
set rs=nothing
%> </td>
  </tr>
</table>