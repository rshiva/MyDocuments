<% 
' 连接数据库
set conn=server.createobject("adodb.connection")
conn.open "driver={microsoft access driver (*.mdb)};dbq="&server.mappath("database.mdb")
%>

<%
' 查询数据
exec="select * from student"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn
%>

<%
' 开始写根节点
response.Write("<class>" & chr(13))
%>

<%
' 循环写各条记录
while not rs.EOF
	response.Write("<student>" & chr(13))
	response.Write(chr(9) & "<name>" & rs("name") & "</name>" & chr(13))
	response.Write(chr(9) & "<code>" & rs("code") & "</code>" & chr(13))
	response.Write("</student>"  & chr(13))
	rs.moveNext
wend
%>

<%
' 完成写根节点
response.Write("</class>")
%>