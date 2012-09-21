<!--#include file="Inc/syscode.asp" -->
<!--#include file="inc/Skin_css.asp"-->
<%
Id=Session("UserName")
set Rst = Server.CreateObject("ADODB.recordset")
sql="select * from User where UserName='"&Id&"'"
rst.open sql,conn,1,1
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
            
          </td>
          <td width="6"></td>
          <td valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;信 
                        息 反 馈</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><form method="post" action="SaveNetBooK.asp">
                          <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="100%"> <div align="center"> 
                                  <table width="100%" height="79"
border="0" align="center" cellpadding="0" cellspacing="3">
                                    <tr> 
                                      <td width="23%" height="25" align="right">用户名称： 
                                      </td>
                                      <td width="77%" height="25"><font> 
                                        <input type="text" readonly name="Name" maxlength="36" value="<%if Session("UserName")="" then response.write"未注册用户" end if%><%=Session("UserName")%>" style="background-color: #FFFFFF; border-style: solid; border-color: #FFFFFF" class="smallInput">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="25" align="right">公司名称：</td>
                                      <td width="77%" height="-6"><font> 
                                        <input type="text" name="CompanyName" size="30" maxlength="36" value="<%=rst("CompanyName")%>" style="font-size: 14px" class="smallInput">
                                        </font>* </td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">联系人：</td>
                                      <td width="77%" height="-2"><font> 
                                        <input type="text" name="Receiver" size="12" maxlength="30" value="<%=rst("Receiver")%>" style="font-size: 14px" class="smallInput">
                                       </font> * </td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">联系电话：</td>
                                      <td width="77%" height="-1"><font> 
                                        <input type="text" name="Phone" size="24" maxlength="36" value="<%=rst("Phone")%>" style="font-size: 14px" class="smallInput">
                                        </font>* </td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">联系传真：</td>
                                      <td width="77%" height="11"><font> 
                                        <input type="text" name="Fax" size="18" maxlength="36" value="<%=rst("Fax")%>" style="font-size: 14px" class="smallInput">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">E-mail：</td>
                                      <td width="77%" height="11"><font> 
                                        <input type="text" name="Email" size="18" maxlength="36" value="<%=rst("Email")%>" style="font-size: 14px" class="smallInput">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="25" align="right">反馈主题： 
                                      </td>
                                      <td width="77%" height="25"><input type="text" name="Title" size="42" maxlength="36" style="font-size: 14px" class="smallInput">
                                        *</td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="1" valign="top" align="right">反馈内容： 
                                      </td>
                                      <td width="77%" height="1" valign="top"><textarea rows="10" name="Content" cols="45" style="font-size: 14px" class="smallInput"></textarea> 
                                      </td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="0" valign="top"> 
                                      </td>
                                      <td width="77%" height="0" valign="top"> 
                                        <input type="submit" value="提交留言"
name="cmdOk"> <input type="reset" value="重写" name="cmdReset"> </td>
                                    </tr>
                                  </table>
                                </div></td>
                            </tr>
                          </table>
                        </form></td>
                    </tr>
                  </table> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
