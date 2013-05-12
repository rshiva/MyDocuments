<!--#include file="Include/Const.Asp" -->
<!--#include file="Include/ConnSiteData.Asp" -->
<% 
keren=request.cookies("keren")
if keren="" then
sql="SELECT * FROM tab where id=-1" 
set rs=server.createobject("ADODB.Recordset") 
rs.Open sql,conn, 1, 3 
rs.addnew 
rs("cs")=1
rs("ip")=request.servervariables("remote_addr")
rs("dat")=now 
rs("dat1")=date
response.cookies("keren")=rs("id")
response.cookies("keren").expires=date+1 

else 
sql="SELECT * FROM tab where id="&keren 
set rs=server.createobject("ADODB.Recordset") 
rs.Open sql,conn, 1, 3 
rs("cs")=rs("cs")+1 
rs("ip")=request.servervariables("remote_addr") 
rs("dat")=now 
response.cookies("keren")=rs("id") 
response.cookies("keren").expires=date+1

end if 
rs.update 
rs.close
set conn=nothing 
%>