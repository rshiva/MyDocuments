<%@ LANGUAGE="VBScript" %>
<!--#include file="Inc/Conn.asp" -->
<%
'OrderNum= Request.form("Form_Id")
OrderNum= Request("OrderNum")
IF Session("UserName")="" Then
response.redirect "server.asp"
Else
set Rs3 = Server.CreateObject("ADODB.recordset")
sql3="select * from OrderList where OrderNum='"&OrderNum&"'"
rs3.open sql3,conn,1,1
IF  rs3.RecordCount >=1  then
IF Session("UserName")=rs3("UserName") Then
%>
<html>
<head>
<title>客户订货单详细信息</title>
<meta name="Contact" content="www.bingzhi.cn 冰之互联 QQ：101563903">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="mt_style.css" rel="stylesheet" type="text/css">
</head>
<%
id=Form_Id
set rs=server.createobject("adodb.recordset")
sqltext="select * from OrderList where OrderNum='"&OrderNum&"'"
rs.open sqltext,conn,1,1
%>

<body>
<br>    <div align="center">
<center>

  <TABLE cellSpacing=1 cellPadding=4 width=530 bgColor=#006699>
    <TBODY>
      <TR bgColor=#eeeeee> 
        <TD height="32"  colSpan=2><div align="center"><font color="#000000"><strong>客户订货单详细资料</strong></font></div></TD>
      </TR>
      <TR> 
        <TD  width=127 bgColor=#DBDBDB height=12 align="right"><font color="#000000">订货单号：</font></TD>
        <TD  width=402 height=12 bgcolor="#eeeeee">&nbsp; <%=rs("OrderNum")%></TD>
      </TR>
      <TR> 
        <TD bgColor=#DBDBDB height=12 align="right">公司名称<font color="#000000">：</font></TD>
        <TD  width=402 height=12 bgcolor="#eeeeee">&nbsp; <%=rs("CompanyName")%></TD>
      </TR>
      <tr> 
        <TD  width=127 bgColor=#DBDBDB height=25 align="right"><font color="#000000">收货人姓名：</font></TD>
        <TD  width=402 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("Receiver")%></TD>
      </TR>
      <tr> 
        <TD  width=127 bgColor=#DBDBDB height=25 align="right"><font color="#000000">收货地址：</font></TD>
        <TD  width=402 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("Add")%></TD>
      </tr>
      <tr> 
        <TD  width=127 bgColor=#DBDBDB height=25 align="right"><font color="#000000">邮政编码：</font></TD>
        <TD  width=402 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("Postcode")%></TD>
      </tr>
      <tr> 
        <TD  width=127 bgColor=#DBDBDB height=12 align="right"><font color="#000000">联系电话：</font></TD>
        <TD  width=402 height=12 bgcolor="#eeeeee">&nbsp; <%=rs("Phone")%></TD>
      </tr>
      <tr> 
        <TD bgColor=#DBDBDB height=12 align="right">联系传真<font color="#000000">：</font></TD>
        <TD  width=402 height=12 bgcolor="#eeeeee">&nbsp; <%=rs("Fax")%></TD>
      </tr>
      <tr> 
        <TD  width=127 bgColor=#DBDBDB height=25 align="right"><font color="#000000">电子信箱：</font></TD>
        <TD  width=402 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("EMail")%></TD>
      </tr>
      <tr> 
        <TD  width=127 bgColor=#DBDBDB height=25 align="right"><font color="#000000">所选汇款账号：</font></TD>
        <TD  width=402 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("PayType")%></TD>
      </tr>
      <tr> 
        <TD  width=127 height=25 align="right" bgColor=#DBDBDB><font color="#000000">备注：</font></TD>
        <TD  width=402 height=25 bgcolor="#eeeeee">&nbsp; <%=rs("Notes")%></TD>
      </tr>
      <tr> 
        <TD  width=127 bgColor=#DBDBDB height=24 align="right"><font color="#000000">订货日期：</font></TD>
        <TD  width=402 height=24 bgcolor="#eeeeee">&nbsp; <%=rs("OrderTime")%></TD>
      </tr>
      <tr> 
        <TD  width=127 bgColor=#DBDBDB height=25 align="right"><font color="#000000">订单是否已经处理：</font></TD>
        <TD  width=402 height=25 bgcolor="#eeeeee">&nbsp; <%If rs("Flag")="尚未处理" Then%>
          尚未处理 
          <%else%>
          已经发货 
          <%End If%> </TD>
      </tr>
      <TR> 
        <TD height="31"  colSpan=2 bgcolor="#eeeeee"> 
          <p align="center">订货<font color="#000000">产品</font>细目</p></TD>
      </TR>
      <%
