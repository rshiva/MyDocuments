<!--#include file="Conn.asp"-->
<!--#include file="articleCHAR.INC"-->
<%
If request.form("CompanyName")="" Then
Response.Write("<script language=""JavaScript"">alert(""错误：您没输入公司名称，请返回检查！！"");history.go(-1);</script>")
response.end
end if
If request.form("Receiver")="" Then
Response.Write("<script language=""JavaScript"">alert(""错误：您没输入联系人，请返回检查！！"");history.go(-1);</script>")
response.end
end if
If request.form("Phone")="" Then
Response.Write("<script language=""JavaScript"">alert(""错误：您没输入联系电话，请返回检查！！"");history.go(-1);</script>")
response.end
end if
If request.form("title")="" Then
Response.Write("<script language=""JavaScript"">alert(""错误：您没输入标题，请返回检查！！"");history.go(-1);</script>")
response.end
end if
If request.form("content")="" Then
Response.Write("<script language=""JavaScript"">alert(""错误：您没输入留言内容，请返回检查！！"");history.go(-1);</script>")
response.end
end if

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from book"
rs.open sql,conn,1,3


rs.addnew
rs("name")=htmlencode2(request.form("name"))
rs("CompanyName")=htmlencode2(request.form("CompanyName"))
rs("Receiver")=htmlencode2(request.form("Receiver"))
rs("Phone")=htmlencode2(request.form("Phone"))
rs("Fax")=htmlencode2(request.form("Fax"))
rs("email")=htmlencode2(request.form("email"))
rs("title")=htmlencode2(request.form("title"))
rs("content")=htmlencode2(request.form("content"))
rs("time")=date()
rs.update
rs.close

if request.form("name")="未注册用户" then
response.redirect "Feedback_ok.asp"
else
response.redirect "NetBook.asp"
end if
%>