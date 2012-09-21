<!--#include file="Inc/Conn.asp"-->
<%If Session("UserName")="" Then
response.redirect"Server.asp"
end if

name=request.querystring("name")
id=request.querystring("id")
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "Select * From book where id="&id, conn,3,3

if rs("name")<>name then
response.redirect "NetBook.asp"
end if
%>
<html>
<head>
<title>查看回复留言</title>
<meta name="Contact" content="www.southidc.net 南方数据 QQ:635495">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="mt_style.css" rel="stylesheet" type="text/css">
<body bgcolor="#D9D9D9" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<TABLE width=90% height="400" align="center" cellPadding=4 cellSpacing=1 bgColor=#666666>
  <TBODY>
    <TR vAlign=top bgColor=#eeeeee> 
      <TD  width="100%" height="1" bgcolor="#999999"> 
        <%if rs("name")="管理员" then%>
        <font color="#FFFFFF">『公告标题』：</font> 
        <%else%>
        <font color="#FFFFFF">『您的留言标题』：</font> 
        <%end if%><font color="#006699"><%=rs("title")%></font>
      </TD>
    </TR>
    <TR vAlign=top bgColor=#eeeeee> 
      <TD  width="100%" height="366"> 
        <%if rs("name")="管理员" then%>
        管理员公告： 
        <%else%>
        您的留言内容: 
        <%end if%>
        <div align="center"> 
          <center>
            <table border="0" width="98%" cellpadding="2">
              <tr> 
                <td width="100%"> <%=rs("content")%> </td>
              </tr>
            </table>
          </center>
          <p align="right">（时间：<%=rs("time")%>） </div>
        <div align="center"> 
          <center>
            <table border="0" width="98%" cellpadding="2">
              <tr> 
                <td width="100%">&nbsp; 
                  <%If rs("rebook")<>"" then%>
                  <hr size="1"> <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0"><b>给您的回复</b></p>
                  <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0">　</p>
                  <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0"><font color="#FF0000"><b>亲爱的<%=Session("UserName")%>:</b></font></p>
                  <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0"><font color="#FF0000">&nbsp;&nbsp;&nbsp; 
                    <%=rs("rebook")%> 
                    <%else if rs("name")<>"管理员" Then%>
                    我们的工作人员还未回复您的留言，请耐心等待！ 
                    <%end if%>
                    <%End If%>
                    &nbsp;</font></p></td>
              </tr>
            </table>
             
          </center>
        </div></TD>
    </TR>
    <TR bgColor=#eeeeee> 
      <TD  width="530" height="26" bgcolor="#999999"><div align="center">
          <input type="button" value="关闭" name="B5" onclick="window.close();" style="font-size: 9pt">
        </div></TD>
    </TR>
  </TBODY>
</TABLE>
</body>
</html>