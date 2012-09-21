<!--#include file="dmwh_conn.asp"-->
<!--#include file="Admin.asp"-->
<!-- #include file="Inc/Head.asp" -->
<p>
  <script language=javascript src=../include/mouse_on_title.js></script>
  
  
</p>
<p>&nbsp;</p>
<table width="90%" border="0" align="center" cellpadding="2" cellspacing="1" class="table_southidc"  style="border-collapse: collapse; border-style: dotted; border-width: 0px">
<tr class=back_southidc><td height=25 align="center" class=td style="font-weight: bold">网站访问数据日报表</td>
</tr>
<tr><td bgcolor="#FFFFFF">
  <table width="100%" border="0" cellPadding=3 cellSpacing=1 bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF" class="table_southidc">
  <tr bgcolor="#99CCFF">
    <td width="33%" height="25" bgcolor="#99CCFF">日期</td>
    <td width="33%" height="25" bgcolor="#99CCFF">IP访问量</td>
    <td width="33%" height="25" bgcolor="#99CCFF">当日明细</td>
  </tr>

<%
set rs=Server.CreateObject("ADODB.recordset")
sql="select count(*) as temp, day from count_shop group by day order by day desc"
rs.cursorlocation = 3     '游标
rs.open sql,conn,1,1 
if rs.eof and rs.bof then
%>
  <tr>
    <td height="25" colspan=3 bgcolor="#FFFFFF">暂时没有统计数据</td>
  </tr>
<%
else


pages = 31			'每页记录数
rs.pageSize = pages
allPages = rs.pageCount		'计算一共能分多少页
page = Request("page")
'if语句属于基本的排错处理
if isEmpty(page) or clng(page) < 1 then
page = 1
elseif clng(page) >= allPages then
page = allPages 
end if
rs.AbsolutePage = page


do while not rs.eof and pages>0
%>

  <tr>
    <td height="25" bgcolor="#FFFFFF"><%=rs("day")%></td><td height="25" bgcolor="#FFFFFF"><%=rs("temp")%></td><td height="25" bgcolor="#FFFFFF"><a href="tj3.asp?day=<%=rs("day")%>">查看当日明细</a></td>
  </tr>

<%
pages = pages - 1
rs.movenext
if rs.eof then exit do
loop

end if

rs.close
set rs=nothing
set rs1=nothing
conn.close
set conn=nothing
%>

</table>
<%
call listpages()
%>
</td></tr>
</table>
</body></html>


<%
'分页
sub listPages() 
if allpages <= 1 then exit sub 
if page = 1 then
response.write "<font color=darkgray>首页 前页</font>"
else
response.write "<a href="&request.ServerVariables("script_name")&"?page=1>首页</a> <a href="&request.ServerVariables("script_name")&"?page="&page-1&">前页</a>"
end if
if page = allpages then
response.write "<font color=darkgray> 下页 末页</font>"
else
response.write " <a href="&request.ServerVariables("script_name")&"?page="&page+1&">下页</a> <a href="&request.ServerVariables("script_name")&"?page="&allpages&">末页</a>"
end if
response.write " 第"&page&"页 共"&allpages&"页"
end sub
%>
