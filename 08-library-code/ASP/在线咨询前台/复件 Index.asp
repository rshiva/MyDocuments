<!--#include file="syscode.asp" -->
<!--#include file="Skin_CSS.asp"-->
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
    <TD height="172" ><table width="746" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="190" valign="top" class="tdbg_left"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;用户登陆 
                </td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td> <% call ShowUserLogin() %> </td>
                    </tr>
                  </table></td>
              </tr>
			  <tr> 
                <td height="5"></td>
              </tr>
            </table>

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;产品列表</td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td><% call ShowSmallClass_Tree() %></td>
                    </tr>
                  </table></td>
              </tr>
			  <tr> 
                <td height="5"></td>
              </tr>
            </table>
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;产品查询</td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td> 
                        <% call ShowSearch(1) %>
                      </td>
                    </tr>
                  </table></td>
              </tr>
			  <tr> 
                <td height="5"></td>
              </tr>
            </table>
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;在线调查</td>
              </tr>
              <tr> 
                <td height="10">&nbsp;</td>
              </tr>
              <tr> 
                <td height="10"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td > <div align="center">
                          <% call ShowVote() %>
                        </div></td>
                    </tr>
                  </table></td>
              </tr>			  
            </table>
          </td>
          <td width="6" bgcolor="#FFFFFF">&nbsp;</td>
          <td Class=border valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td class="title_right" width="23%" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;新 
                  闻 资 讯</td> 
               
                <td class="title_right" width="77%">
 <MARQUEE scrollAmount=1 scrollDelay=4 width=420
            align="left" onMouseOver="this.stop()" onMouseOut="this.start()">
        <% 
		if PopAnnounce="Yes" then
		call ShowAnnounce(5)
		end if
		 %>
        </MARQUEE>
                </td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="49%">　企业新闻&gt;&gt;</td>
                <td width="51%">　业内资讯&gt;&gt;</td>
              </tr>
              <tr> 
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="100" colspan="2"> 
                        <%
set rs_news=server.createobject("adodb.recordset")
sqltext4="select top " & New_count & " * from news where BigClassName='新闻大类01' order by id desc"
rs_news.open sqltext4,conn,1,1				 	
%>
                        <table width="100%" border="0" cellspacing="1" cellpadding="0">
                          <tr> 
                            <td width="7%" height="8"></td>
                            <td width="93%"></td>
                          </tr>
                          <%i=0
do while not rs_news.eof%>
                          <tr align="center"> 
                            <td><img src="Img/arrow_6.gif" width="11" height="11"> 
                            </td>
                            <td style='BORDER-bottom: #999999 1px dotted'> <div align="left"> 
                                <p style='line-height:150%'><a href="shownews.asp?id=<%=rs_news("id")%>" target="_blank"> 
                                  <%=cutstr(rs_news("title"),22)%></a><br>
                              </div></td>
                          </tr>
                          <%rs_news.movenext
i=i+1
loop
rs_news.close %>
                          <tr> 
                            <td height="8"></td>
                            <td></td>
                          </tr>
                      </table></td>
                      <td width="51%" colspan="2"> 
                        <%
set rs_news=server.createobject("adodb.recordset")
sqltext4="select top " & New_count & " * from news where BigClassName='业内资讯' order by id desc"
rs_news.open sqltext4,conn,1,1				 	
%>
                        <table width="100%" border="0" cellspacing="1" cellpadding="0">
                          <tr> 
                            <td width="6%" height="8"></td>
                            <td width="94%"></td>
                          </tr>
                          <%i=0
do while not rs_news.eof%>
                          <tr align="center"> 
                            <td><img src="Img/arrow_6.gif" width="11" height="11"> 
                            </td>
                            <td style='BORDER-bottom: #999999 1px dotted'> <div align="left"> 
                                <p style='line-height:150%'><a href="shownews.asp?id=<%=rs_news("id")%>" target="_blank"> 
                                  <%=cutstr(rs_news("title"),20)%></a> <br>
                              </div></td>
                          </tr>
                          <%rs_news.movenext
i=i+1
loop
rs_news.close %>
                          <tr> 
                            <td height="8"></td>
                            <td></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="15"> <div align="right"><img src="Images/more_1.gif" width="85" height="27" border="0" usemap="#Map2Map"> 
                                <map name="Map2Map">
                                  <area shape="rect" coords="21,15,71,25" href="otype.asp?owen1=企业新闻">
                                </map>
                              </div></td>
                          </tr>
                        </table></td>
                      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><div align="right"><img src="Images/more_1.gif" width="85" height="27" border="0" usemap="#Map2"></div></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <map name="Map2">
                    <area shape="rect" coords="22,15,72,25" href="otype.asp?owen1=业内资讯">
                  </map></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;新 
                  品 展 示</td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="12">&nbsp;</td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="12" height="12">&nbsp;&nbsp;产 
                  品 列 表</td>
               
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> <%i=1 
set rs_Product=server.createobject("adodb.recordset")
sqltext="select top " & Product_count & " * from Product where Passed=True And Elite=True order by UpdateTime desc"
rs_Product.open sqltext,conn,1,1				 	
%> <table width="100%" border="0" cellspacing="1" cellpadding="0">
                    <tr> 
                      <td></td>
                    </tr>
                    <tr align="center"> 
                      <td><table  width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999" >
                          <tr Class=tdbg > 
                            <td  width="34%" height="29"> 
                              <div align="center">产品名称</font></div></td>
                            <td  width="18%"> 
                              <div align="center">规格</div></td>
                            <td  width="9%"> 
                              <div align="center">单位</div></td>
                            <td  width="39%"> 
                              <div align="center">备注</div></td>
                          </tr>
                          <%
do while not rs_Product.eof
%>
                          <% if i mod 2 =0 then%>
                          <tr Class=tdbg> 
                            <% else %>
                          <tr bgcolor="#ffffff"> 
                            <% end if %>
                            <td height="22"><a href="ProductShow.asp?ID=<%=rs_Product("ID")%>" target="_blank"><%=cutstr(rs_Product("Title"),15)%></a></td>
                            <td > <div align="center"><%=cutstr(rs_Product("Spec"),6)%></div></td>
                            <td> <div align="center"><%=rs_Product("Unit")%></div></td>
                            <td> <div align="left"><%=cutstr(rs_Product("Memo"),15)%></div></td>
                          </tr>
                          <% 
i=i+1
rs_Product.movenext 
loop 
rs_Product.close  
%>
                        </table></td>
                    </tr>
                    <tr> 
                      <td></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td> <div align="right"><a href="Product.asp">更多产品&gt;&gt;&gt;</a></div></td>
              </tr>
            </table></td>
        </tr>		
      </table></TD>
  </TR>
</TABLE>
<!--#include file="dmwh_tj.asp"-->
<!--#include file="dmwh_kefu.asp"-->
<map name="Map">
  <area shape="rect" coords="18,14,69,24" href="News.asp">
</map>
</BODY></HTML>
