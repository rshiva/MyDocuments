<!--#include file="conn.asp"-->
<!--#include file="sql.asp"-->
<!--#include file="admin.asp"-->
<%
zj=replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(left(replace(Request.ServerVariables("SERVER_NAME"),"www.",""),6),"0","a"),"1","b"),"2","c"),"3","d"),"4","e"),"5","f"),"6","g"),"7","h"),"8","i"),"9","j"),"a","40"),"b","41"),"c","52"),"d","53"),"e","64"),"f","65"),"g","76"),"h","77"),"i","88"),"j","89"),"k","20"),"l","21"),"m","22"),"n","23"),"o","24"),"p","25"),"q","26"),"r","27"),"s","28"),"t","29"),"u","30") ,"v","31") ,"w","32") ,"x","33") ,"y","34") ,"z","35") ,"-","36") ,".","37")
yzcv=zj*(len(zj)+len(zcn&"liangjingcr"))
Do While yzcv>10000000000
yzcv=yzcv-10000000000
Loop
'Response.Write yzcv&"<BR>"
'Response.Write zcv
if yzcv<>zcv then
response.write chr(60)&chr(98)&chr(62)&chr(60)&chr(102)&chr(111)&chr(110)&chr(116)&chr(32)&chr(99)&chr(111)&chr(108)&chr(111)&chr(114)&chr(61)&chr(35)&chr(70)&chr(70)&chr(48)&chr(48)&chr(48)&chr(48)&chr(62)&chr(-19219)&chr(-12557)&chr(-23622)&chr(-19508)&chr(-12046)&chr(-13872)&chr(-12620)&chr(-10334)&chr(-19743)&chr(44)&chr(-19253)&chr(-18010)&chr(-15140)&chr(-19781)&chr(-15140)&chr(-13639)&chr(-11325)&chr(33)&chr(60)&chr(47)&chr(102)&chr(111)&chr(110)&chr(116)&chr(62)&chr(60)&chr(47)&chr(98)&chr(62)
response.end
else
set rs=server.createobject("adodb.recordset")
sqltext="select * from admin"
rs.open sqltext,conn,1,1
end if
%>
<script language="javascript">
function confirmdel(id){
if (confirm("真的要删除此管理员帐号?"))
window.location.href="Delmanager.asp?id="+id+"  "   }
</script>
<SCRIPT language=javascript id=clientEventHandlersJS>
<!--
function myform_onsubmit()
{
if (document.myform.Password.value!=document.myform.ConPassword.value)
{
alert ("新密码和确认密码不一致。");
document.myform.Password.value='';
document.myform.ConPassword.value='';
document.myform.Password.focus();
return false;
}
}
//-->
</SCRIPT>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <br> <strong><br>
      </strong> <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td class="back_southidc" width="598" height="25" > <div align="center"><strong>添加管理员</strong></div></td>
        </tr>
        <tr class="tr_southidc"> 
          <FORM language=javascript name=myform  onsubmit="return myform_onsubmit()"
action=addmanagerok.asp method=post>
            <td><table width="50%" border="0" align="center" >
                <tr> 
                  <td height="25" colspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="29%" height="22"> <div align="right">管理员帐号：</div></td>
                  <td width="71%"><input name="UserName" type="text" id="UserName" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">管理员密码：</div></td>
                  <td><input name="Password" type="password" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">密码确认：</div></td>
                  <td><input name="ConPassword" type="password" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22" colspan="2"><div align="center">
                      <INPUT type=submit value='确认添加' name=Submit2>
                    </div></td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table>
      <br> 
      <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td width="553" height="25" class="back_southidc"> <div align="center"><strong>管理员帐号管理</strong></div></td>
        </tr>
        <tr class="tr_southidc"> 
          <FORM language=javascript
action=addmanagerok.asp method=post>
            <td><br> 
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2">
                <tr bgcolor="#A4B6D7"> 
                  <td width="28%" height="25"> 
                    <div align="center">管理员帐号</div></td>
                  <td width="28%"> 
                    <div align="center">管理员密码</div></td>
                  <td width="24%"> 
                    <div align="center">操作</div></td>
                  <td width="20%"> 
                    <div align="center">删除</div></td>
                </tr>
                <%
				
if not rs.eof then
do while not rs.eof
%>
                <tr bgcolor="#DFEBF2"> 
                  <td height="22"> 
                    <div align="center"><%=rs("UserName")%></div></td>
                  <td> 
                    <div align="center"><%=rs("PassWord")%></div></td>
                  <td> 
                    <div align="center">
                      <%response.write "<a href='Manage_Adminedit.asp?ID="&rs("Id")&"'  >修改密码</a>"%>
                    </div></td>
                  <td> 
                    <div align="center">
                      <%response.write "<a href='javascript:confirmdel(" & rs("Id") & ")'>删除</a>"%>
                    </div></td>
                </tr>
<%
rs.movenext
loop
end if
%>
<%
rs.close
conn.close
%>
              </table></td>
          </form>
        </tr>
      </table>
      <strong> </strong></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->