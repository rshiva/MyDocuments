<!--#Include File="Check_Sql.asp"-->
<!--#include file="Conn.asp"-->
<!--#include file="Config.asp"-->
<!--#include file="Function.asp"-->
<table width="560" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#999999">
  <tr>
    <td height="32" class="title_right">
	
	<MARQUEE scrollAmount=1 scrollDelay=4 width=520 align="left" onMouseOver="this.stop()" onMouseOut="this.start()">
      <!--调用Function.asp 中的函数-->
	  <% 
		if PopAnnounce="Yes" then
		call ShowAnnounce(5)
		end if
		 %>
      </MARQUEE>    
	  </td>
  </tr>
</table>
