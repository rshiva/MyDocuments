<!--#include file="conn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="Function.asp"-->
<!--#include file="SouthidcUbb.asp"-->
<!--#include file="Top.asp" -->
<%If Session("UserName")="" Then
response.redirect"Server.asp"
end if%>
<%
UserName=Session("UserName")
set Rst = Server.CreateObject("ADODB.recordset")
sql="select * from [User] where UserName='"&UserName&"'"
rst.open sql,conn,1,1
%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" > <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">会员中心</td>
              </tr>
              
              <tr> 
                <td height="20"> <div align="center"><a href="NetBook.asp">站内留言中心</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="UserLogout.asp">退出会员中心</a></div></td>
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
                      <td class="
title_right" height="32">会 
                        员 中 心</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">            
                    <TR> 
              <TD><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td height="10"></td>
                  </tr>
                </table>
                <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td><div align="center"><strong>&nbsp;&nbsp;<%=Session("UserName")%></strong>的留言专区</div></td>
                  </tr>
                  <tr> 
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=Session("UserName")%>，这里是您的专用私密留言簿，您可在此给我们留言，我们会尽力在24小时内在此答复您，请不要忘记回来察看回复哦！<br>
                            　　</td>
                  </tr>
                </table>
                <form method="post" action="SaveNetBook.asp">                
                  <table width="95%" border="0" align="center" cellpadding="4" cellspacing="1">
                    <tr> 
                      <td width="24%" align="right"></td>
                      <td width="76%"></td>
                    </tr>
                    <tr> 
                      <td width="24%" align="right">用户名称：</td>
                      <td width="76%"><font> 
                        <input type="text" readonly name="Name" maxlength="36" value="<%if Session("UserName")="" then response.write"未注册用户" end if%><%=Session("UserName")%>" style="background-color: #FFFFFF; border-style: solid; border-color: #FFFFFF" class="smallInput">
                        </font></td>
                    </tr>
                    <tr> 
                      <td align="right">公司名称：</td>
                      <td width="76%"><font> 
                        <input type="text" name="CompanyName" size="30" maxlength="36" value="<%=rst("CompanyName")%>" style="font-size: 14px" class="smallInput">
                        </font> </td>
                    </tr>
                    <tr> 
                      <td align="right">联系人：</td>
                      <td width="76%"><font> 
                        <input type="text" name="Receiver" size="12" maxlength="30" value="<%=rst("Receiver")%>" style="font-size: 14px" class="smallInput">
                        </font></td>
                    </tr>
                    <tr> 
                      <td align="right">联系电话：</td>
                      <td width="76%"><font> 
                        <input type="text" name="Phone" size="24" maxlength="36" value="<%=rst("Phone")%>" style="font-size: 14px" class="smallInput">
                        </font></td>
                    </tr>
                    <tr> 
                      <td align="right">联系传真：</td>
                      <td width="76%"><font> 
                        <input type="text" name="Fax" size="18" maxlength="36" value="<%=rst("Fax")%>" style="font-size: 14px" class="smallInput">
                        </font></td>
                    </tr>
                    <tr> 
                      <td align="right">E-mail：</td>
                      <td width="76%"><font> 
                        <input type="text" name="Email" size="18" maxlength="36" value="<%=rst("Email")%>" style="font-size: 14px" class="smallInput">
                        </font></td>
                    </tr>
                    <tr> 
                      <td width="24%" align="right">留言标题：</td>
                      <td width="76%"><input type="text" name="Title" size="22" maxlength="36" style="font-size: 14px; width: 320; height: 19" class="smallInput"></td>
                    </tr>
                    <tr> 
                      <td width="24%" align="right">留言内容：</td>
                      <td width="76%"><textarea rows="6" name="Content" cols="50" style="font-size: 14px" class="smallInput"></textarea> 
                      </td>
                    </tr>
                    <tr> 
                      <td width="24%" align="right"></td>
                      <td width="76%"><input type="submit" value="提交你的留言"
