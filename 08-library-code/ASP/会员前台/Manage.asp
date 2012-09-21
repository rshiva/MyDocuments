<!--#include file="conn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="function.asp"-->
<%
dim Action,UserName,FoundErr,ErrMsg
dim rsUser,sqlUser
Action=trim(request("Action"))
UserName=trim(request("UserName"))
if UserName="" then
	UserName=session("UserName")
end if
if  UserName="" then
	if Action="" then
		response.redirect "Server.asp"
	else
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>参数不足！</li>"
	end if
end if
if FoundErr=true then
	call WriteErrMsg()
else
	Set rsUser=Server.CreateObject("Adodb.RecordSet")
	sqlUser="select * from [User] where UserName='" & UserName & "'"
	rsUser.Open sqlUser,conn,1,3
	if rsUser.bof and rsUser.eof then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>找不到指定的用户！</li>"
		call writeErrMsg()
	else
		if Action="Modify" then
			dim Sex,Email,Homepage
			Sex=trim(Request("Sex"))
			Email=trim(request("Email"))
			Homepage=trim(request("Homepage"))
			CompanyName=trim(request("CompanyName"))
			Add=trim(request("Add"))
			Receiver=trim(request("Receiver"))
			Postcode=trim(request("Postcode"))
			Phone=trim(request("Phone"))
			Fax=trim(request("Fax"))
			if Sex="" then
				founderr=true
				errmsg=errmsg & "<br><li>性别不能为空</li>"
			else
				sex=cint(sex)
				if Sex<>0 and Sex<>1 then
					Sex=1
				end if
			end if
			if Email="" then
				founderr=true
				errmsg=errmsg & "<br><li>Email不能为空</li>"
			else
				if IsValidEmail(Email)=false then
					errmsg=errmsg & "<br><li>您的Email有错误</li>"
			   		founderr=true
				end if
			end if
			if CompanyName="" then
				founderr=true
				errmsg=errmsg & "<br><li>公司名称不能为空</li>"
			end if
			if Add="" then
				founderr=true
				errmsg=errmsg & "<br><li>收货地址不能为空</li>"
			end if
			if Receiver="" then
				founderr=true
				errmsg=errmsg & "<br><li>收货人不能为空</li>"
			end if
			if Phone="" then
				founderr=true
				errmsg=errmsg & "<br><li>联系电话不能为空</li>"
			end if
			if FoundErr<>true then
				rsUser("Sex")=Sex
				rsUser("Email")=Email
				rsUser("HomePage")=HomePage
				rsUser("CompanyName")=CompanyName
				rsUser("Add")=Add
				rsUser("Receiver")=Receiver
				rsUser("Postcode")=Postcode
				rsUser("Phone")=Phone
				rsUser("Fax")=Fax
				rsUser("LastLoginTime")=Now()
				rsUser.update
				response.write"<SCRIPT language=JavaScript>alert('会员资料修改成功！');"
                response.write"javascript:history.go(-1)</SCRIPT>"				
			else
				call WriteErrMsg()
			end if
		else

%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" > <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;会员中心</td>
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
                      <td class="title_right" height="32">&nbsp;会 
                        员 中 心</td>
                    </tr>
                  </table>
				  				  
				  <FORM name="Form1" action="Manage.asp" method="post">		  
                  <table width=500 border=0 align="center" cellpadding=2 cellspacing=2 class='border'>
                    <TR align=center class='title'> 
                      <TD height=20 colSpan=2><font color="#FF6600" class=font14><b>修改注册用户信息</b></font></TD>
                    </TR>
                    <TR> 
                      <TD width="120" align="right"><b>用 户 名：</b></TD>
                      <TD> <INPUT name=UserName value="<%=rsUser("UserName")%>" size=30   maxLength=14></TD>
                    </TR>
                    <TR> 
                      <TD width="120" align="right"><strong>性别：</strong></TD>
                      <TD> <INPUT type=radio value="1" name=sex <%if rsUser("Sex")=1 then response.write "CHECKED"%>>
                        男 &nbsp;&nbsp; <INPUT type=radio value="0" name=sex <%if rsUser("Sex")=0 then response.write "CHECKED"%>>
                        女</TD>
                    </TR>
                    <TR> 
                      <TD width="120" align="right"><strong>Email地址：</strong></TD>
                      <TD> <INPUT name=Email value="<%=rsUser("Email")%>" size=30   maxLength=50> 
                      </TD>
                    </TR>
                    <TR> 
                      <TD width="120" align="right"><strong>主页：</strong></TD>
                      <TD> <INPUT   maxLength=100 size=30 name=homepage value="<%=rsUser("HomePage")%>"></TD>
                    </TR>
                    <TR> 
                      <TD width="120" align="right"><strong>公司名称：</strong></TD>
                      <TD> <INPUT name=CompanyName value="<%=rsUser("CompanyName")%>" size=30 maxLength=20></TD>
                    </TR>
                    <TR> 
                      <TD width="120" align="right"><strong>收货地址：</strong></TD>
                      <TD> <INPUT name=Add value="<%=rsUser("Add")%>" size=30 maxLength=50></TD>
                    </TR>
                    <TR> 
                      <TD align="right"><strong>收货人：</strong></TD>
                      <TD><INPUT name=Receiver value="<%=rsUser("Receiver")%>" size=30 maxLength=50></TD>
                    </TR>
                    <TR> 
                      <TD align="right"><strong>邮政编码：</strong></TD>
                      <TD><INPUT name=Postcode value="<%=rsUser("Postcode")%>" size=30 maxLength=50></TD>
                    </TR>
                    <TR> 
                      <TD align="right"><strong>联系电话：</strong><br></TD>
                      <TD><INPUT name=Phone value="<%=rsUser("Phone")%>" size=30 maxLength=50></TD>
                    </TR>
                    <TR> 
                      <TD align="right"><strong>传 真：</strong></TD>
                      <TD><INPUT name=Fax value="<%=rsUser("Fax")%>" size=30 maxLength=50></TD>
                    </TR>
                    <TR align="center" > 
                      <TD height="40" colspan="2"><input name="Action" type="hidden" id="Action" value="Modify"> 
                        <input name=Submit   type=submit id="Submit" value="保存修改结果"> 
                    </TR>
                  </TABLE> 
				  </form>			  
				  
			    </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</BODY></HTML>
<%
		end if
	end if
	rsUser.close
	set rsUser=nothing
end if
call CloseConn()
%>