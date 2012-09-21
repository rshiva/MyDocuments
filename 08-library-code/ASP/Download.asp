<!--#include file="Inc/syscode.asp"-->
<!--#include file="inc/Skin_css.asp"-->
<%
'请勿改动下面这三行代码
ShowSmallClassType=ShowSmallClassType_Default
MaxPerPage=MaxPerPage_Default
strFileName="download.asp?BigClassName=" & BigClassName & "&SmallClassName=" & SmallClassName 
%>
<!-- #include file="Head.asp" -->
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" > <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                      <td> 
                        <% call ShowUserLogin() %>
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
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;下载列表</td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td> 
                        <% call ShowSmallClass_Down_Tree() %>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            
            
          </td>
          <td width="6"></td>
          <td valign="top"><table Class=border height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;下 
                        载 中 心</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <TR> 
              <TD width="453" 
                  height=28> <% call ShowClass_DownGuide() %> </TD>
              <TD width="102"> <% call ShowDownTotal() %> </TD>
            </TR>
            <TR> 
              <TD 
                  height=1 colspan="2" background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
            </TR>
            <TR> 
              <TD 
                  height=1 colspan="2"> <% call ShowDown(32) %> </TD>
            </TR>
            <TR> 
              <TD 
                  height=1 colspan="2"> <%
		  if totalput>0 then
		  	call showpage(strFileName,totalput,MaxPerPage,false,true,"个下载")
		  end if
		  %> </TD>
            </TR>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