name="cmdOk"> &nbsp; <input type="reset" value="复位" name="cmdReset"> </td>
                    </tr>
                  </table>
                </form>
<%
name=Session("UserName")
set rs=server.createobject("adodb.recordset")
sql="select * from book where name='"&name&"' or name='管理员' order by id desc"
rs.open sql,conn,1,1

dim MaxPerPage
MaxPerPage=10

'取得页数,并判断留言输入的是否数字类型的数据，如不是将以第一页显示
dim text,checkpage
text="0123456789"
Rs.PageSize=MaxPerPage
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
<table width="90%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td width="21%" height="18" bgcolor="#eeeeee"><img src="img/arrow.gif" width="16" height="13"><strong>留言列表</strong></td>
<td width="79%" bgcolor="#eeeeee"> 
<%Response.write "<strong><font color='#000000'>-> 全部-</font>"
Response.write "共</font>" & "<font color=#FF0000>" & Cstr(Rs.RecordCount) & "</font>" & "<font color='#000000'>条留言</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "<strong><font color='#000000'>第</font>" & "<font color=#FF0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#000000'>/" & Cstr(rs.pagecount) & "</font></strong>&nbsp;"
If currentpage > 1 Then
response.write "<strong><a href='NetBook.asp?&page="+cstr(1)+"'><font color='#000000'>首页</font></a><font color='#ffffff'> </font></strong>"
Response.write "<strong><a href='NetBook.asp?page="+Cstr(currentpage-1)+"'><font color='#000000'>上一页</font></a><font color='#ffffff'> </font></strong>"
Else
Response.write "<strong><font color='#000000'>上一页 </font></strong>"
End if
If currentpage < Rs.PageCount Then
Response.write "<strong><a href='NetBook.asp?page="+Cstr(currentPage+1)+"'><font color='#000000'>下一页</font></a><font color='#ffffff'> </font>"
Response.write "<a href='NetBook.asp?page="+Cstr(Rs.PageCount)+"'><font color='#000000'>尾页</font></a></strong>&nbsp;&nbsp;"
Else
Response.write ""
Response.write "<strong><font color='#000000'>下一页</font></strong>&nbsp;&nbsp;"
End if
%> </td></tr>
<tr><td height="1" colspan="2" bgcolor="#999999"></td></tr>
</table>
<%
If rs.eof and rs.bof then
  response.write ""
  response.end
End if
%> <br> <table width="90%" height="18" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#666666">
                  <tr bgcolor="#99CCFF"> 
                    <td width="56%" height="25" align="center" bgcolor="#CCCCCC"> 
                      <p align="center"><font color="#000000"><b>留言主题</b></font></p></td>
                    <td width="22%" height="21" align="center" bgcolor="#CCCCCC"><font color="#000000"><b>时间</b></font></td>
                    <td width="22%" height="21" align="center" bgcolor="#CCCCCC"><font color="#000000"><b>回复</b></font></td>
                  </tr>
<%
if not rs.eof then
i=0
do while not rs.eof
%>
                  <tr bgcolor="#99CCFF"> 
                    <td height="22" bgcolor="#FFFFFF"> <%if rs("name")="管理员"then%>
                              『管理员公告』 
                              <%end if%> <a href="javascript:winopen('NetBookRe.asp?id=<%=rs("id")%>&amp;name=<%=rs("name")%>')"> 
                      <%=rs("title")%></a></td>
                    <td height="1" bgcolor="#FFFFFF" align="center">&nbsp; <%=rs("time")%></td>
                    <td height="1" bgcolor="#FFFFFF" align="center">&nbsp; <%If rs("rebook")<>"" Then%> <a href="javascript:winopen('NetBookRe.asp?id=<%=rs("id")%>&amp;name=<%=rs("name")%>')">回复</a> 
                      <%else%>
                      无 
                      <%End If%> &nbsp;</td>
                  </tr>
                  <%
i=i+1
if i >= MaxPerpage then exit do
rs.movenext
loop
end if
%>
<%end sub%>
                </table>
                <br> <br> </TD>
            </TR>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</BODY></HTML>