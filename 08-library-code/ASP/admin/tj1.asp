<!--#include file="dmwh_conn.asp"-->
<!--#include file="Admin.asp"-->
<!-- #include file="Inc/Head.asp" -->
<p>
  <script language=javascript src=../include/mouse_on_title.js></script>
  
  <%
action = request.form("del")
if action="ok" then

Set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from count_total"
rs.open sql,conn,1,3
rs("total")=0		'总访问量置0
rs("yesterday")=0	'昨天访问量置0
rs("today")=0		'今天访问量置0
rs.update
conn.execute "delete from count_shop"
rs.close
set rs=nothing

response.write "<script language='javascript'>"
response.write "alert('统计数据已被清除，系统将从现在开始重新统计。');"
response.write "</script>"
end if

conn.execute("delete from count_online where datediff('h',time,now())>1")

Set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from count_total"
rs.open sql,conn,1,3
total=rs("total")		'总访问量
yesterday=rs("yesterday")	'昨天访问量
today=rs("today")		'今天访问量

set rs = server.createobject("adodb.recordset")
sql = "select * from count_online"
rs.open sql,conn,1,3 
if not (rs.eof and rs.bof) then
online=rs.RecordCount		'在线人数
else 
online=1
end if

set rs = server.createobject("adodb.recordset")
sql = "select * from count_shop order by day asc"
rs.open sql,conn,1,3 
if not (rs.eof and rs.bof) then
total_ip=rs.RecordCount		'总IP访问量
firstday=rs("day")		'firstday：开始计算的日期
else 
total_ip=0
firstday=date()
end if
per_ip=int(total_ip/(date()-firstday+1))	'平均每天IP访问量
if per_ip<1 then per_ip=0	
per=int(total/(date()-firstday+1))	'平均每天访问量
if per<1 then per=0

set rs = server.createobject("adodb.recordset")
sql = "select * from count_shop where day=#"&date()&"#"
rs.open sql,conn,1,3 
if not (rs.eof and rs.bof) then
today_ip=rs.RecordCount		'今天总IP访问量
else 
today_ip=0
end if
set rs=nothing

set rs = server.createobject("adodb.recordset")
sql = "select * from count_shop where day=#"&date()-1&"#"
rs.open sql,conn,1,3 
if not (rs.eof and rs.bof) then
yesterday_ip=rs.RecordCount		'昨天总IP访问量
else 
yesterday_ip=0
end if
set rs=nothing

conn.close
set conn=nothing
%>
</p>
<p>&nbsp;</p>
<table width="90%" border="0" align="center" cellpadding="2" cellspacing="1" class="table_southidc">
  <tr class="back_southidc">
    <td height="25" align="center"><span style="font-weight: bold">访问统计基本数据</span></td>
  </tr>
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellPadding=3 cellSpacing=1 bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF" class="table_southidc">
      
      <tr>
        <td width="20%" height="25" bgcolor="#99CCFF">统计起始日期</td>
        <td width="30%" bgcolor="#FFFFFF"><%=firstday%></td>
        <td width="20%" bgcolor="#99CCFF">统计截止日期</td>
        <td width="30%" bgcolor="#FFFFFF"><%=date()%>（共<%=date()-firstday+1%>天）</td>
      </tr>
      <tr>
        <td width="20%" height="25" bgcolor="#99CCFF">总访问量</td>
        <td width="30%" bgcolor="#FFFFFF"><%=total%></td>
        <td width="20%" bgcolor="#99CCFF">平均每日访问量</td>
        <td width="30%" bgcolor="#FFFFFF"><%=per%></td>
      </tr>
      <tr>
        <td width="20%" height="25" bgcolor="#99CCFF">总IP访问量</td>
        <td width="30%" bgcolor="#FFFFFF"><%=total_ip%></td>
        <td width="20%" bgcolor="#99CCFF">平均每日IP访问量</td>
        <td width="30%" bgcolor="#FFFFFF"><%=per_ip%></td>
      </tr>
      <tr>
        <td width="20%" height="25" bgcolor="#99CCFF">昨天访问量</td>
        <td width="30%" bgcolor="#FFFFFF"><%=yesterday%></td>
        <td width="20%" bgcolor="#99CCFF">昨天IP访问量</td>
        <td width="30%" bgcolor="#FFFFFF"><%=yesterday_ip%> &nbsp; <a href=tj3.asp?day=<%=date()-1%>>查看明细</a></td>
      </tr>
      <tr>
        <td width="20%" height="25" bgcolor="#99CCFF">今天访问量</td>
        <td width="30%" bgcolor="#FFFFFF"><%=today%></td>
        <td width="20%" bgcolor="#99CCFF">今天IP访问量</td>
        <td width="30%" bgcolor="#FFFFFF"><%=today_ip%> &nbsp; <a href=tj3.asp?day=<%=date()%>>查看明细</a></td>
      </tr>
      <tr>
        <td width="20%" height="25" bgcolor="#99CCFF">当前在线人数</td>
        <td width="30%" bgcolor="#FFFFFF"><%=online%> 人</td>
        <td width="20%" bgcolor="#99CCFF">统计数据置零</td>
        <td width="30%" bgcolor="#FFFFFF"><input type=hidden name="del" value="ok">
            <input type="submit" name="action" value="执行" onClick="{if(confirm('清除全部统计数据，重新开始统计。此操作无法恢复，您确定要继续吗？')){this.document.tongji.submit();return true;}return false;}">        </td>
      </tr>
    </table></td>
  </tr>
</table>
<p>&nbsp;</p>
</body></html>