set rs2=server.createobject("adodb.recordset")
sqltext2 = "select A.Product_Id,A.OrderNum,A.ProductUnit,C.Title,C.Price,C.BigClassName,C.SmallClassName from OrderDetail A,Product C where A.OrderNum='"&OrderNum&"' and A.Product_Id=C.Product_Id"

'sqltext2="select * from OrderDetail where OrderNum='"&OrderNum&"'"
rs2.open sqltext2,conn,1,1
%>
      <TR> 
        <TD height="15"  colSpan=2 valign="top" bgcolor="#eeeeee"> 
          <div align="center"> 
            <table border="1" cellpadding="0" cellspacing="0" width="100%" bordercolorlight="#006699" bordercolordark="#eeeeee"  height="66">
              <tr> 
                <td width="18%" bgcolor="#DBDBDB" height="21" align="center"><font color="#000000">产品编号</font></td>
                <td width="27%" bgcolor="#DBDBDB" height="21" align="center"><font color="#000000">产品名称</font></td>
                <td width="30%" bgcolor="#DBDBDB" height="21" align="center"><font color="#000000">产品类别</font></td>
                <td width="11%" align="center" bgcolor="#DBDBDB"><font color="#000000">产品数量</font></td>
                <td width="14%" height="21" align="center" bgcolor="#DBDBDB">合 
                  计</td>
              </tr>
              <%
			  Total = 0
While Not rs2.EOF 
     Sum=0	
     Sum = rs2("ProductUnit")*  FormatNumber(rs2("Price"),2)	 
	 Sum = FormatNumber(Sum,2)
	 Total = Sum + Total 
	   '计算总金额%>
              <tr> 
                <td width="18%" align="center" height="22"><%=rs2("Product_Id")%></td>
                <td width="27%" align="center" height="22"><%=rs2("Title")%></td>
                <td width="30%" align="center" height="22"><%=rs2("BigClassName")%> => <%=rs2("SmallClassName")%></td>
                <td align="center"><%=rs2("ProductUnit")%></td>
                <td height="22" align="center"><%=Sum%></td>
              </tr>
              <%
rs2.MoveNext
Wend
%>
              <tr> 
                <td colspan="2" height="21"> 
                  <p align="right">　</p></td>
                <td height="21"><div align="right">售价总金额:</div></td>
                <td height="21" colspan="2"><div align="right"><%=FormatNumber(Total,2)%></div></td>
              </tr>
            </table>
          </div></TD>
      </TR><center>
    <TR> 
      <TD height="25"  colSpan=2 bgcolor="#eeeeee"> <p align="center"> 
          <input name="close" type="button" id="close" onclick="javascript:window.close()" value="关闭">
      </TD>
    </TR>    
  </TABLE>
</div>
</form>

<p>
<%
Else
response.redirect "Loginsb.asp?msg=您不能查看不属于您的订单，请重新输入您自己的订单号！"
End If
Else
response.redirect "Loginsb.asp?msg=您输入的订单号不存在或格式不正确，请重新输入！"
End IF

End if
rs3.close
conn.close
%>

</body>
</html>