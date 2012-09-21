<!--#include file="Syscode.asp" -->
<!--#include file="Top.asp"-->
<!--#include file="SouthidcUbb.asp"-->

<% 
id=cstr(request("id"))
if id="" then
 id=6
end if

Set rs_about=Server.CreateObject("ADODB.RecordSet") 
sql="select * from AboutUs where id="&id
rs_about.Open sql,conn,1,1
%>

<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="1" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">营销网络                </td>
              </tr>
              <tr> 
                <td height="20"><div align="center"><a href="Sale.asp?id=6">国内市场</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"><div align="center"><a href="Sale.asp?id=7">国际市场</a></div></td>
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
                      <td class="title_right" height="32"><%  
				  select case ID
				   case "1"
				    response.Write("企业简介")
				   case "2"
				    response.Write("企业文化")
				   case "3"
				    response.Write("成长历程")
				   case "4"
				    response.Write("组织机构")
				   case "5"
				    response.Write("联系我们")
				   case "6"
				    response.Write("国内市场")
				   case "7"
				    response.Write("国际市场")
				   case else
				  end select
				  %>
			  
			  </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="3%" height="34" rowspan="3">&nbsp;</td>
                      <td width="94%">&nbsp;</td>
                      <td width="3%" rowspan="3">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td><%=rs_about("content") %></td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</BODY></HTML>
