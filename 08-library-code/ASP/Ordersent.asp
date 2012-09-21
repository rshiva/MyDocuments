<!--#include file="inc/conn.asp" -->
<%
UserName=session("UserName")			'登陆用户id
Receiver=request.form("Receiver")			'必填字段
Phone=request.form("Phone")		'必填字段
Add=request.form("Add")	'必填字段
PayType=request.form("PayType")			'必填字段
Notes=request.form("Notes")				'
Email=request.form("Email")			'
RecTime=request.form("RecTime")			'
Postcode=request.form("Postcode")			'
CompanyName=request.form("CompanyName")			
Fax=request.form("Fax")		
if UserName="" then UserName="游客" 

'判断购物车是否为空
ProductList = Session("ProductList")
if productlist="" then
 response.redirect "error.asp?error=007"
 response.end
else
  sql="select * from Product where Product_Id in ("&productlist&") order by Product_Id"
  Set rs = conn.Execute(sql)
end if

if session("sum")="" then response.redirect "error.asp?error=007"
Total=session("sum")

'产生订单号（内部和外部）及定单产生日期及其他信息
BranchID="0022"
CoNo="000040"

'交易日期，格式：YYYYMMDD
yy=right(year(date),2)
mm=right("00"&month(date),2)
dd=right("00"&day(date),2)
riqi=yy & mm & dd

'生成订单号所有所需元素,格式为：小时，分钟，秒
xiaoshi=right("00"&hour(time),2)
fenzhong=right("00"&minute(time),2)
miao=right("00"&second(time),2)

'产生外部和内部定单号
BillNo=xiaoshi & fenzhong & miao
inBillNo=yy & mm & dd & "-" & xiaoshi & fenzhong & miao

Set rsadd=server.createobject("adodb.recordset")
rsadd.Open "OrderList" ,conn,3,3
Set rsdetail=server.createobject("adodb.recordset")
rsdetail.Open "OrderDetail" ,conn,3,3

'事务定义开始
'conn.Begintrans

'操作之一开始写入订单列表信息
rsadd.AddNew 
rsadd("UserName")=UserName
rsadd("OrderNum")=inBillNo
rsadd("Receiver")=Receiver
rsadd("OrderSum")=Total
rsadd("Phone")=Phone
rsadd("Add")=Add
rsadd("RecTime")=now()
if Postcode<>"" then rsadd("Postcode")=Postcode
if Email<>"" then rsadd("Email")=Email
if CompanyName<>"" then rsadd("CompanyName")=CompanyName
if Fax<>"" then rsadd("Fax")=Fax
rsadd("PayType")=PayType
if Notes<>"" then rsadd("Notes")=Notes
if error>0 then
	response.write " 操作订单列表生成错误！！"
    return
end if
rsadd.Update


'擦作二订单详细信息写入另外的表中
Sum = 0
While Not rs.EOF '把购买的产品资料读出来，写入定单详细资料表中
     Quatity = CInt( Request( "Q_" & rs("Product_Id")) )
     If Quatity <= 0 Then 
        Quatity = CInt(Session(rs("Product_Id")) )
        If Quatity <= 0 Then Quatity = 1
     End If
     Session(rs("Title")) = Quatity
     Sum = Sum + csng(rs("Price")) * Quatity
     Sum = FormatNumber(Sum,2) 

 rsdetail.AddNew 
 if UserName<>"" then rsdetail("UserName")=UserName		'下单用户号
 rsdetail("OrderNum")=inBillNo		'订单号码
 rsdetail("Product_Id")=rs("Product_Id")		'产品编码
 rsdetail("ProductUnit")=Quatity		'购买数量
 rsdetail("BuyPrice")=rs("Price")'购买单价
 rsdetail("OrderTime")=date()

 IF ERROR>0 THEN
	response.write "操作订单详细信息表生成错误！！"
	RETURN
 END if

 rsdetail.Update
 rs.MoveNext
Wend
'事务操作结束
'conn.CommitTrans

rsdetail.close
set rsdetail=nothing
rsadd.close
set rsadd=nothing
Conn.Close
set conn=nothing
Session("ProductList") =""
%>

<HTML>
<HEAD>
<TITLE>订单提交成功</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="Contact" content="www.bingzhi.cn 冰之互联 QQ：101563903">
<link href="mt_style.css" rel="stylesheet" type="text/css">
</HEAD>

<BODY>
<table border="0" cellspacing="1" cellpadding="0" align="center" valign=absmiddle width="100%" height="100%" bgcolor="B0266D">
  <tr bgcolor="eeeeee"> 
    <td  bgcolor="eeeeee" align="center"><font color="B0266D">谢谢您，订单提交成功，请您记住您的订单号码，以便查询。</font></td>
  </tr> <tr bgcolor="#FFFFFF"> 
    <td width="100%" height="100%" align="center" valign="middle"> <font color="B0266D"><b>感谢您的订购我们的产品!</font><br>
	<br><font color="B0266D">您的订单号码是：<b><%=inBillNo%></b><br>
      <br>
      </font>
<%
  response.write message
%>
    <br><br>
	<a href="javascript:self.close()">点击关闭窗口</a></td>
  </tr>
</table>
</BODY>
</HTML>
