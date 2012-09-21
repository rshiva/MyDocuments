
<%
Sub PutToShopBag( Prodid, ProductList )
   If Len(ProductList) = 0 Then
      ProductList = "'" & Prodid & "'"
   ElseIf InStr( ProductList, Prodid ) <= 0 Then
      ProductList = ProductList & ", '" & Prodid & "'"
   End If
End Sub
%>
<%
ProductList = Session("ProductList")
Products = Split(Request("Product_Id"), ",")
For I=0 To UBound(Products)
   PutToShopBag Products(I), ProductList
Next
Session("ProductList") = ProductList
If Session("UserName")<>"" Then
  Response.Redirect"Order_check.asp"
Else
%>
<HTML>
<HEAD>
<TITLE>会员登录</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="Contact" content="www.southidc.net 南方数据 QQ:635495">
<link href="mt_style.css" rel="stylesheet" type="text/css">
<script language=javascript>
	function CheckForm()
	{
		if(document.UserLogin.UserName.value=="")
		{
			alert("请输入用户名！");
			document.UserLogin.UserName.focus();
			return false;
		}
		if(document.UserLogin.Password.value == "")
		{
			alert("请输入密码！");
			document.UserLogin.Password.focus();
			return false;
		}
	}
</script>
</HEAD>
<BODY bgcolor="#D9D9D9" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<TABLE width="95%" height="95%"
border=0 align="center" cellPadding=1 cellSpacing=1 bgcolor="#FFFFFF">
  <TBODY>
    <TR align=middle> 
      <TD height="22" bgcolor="#333333" 2> 
        <div align="left"><font color="#F584B1"><font color="#FFFFFF">对不起，如要购买商品，必须先进行登录，如果您还没有注册为我们的会员，请<a href="UserReg.asp" target="_blank"><font color="#FF0000">注册</font></a>后再购买商品！&nbsp;</font></font> 
          <br>
          <font color="#FFFFFF">如果您已经是会员，请先登录：</font> </div></TD>
    </TR>
    <TR vAlign=top align=middle> 
      <TD height="240" valign="middle" bgcolor="#8EC7FF"> 
        <form action='mentLogin.asp' method='post' name='UserLogin' onSubmit='return CheckForm();'>
          <TABLE cellSpacing=0 cellPadding=0 width=100% height="47">
            <TBODY>
              <TR> 
                <TD align=middle height="47" width="100%"> <TABLE cellSpacing=1 width=100% height="98">
                    <TBODY>
                      <TR>
                        <TD height=31>&nbsp;</TD>
                        <TD height=31>会员登录</TD>
                      </TR>
                      <TR> 
                        <TD  width=328 height=18><div align="right">会员登录名称：</div></TD>
                        <TD  width=419 height=18><input name='UserName' type='text' id='UserName' size='13' maxlength='16'> 
                        </TD>
                      </TR>
                      <tr> 
                        <TD  width=328 height=1><div align="right">会员登录密码：</div></TD>
                        <TD  width=419 height=1><input name='Password' type='password' id='Password' size='13' maxlength='16'> 
                        </TD>
                      </tr>
                      <TR> 
                        <TD  colSpan=2 height="1"> <DIV align=center> 
                            <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0"> 
                              <input name='Login' type='submit' id='Login' value=' 登录 '>
                              &nbsp; </DIV></TD>
                      </TR>
                    </TBODY>
                  </TABLE></TD>
              </TR>
            </TBODY>
          </TABLE>
        </FORM></TD>
    </TR>
    <TR vAlign=top align=middle> 
      <TD height="22" bgcolor="#333333" 2> 
        <p>&nbsp;</p></TD>
    </TR>
  </TBODY>
</TABLE>
</BODY></HTML>
<%
end if
%>