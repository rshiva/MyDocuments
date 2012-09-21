<!--#Include File="inc/Check_Sql.asp"-->
<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Skin_css.asp"-->
<!--#include file="inc/config.asp"-->
<!--#include file="inc/Function.asp"-->
<%If Session("UserName")="" Then
response.redirect"Server.asp"
end if%>

<SCRIPT language=javascript>
<!--

function chkitem(str)
{	
var strSource ="0123456789-";
var ch;
var i;
var temp;

for (i=0;i<=(str.length-1);i++)
{

ch = str.charAt(i);
temp = strSource.indexOf(ch);
if (temp==-1)
{
return 0;
}
}
if (strSource.indexOf(ch)==-1)
{
return 0;
}
else
{
return 1;
}


}

function FORM1_onsubmit()
{
if (chkitem(document.FORM1.Form_Id.value)==0)
{
alert("请输入正确的订单号码。");
document.FORM1.Form_Id.focus();
return false;
}
}
//-->
</SCRIPT>
<!-- #include file="Head.asp" -->
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" > 
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;会员中心</td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="Manage.asp">修改会员资料</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="ManagePwd.asp">修改会员密码</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="E_shop.asp">购物订单查询</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
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
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;会 
                        员 中 心</td>
                    </tr>
                  </table>
                  <TABLE width=95% height="136" align="center" cellPadding=4 cellSpacing=1>
                    <TBODY>
                      <TR vAlign=top > 
                        <TD  width="100%" height="18"> <form action="orderofind.asp" method="post" name=FORM1 onsubmit="return FORM1_onsubmit()" language=javascript>
                            <p align="center"> <font color="#FF0000">亲爱的&nbsp;&nbsp;</font><font size="4" face="Arial"><%=Session("UserName")%></font></p>
                            <p style="word-spacing: 0; margin-left: 10; margin-right: 10; margin-top: 0; margin-bottom: 0" align="center">您好，下面是您已经在本站提交的订单。 
                              <%rs.close%>
                              <%


UserName=Session("UserName")
set Rs = Server.CreateObject("ADODB.recordset")
sql="select * from OrderList where UserName='"&UserName&"'"
rs.open sql,conn,1,1


%>
                            </p>
                            <p align="center" style="word-spacing: 0; margin-top: 0; margin-bottom: 0">订单详细资料查询，请输入您要查询的订单号码 
                              <input type="text" name="OrderNum" size="16">
                              <input type="submit" value="查询" name="B1">
                          </form>
                          <div align="center"> 
                            <TABLE cellSpacing=0 cellPadding=0 width=100%>
                              <TBODY>
                                <TR> 
                                  <TD align=middle width="100%"> <p align="center" style="word-spacing: 0; margin-top: 0; margin-bottom: 0">以下是您在本站提交的所有订单列表</p>
                                    <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="#000000">
                                      <tr > 
                                        <td width="26%" align="center" height="20" bgcolor="#CCCCCC"><font color="#000000">订单编号</font></td>
                                        <td width="21%" align="center" height="20" bgcolor="#CCCCCC"><font color="#000000">客户姓名</font></td>
                                        <td width="53%" align="center" height="20" bgcolor="#CCCCCC"><font color="#000000">对您的订单的处理情况</font></td>
                                      </tr>
                                      <% While Not rs.EOF %>
                                      <tr > 
                                        <td width="26%" height="25" align="center" bgcolor="#FFFFFF"> 	  
								<%response.Write "&nbsp;<a href='#' onclick=""javascript:window.open('Orderofind.asp?OrderNum=" & rs("OrderNum") &"', 'newwindow', 'height=550, width=550, toolbar=no, menubar=no, scrollbars=auto, resizable=no, location=no, status=no')"" title='" & rs("OrderNum") & "'><font color='#FF0000'>" &rs("OrderNum") & "</font></a>"%>										
										 </td>
                                        <td width="21%" align="center" height="25" bgcolor="#FFFFFF"><%=rs("Receiver")%></td>
                                        <td width="53%" align="center" height="25" bgcolor="#FFFFFF"> 
                                          <%If rs("Flag")="尚未处理" Then%>
                                          您的款项尚未到我们的帐户，此订单本站尚未处理 
                                          <%else%>
                                          <font color="#FF0000">此订单已经发货给您，请注意查收！</font> 
                                          <%End If%>
                                        </td>
                                      </tr>
                                      <%
rs.MoveNext
Wend
rs.close
%>
                                    </table>                                   
                                  </TD>
                                </TR>
                              </TBODY>
                            </TABLE>
                          </div></TD>
                      </TR>
                      <TR vAlign=top > 
                        <TD  width="100%" height="15"> &nbsp;&nbsp; </TD>
                      </TR>
                    </TBODY>
                  </TABLE> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>