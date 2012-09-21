<!--#include file="syscode.asp" -->
<TABLE  width="760" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TR> 
    <TD height="5"></TD>
  </TR>
  <TR> 
    <TD> <TABLE Class=FootBg  cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
          <TR> 
            <TD width="12%"> <DIV align=center>友情链接</DIV></TD>
            <TD width="88%"> <%call ShowFriendLinks(1,10,10,2) '图片链接%>
			<%' call ShowFriendLinks(2,10,10,2) '文字链接
%>
			 </TD>
          </TR>
      </TABLE></TD>
  </TR>
  <TR> 
    <TD> <DIV align=center> 
        <p><%=Copyright%></p>
      </DIV></TD>
  </TR>
</TABLE>
