<!--#include file="../Include/Const.Asp" -->
<!--#include file="../Include/ConnSiteData.Asp" -->
<!--#include file="CheckAdmin.Asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="Images/Admin_style.css">
<%
If InStr(session("AdminPurview"), "|1,") = 0 Then
    response.Write ("<br /><br /><div align=""center""><font style=""color:red; font-size:9pt; "")>您没有查看该模块的权限！</font></div>")
    response.End
End If%>
<br />
<table class="tableBorder" width="95%" border="0" align="center" cellpadding="5" cellspacing="1">
<tr><td class="forumRow">
<%page3=request("pag") 
if page3="" then page3=session("contpag") '分页数，当前分页 
if page3="" then page3="1" 
pa=request("pa") 
if pa="" then pa=session("contpa") '每页显示数 
if pa="" then pa=15 '默认每页显示15条，可任意改 
session("contpag")=page3 
session("contpa")=pa 
pages=pa '每页显示数量***************以上一段程序用于实现分页功能 
SQL="SELECT * FROM tab order by -dat,-id" 
dim rs 
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.Open sql,conn,1,1 
csi=0 
cs1=0 
cs100=0 
csdat1=0 
do while not rs.eof 
csi=csi+rs("cs") 
if rs("cs")=1 then cs1=cs1+1 
if rs("cs")>=100 then cs100+1 
if datevalue(rs("dat"))=date then 
csdat1=csdat1+1 
end if 
rs.movenext 
loop 
ZS=RS.RECORDCOUNT 
'*****************************************************8以下一段程序用于分页显示 
%> 
共有<%Response.Write zs%>条记录，现在是第<%Response.Write page3%>页 每页显示：[<a href="dispcont.asp?pag=<%=page3%>&pa=15">15]条、[<a href="dispcont.asp?pag=<%=page3%>&pa=20">20]条、[<a href="dispcont.asp?pag=<%=page3%>&pa=30">30]条、[<a href="dispcont.asp?pag=<%=page3%>&pa=40">40]条 
[<a href="dispcont.asp">刷新] 
<div align="left"> 
<table border="0" cellpadding="0" style="font-size: 9pt"> 
<tr><td>页码</td><%page2=1 
for i=1 to zs step pages 
if page3=cstr(page2) then 
%><td >[<%Response.Write page2%>]</td> 
<% else %> 
<td ><a href="dispcont.asp?pag=<%Response.Write page2%>">[<%Response.Write page2%>]</td> 
<% end if 
page2=page2+1 
next 
sn=pages*(page3-1) '当前记录号=每页显示数*页数-每页显示数 
if sn>zs then sn=0 
rs.move sn,1 
'**********************************以上一段用于分页 
%> </tr></table> 
</div> <table style="font-size: 9pt" width="100%" bordercolorlight="#000000" border="1" bordercolordark="#FFFFFF" bgcolor="#A4D1E8" cellspacing="0" cellpadding="3"> 
<tr><td>编号</td><td>最后访问时间</td><td>最后访问IP</td><td>访问次数</td><td>首次访问日期</td></tr><% 
for i=1 to pages 
Response.Write "</tr>" 
Response.Write "<td>"&rs("ID")&"</td>" 
Response.Write "<td>"&rs("dat")&"</td>" 
Response.Write "<td>"&rs("IP")&"</td>" 
Response.Write "<td>"&rs("CS")&"</td>" 
Response.Write "<td>"&rs("DAT1")&" </td>" 
Response.Write "</tr>" 
rs.movenext 
if rs.eof then exit for 
next 
rs.close 
%> 
<tr><td>合计<%=zs%></td><td>访问次数为100次以上的有<%=cs100%> </td><td>访问次数为1的有：<%=cs1%></td><td>总访问次数<%=csi%></td><td>今天访问量：<%=csdat1%></td></tr> 
</table>
	</td>
    </tr>
</table>
<br />