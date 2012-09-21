<!--#include file="syscode.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from img order by id desc"
rs.open sqltext,conn,1,1

dim MaPerPage
MaPerPage=9

dim text,checkpage
text="0123456789"
Rs.PageSize=MaPerPage
for i=1 to len(request("page"))
checkpage=instr(1,text,mid(request("page"),i,1))
if checkpage=0 then
exit for
end if
next

If checkpage<>0 then
If NOT IsEmpty(request("page")) Then
CurrentPage=Cint(request("page"))
If CurrentPage < 1 Then CurrentPage = 1
If CurrentPage > Rs.PageCount Then CurrentPage = Rs.PageCount
Else
CurrentPage= 1
End If
If not Rs.eof Then Rs.AbsolutePage = CurrentPage end if
Else
CurrentPage=1
End if

call list

'显示帖子的子程序
Sub list()%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="1" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">企业荣誉</td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="Honor.asp">企 业 荣 
                    誉</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="Img.asp">企 业 形 象</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
          </table></td>
          <td width="6"></td>
          <td valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">企 
                        业 形 象</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <%i=1 %>
                    <TR> 
                      <TD><table width="100%" border="0" cellspacing="1" cellpadding="0">
                          <%i=1 %>
                          <TR> 
                            <% Do While Not rs.EOF%>
                            <TD> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><div align="center"> 
                                      <TABLE border=0 cellPadding=0 cellSpacing=5>
                                        <TBODY>
                                          <TR> 
                                            <TD align=middle width=135> <TABLE align=center border=0 cellPadding=0 cellSpacing=0>
                                                <TBODY>
                                                  <TR> 
                                                    <TD height=10><IMG height=10 
                        src="Img/bg_0ltop.gif" width=10></TD>
                                                    <TD background=Img/bg_01.gif height=10></TD>
                                                    <TD height=10><IMG height=10 
                        src="Img/bg_0rtop.gif" width=10></TD>
                                                  </TR>
                                                  <TR> 
                                                    <TD background=Img/bg_03.gif 
                      width=10>&nbsp;</TD>
                                                    <TD align=middle bgColor=#ffffff vAlign=center><a 
                        href=imagebig_img.asp?id=<%=rs("id")%> target=_blank><img src="<%=rs("img")%>" alt="" width="150" height="180" border="0"></a></TD>
                                                    <TD background=Img/bg_04.gif 
                      width=10>&nbsp;</TD>
                                                  </TR>
                                                  <TR> 
                                                    <TD height=10><IMG height=10 
                        src="Img/bg_0lbottom.gif" width=10></TD>
                                                    <TD background=Img/bg_02.gif height=10></TD>
                                                    <TD height=10><IMG height=10 
                        src="Img/bg_0rbottom.gif" 
                    width=10></TD>
                                                  </TR>
                                                </TBODY>
                                              </TABLE></TD>
                                          </TR>
                                        </TBODY>
                                      </TABLE>
                                    </div></td>
                                </tr>
                                <tr> 
                                  <td height="10"></td>
                                </tr>
                                <tr> 
                                  <td><div align="center"><%=rs("title")%></div></td>
                                </tr>
                                <tr> 
                                  <td height="10"></td>
                                </tr>
                              </table></td>                           
                            <% if i mod 3 =0 then%>
                          </tr>
                            <tr> 
                            <%end if%>
<%
i=i+1 
if i >= 10 then exit do 
rs.MoveNext 
loop
end sub
%>
                          </tr>
                        </table></TD>
                    </tr>
                  </table></td>
              </tr>
              <TR> 
                <TD 
                  height=1 colspan="3" background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
              </TR>
              <TR> 
                <TD 
                  height=25 colspan="3" bgcolor="#D8D8D8"> <%
Response.write "<strong><font color='#000000'>-> 全部-</font>"
Response.write "共</font>" & "<font color=#FF0000>" & Cstr(Rs.RecordCount) & "</font>" & "<font color='#000000'>条信息</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "<strong><font color='#000000'>第</font>" & "<font color=#FF0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#000000'>/" & Cstr(rs.pagecount) & "</font></strong>&nbsp;"
If currentpage > 1 Then
response.write "<strong><a href='img.asp?&page="+cstr(1)+"'><font color='#000000'>首页</font></a><font color='#ffffff'> </font></strong>"
Response.write "<strong><a href='img.asp?page="+Cstr(currentpage-1)+"'><font color='#000000'>上一页</font></a><font color='#ffffff'> </font></strong>"
Else
Response.write "<strong><font color='#000000'>上一页 </font></strong>"
End if
If currentpage < Rs.PageCount Then
Response.write "<strong><a href='img.asp?page="+Cstr(currentPage+1)+"'><font color='#000000'>下一页</font></a><font color='#ffffff'> </font>"
Response.write "<a href='img.asp?page="+Cstr(Rs.PageCount)+"'><font color='#000000'>尾页</font></a></strong>&nbsp;&nbsp;"
Else
Response.write ""
Response.write "<strong><font color='#000000'>下一页</font></strong>&nbsp;&nbsp;"
End if
%> </TD>
              </TR>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</BODY></HTML>
