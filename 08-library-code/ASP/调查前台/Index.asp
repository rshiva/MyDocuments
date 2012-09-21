<!--#include file="syscode.asp" -->

<%
function cutstr(tempstr,tempwid)
if len(tempstr)>tempwid then
cutstr=left(tempstr,tempwid)&"..."
else
cutstr=tempstr
end if
end function%>
<TABLE width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TR>
    <TD height="5"></TD>
  </TR>
  <TR> 
    <TD height="172" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="34" class="title_left">在线调查</td>
      </tr>
      <tr>
        <td height="10">&nbsp;</td>
      </tr>
      <tr>
        <td height="10"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td ><div align="center">
                  <% call ShowVote() %>
              </div></td>
            </tr>
        </table></td>
      </tr>
    </table></TD>
  </TR>
</TABLE>
<map name="Map">
  <area shape="rect" coords="18,14,69,24" href="News.asp">
</map>
</BODY></HTML>
