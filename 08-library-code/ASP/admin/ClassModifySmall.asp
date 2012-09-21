<%@language=vbscript codepage=936 %>
<!--#include file="Conn.asp"-->
<!--#include file="Admin.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim SmallClassID,Action,BigClassName, SmallClassName, OldSmallClassName,rs,FoundErr,ErrMsg
SmallClassID=trim(Request("SmallClassID"))
Action=trim(Request("Action"))
BigClassName=trim(Request.form("BigClassName"))
SmallClassName=trim(Request.form("SmallClassName"))
OldSmallClassName=trim(request.form("OldSmallClassName"))
if SmallClassID="" then
	response.Redirect("ClassManage.asp")
end if
Set rs=Server.CreateObject("Adodb.RecordSet")
rs.Open "Select * from SmallClass where SmallClassID="&SmallClassID&"",conn,1,3
if rs.Bof or rs.EOF then
	FoundErr=True
	ErrMsg=ErrMsg & "<br><li>此产品小类不存在！</li>"
else
	if Action="Modify" then
		if SmallClassName="" then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>产品小类名不能为空！</li>"
		end if
		if FoundErr<>True then
			rs("SmallClassName")=SmallClassName
     		rs.update
			rs.Close
    	 	set rs=Nothing
			if SmallClassName<>OldSmallClassName then
				conn.execute "Update Product set SmallClassName='" & SmallClassName & "' where BigClassName='" & BigClassName & "' and SmallClassName='" & OldSmallClassName & "'"
	     	end if	
			call CloseConn()
    	 	Response.Redirect "ClassManage.asp"
		end if
	end if
	if FoundErr=True then
		call WriteErrMsg()
	else
%>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <br> <br>
    <br> 
    <br> <br> <form name="form1" method="post" action="ClassModifySmall.asp">
      <table width="560" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#ECF5FF" class="table_southidc">
          <tr bgcolor="#A4B6D7" class="back_southidc"> 
            <td height="25" colspan="2" align="center"><strong>修改小类名称</strong></td>
          </tr>
          <tr> 
            <td width="126" height="22" align="right" bgcolor="#99CCFF"><span style="font-weight: bold">所属大类：</span></td>
            <td width="204" class="td_southidc"><%=rs("BigClassName")%> <input name="SmallClassID" type="hidden" id="SmallClassID" value="<%=rs("SmallClassID")%>"> 
              <input name="OldSmallClassName" type="hidden" id="OldSmallClassName" value="<%=rs("SmallClassName")%>"> 
              <input name="BigClassName" type="hidden" id="BigClassName" value="<%=rs("BigClassName")%>">
            </td>
          </tr>
          <tr> 
            <td width="126" height="22" align="right" bgcolor="#99CCFF"><span style="font-weight: bold">小类名称：</span></td>
            <td class="td_southidc"> 
              <input name="SmallClassName" type="text" id="SmallClassName" value="<%=rs("SmallClassName")%>" size="20" maxlength="30">
            </td>
          </tr>
          <tr class="tdbg"> 
            <td height="22" align="center" bgcolor="#A4B6D7" class="td_southidc">&nbsp;</td>
            <td align="center" class="td_southidc"> 
              <div align="left"> 
                <input name="Action" type="hidden" id="Action4" value="Modify">
                <input name="Save" type="submit" id="Save" value=" 修 改 ">
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
call CloseConn()
%>