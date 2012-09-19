<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<%
set rs=server.createobject("adodb.recordset") ' create record set 
sql="select name,code from student order by id desc" ' sql select column from data base
rs.open sql,conn,1,1 ' execute sql
%>

<guestbook>
<%
do while not rs.eof ' start of the loop to read data 
%> 
    <record>
             <name> <%=rs("name")%> </name>
             <code> <%=rs("code")%> </date>
    </record>
<%
rs.movenext 
loop  ' start of the loop to read data 
%>
</guestbook>

