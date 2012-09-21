<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Skin_css.asp"-->
<!--#include file="Inc/config.asp" -->
<%
key=request("key")
otype=request("otype")
if key="" then
   response.write "<script>alert('查找字符串不能为空！');history.back();</Script>"
   response.end
end if
%>
<!-- #include file="Head.asp" --><body topmargin="0">
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left" width="190" height="179" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form name="form1" method="get" action="News_search.asp">
                <tr> 
                  <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;<font color="#000000">新 
                    闻 搜 索</font></td>
                </tr>
                <tr> 
                  <td height="21"><input type="text" name="key" size="19" class="input"></td>
                </tr>
                <tr> 
                  <td height="21"><select name="otype" class="input">
                      <option value="title" selected class="input">新闻标题</option>
                      <option value="msg" class="input">新闻内容</option>
                    </select> <input type="submit" name="Submit" value="搜索" class="input"></td>
                </tr>
                <tr> 
                  <td height="5"></td>
                </tr>
              </form>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td class="title_left" height="36" align="center"><div align="left"><a  href="otype.asp?owen1=<%=owen1%>"><font color="#000000"> 
                    &nbsp;&nbsp;<%=owen1%></font></a></div></td>
              </tr>
              <%
set rsSmallClass=server.CreateObject("adodb.recordset")
rsSmallClass.open "Select * From SmallClass_New Where BigClassName='" & owen1 & "'",conn,1,1
if not(rsSmallClass.bof and rsSmallClass.eof) then
 do while not rsSmallClass.eof
%>
              <tr onmouseover="this.bgColor='#FFFFFF';" onmouseout="this.bgColor='#EFEFEF';" bgColor=#EFEFEF> 
                <td height="28" ><div align="left"><a  href="otype.asp?owen1=<%=owen1%>&owen2=<%=rsSmallClass("SmallClassName")%>">&nbsp;&nbsp;<%=rsSmallClass("SmallClassName")%></a></div></td>
              </tr>
              <%
 rsSmallClass.movenext
 loop
end if
rsSmallClass.close
set rsSmallClass=nothing	
%>
            </table></td>
          <td width="6"></td>
          <td valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;新 
                        闻 搜 索</td>
                    </tr>
                  </table> 
                  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000">
                    <% 
Set rs= Server.CreateObject("ADODB.Recordset")
if otype="title" then
sql="select * from NEWS where title Like '%"& key &"%' order by id desc"
elseif otype="msg" then
sql="select * from NEWS where content Like '%"& key &"%' order by id desc"
else
end if
rs.open sql,conn,1,1
if rs.eof and rs.bof then
response.write "<p align='center'>对不起，没有找到相关新闻</p>"
else
%>
                    <tr bgcolor="#86C2FF"> 
                      <td width="9%" height="25" align="center">ID</td>
                      <td width="55%" align="center" bgcolor="#86C2FF">新闻标题</td>
                      <td width="15%" align="center">发布者</td>
                      <td width="21%" align="center">发布日期</td>
                    </tr>
                    <%
i=0
do while not rs.eof
%>
                    <tr bgcolor="#FFFFFF"> 
                      <td height="22" align="center"><%=rs("id")%></td>
                      <td>　<a href="shownews.asp?id=<%=rs("id")%>"  target="_blank"><%=rs("title")%></a></td>
                      <td align="center"><%=left(rs("user"),5)%></td>
                      <td align="center"><%=rs("infotime")%></td>
                    </tr>
                    <%
rs.movenext
i=i+1                                                         
loop
%>
                    <tr bgcolor="#FFFFFF"> 
                      <td height="24" colspan="4"> <div align="center">关键字<font color="#FF0000"><strong><%=key%></strong></font>，共为您找到<font color="#FF0000"><%=i%></font>条新闻</div></td>
                    </tr>
                    <% 
end if
rs.close
set rs=nothing
%>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="inc/foot.asp"-->
</body>
</html>
