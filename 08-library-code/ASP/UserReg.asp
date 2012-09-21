<!--#include file="Inc/syscode.asp"-->
<!--#include file="inc/Skin_css.asp"-->
<!-- #include file="Head.asp" -->
<style type="text/css">
A:link    {	 color: #333333;TEXT-DECORATION: none	}
A:visited {	 color: #333333;TEXT-DECORATION: none	}
A:active  {	 color: #003300;TEXT-DECORATION: none	}
A:hover   {	 color: #003300;TEXT-DECORATION: underline overline	}
.navtrail {  COLOR: #eeeeee; FONT-SIZE: 12px; LINE-HEIGHT: 12px }
A.navtrail:link {  COLOR: #eeeeee; CURSOR: w-resize }
A.navtrail:visited {  COLOR: #eeeeee; CURSOR: w-resize }
A.navtrail:active {  COLOR: #eeeeee; CURSOR: w-resize }
A.navtrail:hover {  COLOR: #eeeeee; CURSOR: e-resize }
INPUT{BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 1px; PADDING-LEFT: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #cccccc; PADDING-BOTTOM: 1px; BORDER-TOP-COLOR: #cccccc; PADDING-TOP: 1px; HEIGHT: 18px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #cccccc}
<!--
td {  font-family: "宋体"; font-size: 9pt; color: #333333; text-decoration: none}
-->
</style><BODY bgColor=#666666 leftMargin=0 topMargin=0 marginheight="0" marginwidth="0"> 
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
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    
            <TR> 
              <TD height="1"> <FORM name='UserReg' action='UserRegPost.asp' method='post'>
                          <table width=95% border=0 align="center" cellpadding=5 cellspacing=1 bordercolor="#FFFFFF" style="border-collapse: collapse">
                            <TR align=center> 
                              <TD height=20 colSpan=2><b>新用户注册</b></TD>
                            </TR>
                            <TR> 
                              <TD width="37%"><b>用户名：</b><BR>
                                不能小于4个字符（2个汉字）</TD>
                              <TD width="63%"> <INPUT   maxLength=14 size=30 name=UserName> 
                                <font color="#FF0000">*</font> </TD>
                            </TR>
                            <TR> 
                              <TD width="37%"><B>密码(至少6位)：</B><BR>
                                请输入密码，区分大小写。 不要使用类似 '*'、' '的特殊字符</TD>
                              <TD width="63%"> <INPUT   type=password maxLength=12 size=30 name=Password> 
                                <font color="#FF0000">*</font> </TD>
                            </TR>
                            <TR> 
                              <TD width="37%"><strong>确认密码(至少6位)：</strong><BR>
                              </TD>
                              <TD width="63%"> <INPUT   type=password maxLength=12 size=30 name=PwdConfirm> 
                                <font color="#FF0000">*</font> </TD>
                            </TR>
                            <TR> 
                              <TD width="37%"><strong>密码问题：</strong><BR>
                                忘记密码的提示问题</TD>
                              <TD width="63%"> <INPUT   type=text maxLength=50 size=30 name="Question"> 
                                <font color="#FF0000">*</font> </TD>
                            </TR>
                            <TR> 
                              <TD width="37%"><strong>问题答案：</strong><BR>
                                忘记密码的提示问题答案，用于取回密码</TD>
                              <TD width="63%"> <INPUT   type=text maxLength=20 size=30 name="Answer"> 
                                <font color="#FF0000">*</font> </TD>
                            </TR>
                            <TR> 
                              <TD width="37%"><strong>性别：</strong><BR>
                                请选择您的性别</TD>
                              <TD width="63%"> <INPUT type=radio CHECKED value="1" name=sex>
                                男 &nbsp;&nbsp; <INPUT type=radio value="0" name=sex>
                                女</TD>
                            </TR>
                            <TR> 
                              <TD width="37%"><strong>Email地址：</strong><BR>
                                请输入有效的邮件地址</TD>
                              <TD width="63%"> <INPUT   maxLength=50 size=30 name=Email> 
                                <font color="#FF0000">*</font></TD>
                            </TR>
                            <TR> 
                              <TD><strong>公司网址：</strong></TD>
                              <TD width="63%"><INPUT name=homepage id="homepage" value="http://" size=30   maxLength=50></TD>
                            </TR>
                            <TR> 
                              <TD width="37%"><strong>公司名称：</strong><BR>
                                您的公司名称</TD>
                              <TD width="63%"> <INPUT name=CompanyName id="CompanyName" size=30   maxLength=100></TD>
                            </TR>
                            <TR>
                              <TD><strong>收货地址：</strong></TD>
                              <TD><INPUT name=Add id="Add" size=30   maxLength=100>
                                <font color="#FF0000">*</font></TD>
                            </TR>
                            <TR> 
                              <TD><strong>收货人：</strong></TD>
                              <TD><INPUT name=Receiver id="Receiver" size=30   maxLength=100></TD>
                            </TR>
                            <TR> 
                              <TD><strong>邮政编码：</strong></TD>
                              <TD width="63%"><input name=postcode id="postcode" size=30 maxlength=20> 
                                <font color="#FF0000">*</font></TD>
                            </TR>
                            <TR> 
                              <TD><strong>联系电话：<br>
                                </strong>格式0791-8059439<strong> </strong></TD>
                              <TD width="63%"><input name=Phone id="Phone" size=30 maxlength=20> 
                                <font color="#FF0000">*</font></TD>
                            </TR>
                            <TR> 
                              <TD width="37%"><strong>传 真：</strong></TD>
                              <TD width="63%"> <INPUT name=Fax id="Fax" size=30 maxLength=50></TD>
                            </TR>
                          </TABLE>
                  <div align="center"> 
                    <INPUT   type=submit value=" 注 册 " name=Submit>
                    &nbsp; 
                    <INPUT name=Reset   type=reset id="Reset" value=" 清 除 ">
                  </div>
                </form></TD>
            </TR>
                  </table> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
