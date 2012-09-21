<!--#include file="syscode.asp" -->

<%
function cutstr(tempstr,tempwid)
if len(tempstr)>tempwid then
cutstr=left(tempstr,tempwid)&"..."
else
cutstr=tempstr
end if
end function%>
<TABLE width="100%" border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TR>
    <TD height="5"><h2>产品中心</h2></TD>
  </TR>
  <TR> 
    <TD height="172" ><table width="100%" height="100%" border="1" align="center" cellpadding="10" cellspacing="2">
        <tr> 
          <td width="190" valign="top" class="tdbg_left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">产品分类</td>
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
                <td height="34" class="title_left">&nbsp;产品查询</td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td> 
                        <% call ShowSearch(1) %>                      </td>
                    </tr>
                  </table></td>
              </tr>
			  <tr> 
                <td height="5"></td>
              </tr>
            </table>          </td>
          <td width="6" bgcolor="#FFFFFF">&nbsp;</td>
          <td width="40%" valign="top" Class=border><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td class="title_right" height="32">&nbsp;新品展示</td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><!--#include file="NewsProduct.asp"--></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="12">&nbsp;</td>
              </tr>
            </table>
          </td>
          <td width="6" valign="top" Class=border>&nbsp;</td>
          <td width="40%" valign="top" Class=border><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="title_right" height="32">产品列表</td>
            </tr>
          </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><%i=1 
set rs_Product=server.createobject("adodb.recordset")
sqltext="select top " & Product_count & " * from Product where Passed=True And Elite=True order by UpdateTime desc"
rs_Product.open sqltext,conn,1,1				 	
%>
                    <table width="100%" border="0" cellspacing="1" cellpadding="0">
                      <tr>
                        <td></td>
                      </tr>
                      <tr align="center">
                        <td><table  width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999" >
                            <tr Class=tdbg >
                              <td  width="34%" height="29"><div align="center">产品名称</font></div></td>
                              <td  width="18%"><div align="center">规格</div></td>
                              <td  width="9%"><div align="center">单位</div></td>
                              <td  width="39%"><div align="center">备注</div></td>
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
                              <td ><div align="center"><%=cutstr(rs_Product("Spec"),6)%></div></td>
                              <td><div align="center"><%=rs_Product("Unit")%></div></td>
                              <td><div align="left"><%=cutstr(rs_Product("Memo"),15)%></div></td>
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
                <td><div align="right"><a href="Product.asp">更多产品&gt;&gt;&gt;</a></div></td>
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
