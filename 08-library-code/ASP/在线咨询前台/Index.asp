<!--#Include File="Check_Sql.asp"-->
<!--#include file="Conn.asp"-->
<!--#include file="Config.asp"-->
<!--#include file="Ubbcode.asp"-->
<!--#include file="Function.asp"-->
<!--#include file="Skin_CSS.asp"-->
<%
function cutstr(tempstr,tempwid)
if len(tempstr)>tempwid then
cutstr=left(tempstr,tempwid)&"..."
else
cutstr=tempstr
end if
end function%>
<!--#include file="dmwh_tj.asp"-->
<!--#include file="dmwh_kefu.asp"-->
<map name="Map">
  <area shape="rect" coords="18,14,69,24" href="News.asp">
</map>
</BODY></HTML>
