<!--#include file="syscode.asp"-->

<%
ShowSmallClassType=ShowSmallClassType_Article
dim ID
ID=trim(request("ID"))
if ID="" then
	response.Redirect("Product.asp")
end if

sql="select * from Product where ID=" & ID & ""
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,3
if rs.bof and rs.eof then
	response.write"<SCRIPT language=JavaScript>alert('找不到此产品！');"
  response.write"javascript:history.go(-1)</SCRIPT>"
else	
	rs("Hits")=rs("Hits")+1
	rs.update
	if rs("hits")>=HitsOfHot then
		rs("Hot")=True
		rs.update
	end if
	BigClassName=rs("BigClassName")
	SmallClassName=rs("SmallClassName")
%>
 <%if not(rsBigClass.bof and rsBigClass.eof) and ShowSmallClassType="Menu" then response.write " onmousemove='HideMenu()'"%>

<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">产品列表</td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td> 
                        <% call ShowSmallClass_Tree() %>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table></td>
          <td width="6"></td>
          <td  valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">产 
                        品 展 示</td>
                    </tr>
                  </table>
                  <table width="100%" border="1" cellspacing="0" cellpadding="5">
                    <TR> 
                      <TD width="452" 
                  height=25> <%
response.write "&nbsp;<a href='Product.asp?BigClassName=" & rs("BigClassName") & "'>" & rs("BigClassName") & "</a>&nbsp;&gt;&gt;&nbsp;"
if rs("SmallClassName") & ""<>"" then
	response.write "<a href='Product.asp?BigClassName=" & rs("BigClassName")&"&SmallClassName=" & rs("SmallClassName") & "'>" & rs("SmallClassName") & "</a>&nbsp;&gt;&gt;&nbsp;"
end if
response.write rs("Title")
%> </TD>
                  <TD width="106">&nbsp;</TD>
                    </TR>
                    <TR> 
                      <TD 
                  height=1 colspan="3" background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
                    </TR>
                    <TR>
                      <TD height="42" colspan="3"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="21">&nbsp;</td>
                            <td colspan="3">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td width="15%" height="21">产品名称：</td>
                            <td width="30%"><font color="#FF6600"><strong><%=rs("title")%></strong></font></td>
                            <td width="16%">产品备注：</td>
                            <td width="39%"><font color="#FF6600"><strong><%=rs("Memo")%></strong></font></td>
                          </tr>
                          <tr> 
                            <td height="21">规　　格：</td>
                            <td height="21"><font color="#FF6600"><strong><%=rs("BigClassName")%></strong></font></td>
                            <td height="21">产品类别：</td>
                            <td height="21"><font color="#FF6600"><strong><%=rs("title")%></strong></font></td>
                          </tr>
                          <tr> 
                            <td height="9">&nbsp;</td>
                            <td height="9" colspan="3">&nbsp;</td>
                          </tr>
                        </table></TD>
                    </TR>
                    <TR> 
                      <TD class="title_right" height="37" colspan="3">产 品 说 明 </TD>
                    </TR>
                    <TR> 
                      <TD height="1" colspan="3"> <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td> <%call ShowProductContent()%> </td>
                          </tr>
                        </table></TD>
                    </TR>
                    <TR> 
                      <TD 
                  height=1 colspan="3" background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
                    </TR>
                    <TR> 
                      <TD colspan="3" 
                  height=25>点击数：<%=rs("Hits")%>&nbsp; 录入时间：<%= FormatDateTime(rs("UpdateTime"),2) %>&nbsp;【<a href='javascript:window.print()'>打印此页</a>】&nbsp;【<a href='javascript:history.back()'>返回</a>】</TD>
                    </TR>
                  </table> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</BODY></HTML>
<%
end if
rs.close
set rs=nothing
call CloseConn()
%>