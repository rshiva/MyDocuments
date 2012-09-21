<!--#include file="inc/conn.asp" -->
<%on error resume next%>
<%
'判断是否需要注册
if reg<>"1" then
	'判断是否正常购买，如果不是，需要登陆
	if session("UserName")="" then 
		response.redirect "error.asp?error=006"
		response.end
	end if
end if

username=Session("username")
set Rs = Server.CreateObject("ADODB.recordset")
sql="select * from [User] where username='"&username&"'"
rs.open sql,conn,1,1

'判断购物车是否为空
ProductList = Session("ProductList")
if productlist<>"" then
  sql="select * from Product where Product_Id in ("&productlist&") order by     Product_Id"
  Set rs = conn.Execute( sql )
else
  response.redirect "error.asp?error=007"
  response.end
end if
%> 
<html>
<head>
<title>填写订单详细信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="Contact" content="www.bingzhi.cn 冰之互联 QQ：101563903">
<link href="mt_style.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
function CheckForm()
{
	if (document.payment.Recname.value.length == 0) {
		alert("请输入收货人的 姓名.");
		document.payment.Recname.focus();
		return false;
	}

	if (document.payment.address.value.length == 0) {
		alert("请输入收货人的 地址.");
		document.payment.address.focus();
		return false;
	}

    if (document.payment.paytype.value.length == 0) {
		alert("请选择您的支付方式.");
		document.payment.paytype.focus();
		return false;
	}

	if (document.payment.Recmail.value.length == 0) {
		alert("请输入此订单收货人的EMAIL.");
		document.payment.Recmail.focus();
		return false;
	}
	if (document.payment.Recmail.value.length > 0 && !document.payment.Recmail.value.match( /^.+@.+$/ ) ) {
	    alert("EMAIL 错误！请重新输入");
	    document.payment.Recmail.focus();
		return false;
	}
	
	if (document.payment.RecPhone.value.length == 0) {
		alert("请收货人的电话.");
		document.payment.RecPhone.focus();
		return false;
	}

	return true;
}

</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0">
 <br>
<table border="0" cellspacing="1" cellpadding="0" align="center" width="520" bgcolor="#000000">
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" height="25">&nbsp;&nbsp;<font color=B0266D><%=session("UserName")%> 您选购的商品清单如下：</font> 
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="50%" height="25" align="center"> 
      <font color="B0266D">商 品 名 称</font>
    </td>
    <td width="10%" align="center"> 
      <font color="B0266D">数 量</font>
    </td>
    <td width="20%" align="center"> 
     <font color="B0266D">单 价</font>
    </td> 
	<td width="20%" align="center"> 
     <font color="B0266D">合 计</font>
    </td>
  </tr>
<%
   Sum = 0
   While Not rs.EOF
   Quatity = CInt( Request( "Q_" & rs("Product_Id")) )
   If Quatity <= 0 Then 
       Quatity = CInt( Session(rs("Product_Id")) )
       If Quatity <= 0 Then Quatity = 1
   End If
    Session(rs("Title")) = Quatity
    Sum = Sum + csng(rs("Price")) * Quatity
    Sum=FormatNumber(Sum,2) 
    Session("sum")=sum
%> 
  <tr bgcolor="#FFFFFF"> 
    <td width="50%" height="20">&nbsp;<font color="B0266D"><%=rs("Title")%></font></td>
    <td width="10%">&nbsp;<font color="B0266D"><%=Quatity%></font></td>
    <td width="20%">&nbsp;<font color="B0266D"><%=FormatNumber(rs("Price"),2)%></font></td>
	<td width="20%">&nbsp;<font color="B0266D"><%=FormatNumber(csng(rs("Price"))*Quatity,2)%></font></td>
  </tr>
<%
rs.MoveNext
Wend
rs.close
set rs=nothing
%> 
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" height="25" align="right"> 
      <b><font color="#B0266D">总价格=<%=Sum%></font>&nbsp;&nbsp;
    </td>
  </tr>
</table>
<br>
<br>
<table border="0" cellspacing="1" cellpadding="3" align="center" width="520" bgcolor="#000000">
  <form name="payment" action="previeworder.asp" method="POST"  onSubmit="return CheckForm();">
<%
sql="select * from [User] where UserName='"&session("UserName")&"'"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
Postcode=rs("Postcode")
Phone=rs("Phone")
Add=rs("Add")
Email=rs("Email")
Receiver=rs("Receiver")
CompanyName=rs("CompanyName")
Fax=rs("Fax")
rs.close
set rs=nothing
%>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%">收货人姓名</td>
      <td width="30%"><input type="text" name="Receiver" class="form" size="15" value=<%=Receiver%>> 
        <b><font color="#FF3333">*</font></b> </td>
      <td>收货人电话</td>
      <td><input type="text" name="Phone" class="form" size="15" value=<%=Phone%>> 
        <b><font color="#FF3333">*</font></b> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="27">收货人邮箱</td>
      <td height="27"><input type="text" name="Email"  size="16" value=<%=Email%>> 
        <b><font color="#FF3333">*</font></b></td>
      <td height="30">支付方式</td>
      <td><select name="Paytype">
          <option value="" selected>请选择支付方式</option>
<%
sqlp="select paytype from paydefault"
set rsp=server.createobject("ADODB.Recordset")
rsp.open sqlp,conn,1,1
while not rsp.eof
%>
<option value="<%=rsp("paytype")%>"><%=rsp("paytype")%></option>
<%
rsp.movenext
wend
rsp.close
set rsp=nothing
%>
 </select>
        <b><font color="#FF3333">*</font></b> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30">邮政编码</td>
      <td> <input type="text" name="Postcode" size="15" value=<%=Postcode%>></td>
      <td>联系传真</td>
      <td><input type="text" name="Fax" size="15" value=<%=Fax%>></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30" >公司名称</td>
      <td colspan=3><input type="text" name="CompanyName" size="45" value=<%=CompanyName%>></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30" > 收货人地址</td>
      <td colspan=3><input name="Add" size=45 value='<%=Add%>'> 
        <b><font color="#FF3333">*</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30" >备注留言</td>
      <td colspan="3"> &nbsp; <textarea name="Notes" cols="35" rows="4"></textarea> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="35" colspan="4" align="center"> <input type=hidden name="Sum" value="<%=Sum%>"> 
        <input type="button" name="Submit21" onclick="javascript:history.go(-1)" value="&lt;&lt; 返回修改"> 
        &nbsp;&nbsp;&nbsp; <input type="submit" name="nextstep" value="确认订单 >>"> 
        &nbsp;&nbsp;&nbsp; <input type="reset" name="reset" value="重新填写信息"> </td>
    </tr>
  </form>
</table>
</body>
</html>
<%
set conn=nothing
%>
<!--
★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★
★                                                                  ★
☆ （请保留此处版权信息，这些内容并不会对您的网站运行有任何影响）   ☆
★                                                                  ★
☆                亚光（福建）有限公司                              ☆
★                                                                  ★
☆  版权所有: yagn.cn                                               ☆
★                                                                  ★
☆  程序制作: 亚光（福建）有限公司                                  ☆
★            email:syklw@hotmail.com                               ★
☆            Tel:13004808633    QQ:56786508                        ☆
★                                                                  ★
☆  相关网址: http://www.yagn.cn                                    ☆
★                                                                  ★
☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
-->