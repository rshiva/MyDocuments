<!--#include file="Inc/syscode.asp"-->
<!--#include file="inc/Skin_css.asp"-->
<!--#include file="Inc/md5.asp"-->
<!-- #include file="Head.asp" -->
<%
dim UserName,Password,PwdConfirm,Question,Answer,Sex,Email,HomePage,CompanyName,Add,Receiver,Postcode,Phone,Fax
UserName=trim(request("UserName"))
Password=trim(request("Password"))
PwdConfirm=trim(request("PwdConfirm"))
Question=trim(request("Question"))
Answer=trim(request("Answer"))
Sex=trim(Request("Sex"))
Email=trim(request("Email"))
HomePage=trim(request("HomePage"))
CompanyName=trim(request("CompanyName"))
Add=trim(request("Add"))
Receiver=trim(request("Receiver"))
Postcode=trim(request("Postcode"))
Phone=trim(request("Phone"))
Fax=trim(request("Fax"))
if UserName="" or strLength(UserName)>14 or strLength(UserName)<4 then
	founderr=true
	errmsg=errmsg & "<br><li>请输入用户名(不能大于14小于4)</li>"
else
  	if Instr(UserName,"=")>0 or Instr(UserName,"%")>0 or Instr(UserName,chr(32))>0 or Instr(UserName,"?")>0 or Instr(UserName,"&")>0 or Instr(UserName,";")>0 or Instr(UserName,",")>0 or Instr(UserName,"'")>0 or Instr(UserName,",")>0 or Instr(UserName,chr(34))>0 or Instr(UserName,chr(9))>0 or Instr(UserName,"")>0 or Instr(UserName,"$")>0 then
		errmsg=errmsg+"<br><li>用户名中含有非法字符</li>"
		founderr=true
	end if
end if
if Password="" or strLength(Password)>12 or strLength(Password)<6 then
	founderr=true
	errmsg=errmsg & "<br><li>请输入密码(不能大于12小于6)</li>"
else
	if Instr(Password,"=")>0 or Instr(Password,"%")>0 or Instr(Password,chr(32))>0 or Instr(Password,"?")>0 or Instr(Password,"&")>0 or Instr(Password,";")>0 or Instr(Password,",")>0 or Instr(Password,"'")>0 or Instr(Password,",")>0 or Instr(Password,chr(34))>0 or Instr(Password,chr(9))>0 or Instr(Password,"")>0 or Instr(Password,"$")>0 then
		errmsg=errmsg+"<br><li>密码中含有非法字符</li>"
		founderr=true
	end if
end if
if PwdConfirm="" then
	founderr=true
	errmsg=errmsg & "<br><li>请输入确认密码(不能大于12小于6)</li>"
else
	if Password<>PwdConfirm then
		founderr=true
		errmsg=errmsg & "<br><li>密码和确认密码不一致</li>"
	end if
end if
if Question="" then
	founderr=true
	errmsg=errmsg & "<br><li>密码提示问题不能为空</li>"
end if
if Answer="" then
	founderr=true
	errmsg=errmsg & "<br><li>密码答案不能为空</li>"
end if
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
if Add="" then
	founderr=true
	errmsg=errmsg & "<br><li>收货地址不能为空</li>"
end if
if Postcode="" then
	founderr=true
	errmsg=errmsg & "<br><li>邮政编码不能为空</li>"
end if
if Phone="" then
	founderr=true
	errmsg=errmsg & "<br><li>联系电话不能为空</li>"
end if

if founderr=false then
	dim sqlReg,rsReg
	sqlReg="select * from [User] where UserName='" & Username & "'"
	set rsReg=server.createobject("adodb.recordset")
	rsReg.open sqlReg,conn,1,3
	if not(rsReg.bof and rsReg.eof) then
		founderr=true
		errmsg=errmsg & "<br><li>你注册的用户已经存在！请换一个用户名再试试！</li>"
	else
		rsReg.addnew
		rsReg("UserName")=UserName
		rsReg("Password")=md5(Password)
		rsReg("Question")=Question
		rsReg("Answer")=md5(Answer)
		rsReg("Sex")=Sex
		rsReg("Email")=Email
		rsReg("HomePage")=HomePage
		rsReg("CompanyName")=CompanyName
		rsReg("Add")=Add
		rsReg("Receiver")=Receiver
		rsReg("Postcode")=Postcode
		rsReg("Phone")=Phone
		rsReg("Fax")=Fax
		rsReg("RegDate")=Now()
		rsReg.update
		founderr=false
	end if
	rsReg.close
	set rsReg=nothing
end if		
%> 
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
                    <tr>
                      <td height="56"> <div align="center">
                          <%
if founderr=false then
	call RegSuccess()
else
	call WriteErrmsg()
end if
%>
                        </div></td>
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

<%call CloseConn
sub WriteErrMsg()
    response.write "<table align='center' width='300' border='0' cellpadding='2' cellspacing='0' class='border'>"
    response.write "<tr class='title'><td align='center' height='15'>由于以下的原因不能注册用户！</td></tr>"
    response.write "<tr class='tdbg'><td align='left' height='100'><br>" & errmsg & "<p align='center'>【<a href='javascript:onclick=history.go(-1)'>返 回</a>】<br></p></td></tr>"
	response.write "</table>" 
end sub

sub RegSuccess()
    response.write "<table align='center' width='300' border='0' cellpadding='2' cellspacing='0' class='border'>"
    response.write "<tr class='title'><td align='center' height='15'>成功注册用户！</td></tr>"
    response.write "<tr class='tdbg'><td align='left' height='100'><br>你注册的用户名：" & UserName & "<p align='center'>【<a href='javascript:onclick=window.close()'>关 闭</a>】<br></p></td></tr>"
	response.write "</table>" 
end sub
%>
