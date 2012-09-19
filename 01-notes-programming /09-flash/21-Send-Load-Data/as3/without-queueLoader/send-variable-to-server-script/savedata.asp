<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")  ' create record set 
sql="select name,code from student" ' SQL
rs.open sql,conn,1,3
rs.addnew
rs("name")=request("name")  ' receive variable
rs("code")=request("code")  ' receive variable
rs.update ' update data base
rs.close ' release 
set rs=nothing
conn.close
set rs=nothing
response.Write("data received") 
%>

