<%
DB="Databases/0791idc.mdb"
Response.Buffer=True

on error resume next
Set fso = Server.CreateObject("Scripting.FileSystemObject")
if fso.FolderExists(server.MapPath("Databases"))=false then
DB="../"&DB
end if
set fso=nothing
set conn=server.createobject("adodb.Connection")
connstr="provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(DB)
'connstr= "driver={Microsoft Access Driver(*.mdb)};dbq=" & Server.MapPath(DB)
if err then
err.clear
else
conn.Open connstr
end if
copycolor="#A9A9A9"
%>
<!--#include file="dmwh_info.asp" -->
<!--#include file="dmwh_functions.asp" -->