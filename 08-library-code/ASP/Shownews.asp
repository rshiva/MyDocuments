<!--#Include File="inc/Check_Sql.asp"-->
<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Skin_css.asp"-->
<!-- #include file="inc/config.asp" -->
<!-- #include file="Head.asp" -->
<!--#include file="inc/Function.asp"-->
<%owen=request("id")%>
<SCRIPT language=JavaScript>
var currentpos,timer;

function initialize()
{
timer=setInterval("scrollwindow()",50);
}
function sc(){
clearInterval(timer);
}
function scrollwindow()
{
currentpos=document.body.scrollTop;
window.scroll(0,++currentpos);
if (currentpos != document.body.scrollTop)
sc();
}
document.onmousedown=sc
document.ondblclick=initialize
</SCRIPT>

<% 
id=cstr(request("id"))
Set rsnews=Server.CreateObject("ADODB.RecordSet") 
sql="update news set hits=hits+1 where id="&id
conn.execute sql
sql="select * from news where id="&owen
rsnews.Open sql,conn,1,1
title=rsnews("title")
if rsnews.eof and rsnews.bof then
response.Write("数据库出错")
else
%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" ><!--#include file="left.asp"--></td>
          <td width="6"></td>
          <td valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;新 
                        闻 中 心</td>
                    </tr>
                  </table>
                  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="50" colspan="2" align="center" class="tit"><%= rsnews("title") %></td>
                    </tr>
                    <tr> 
                      <td width="20%" height="30" class="tit" style="border-top: 1 solid #666666;border-bottom: 1 solid #666666">双击自动滚屏</td>
                      <td width="80%" align="left" style="border-top: 1 solid #666666;border-bottom: 1 solid #666666">发布者：<%= rsnews("user") %> 
                      发布时间：<%= rsnews("infotime") %> 阅读：<font color="#FF0000"><%= rsnews("hits") %></font>次</td>
                    </tr>
                    <tr> 
                      <td colspan="2"><br>
                        <div style='font-size:10.5pt'><%=rsnews("content") %></div></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <% 
		end if
		rsnews.close
		set rsnews=nothing
		%>
                  </table> 
				  
	  <% if NewsComment="Yes" then  %>			  
                  <table Class=border borderColor="#d8d8f0" cellSpacing="0" cellPadding="0" width="95%" align="center" >
                    <tr> 
                      <td height="22" align="middle" class="tr"> <p align="left"> 
                          <b>　</b><b>相关评论</b></td>
                    </tr>
                    <tr> 
                      <td align="middle" bgColor="#ffffff" height="248" style="padding-top: 5px; padding-bottom: 5px"> 
                        <%set rs3 = server.CreateObject("adodb.recordset")
	  sql="select * from comment where com_typeid="&id&" order by com_id desc"
	  rs3.open sql,conn,1,1
	   if rs3.bof and rs3.eof then
         %> <table width="98%" border="1" cellpadding="0" cellspacing="0" borderColor="#d8d8f0" >
                          <tr> 
                            <td height="22" style="padding-left: 5px; padding-right: 5px">暂无评论</td>
                          </tr>
                        </table>
                        <br> <%else
         do while not rs3.eof         
%> <table width="98%" border="1" cellpadding="0" cellspacing="0" borderColor="#d8d8f0" id="table13">
                          <tr> 
                            <td class="tr" height="22"><span lang="en">&nbsp;&nbsp; 
                              </span>评论人：<%=Replace(Replace(rs3("com_name"),"<","&lt;"),">","&gt;")%>&nbsp; 评论时间：<%=rs3("com_date")%></td>
                          </tr>
                          <tr> 
                            <td height="22" style="padding-left: 5px; padding-right: 5px"><%=Replace(Replace(rs3("com_content"),"<","&lt;"),">","&gt;")%></td>
                          </tr>
                        </table>
                        <br> <%rs3.movenext
		loop
		end if
		rs3.close%> <table width="98%" border="1" cellpadding="0" cellspacing="0" borderColor="#d8d8f0" id="table12">
                          <form method="POST" name="svcomment" action="Comment.asp?id=<%=id%>">
                            <tr> 
                              <td height="21" colspan="3">&nbsp;<a name="comment">发表评论</a>：</td>
                            </tr>
                            <tr> 
                              <td width="15%" height="20">&nbsp;呢称：</td>
                              <th width="85%" height="20"> <div align="left"> 
                                  <input type="text" name="com_name" size="30">
                                </div></th>
                            </tr>
                            <tr> 
                              <td height="20" >&nbsp;评论内容：</td>
                              <th height="20"><div align="left"> 
                                  <textarea rows="7" name="com_content" cols="50"></textarea>
                                </div></th>
                            </tr>
                            <tr> 
                              <th height="33" colSpan="3"> <div align="center"> 
                                  <input type="submit" value="提交评论" name="B1">
                                  　　 
                                  <input type="reset" value="重置" name="B2">
                                </div></th>
                            </tr>
                          </form>
                        </table></td>
                    </tr>
                  </table>
	  <% end if %>			  
				  
                  <br>
                  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td align="right"> <img src="images/printer.gif" width="16" height="14" align="absmiddle"> 
                        <a href="javascript:window.print()">打印本页</a> | <img src="images/close.gif" width="14" height="14" align="absmiddle"> 
                        <a href="javascript:window.close()">关闭窗口</a></td>
                    </tr>
                  </table> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="inc/foot.asp"-->
