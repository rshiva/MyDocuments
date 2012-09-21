<!--#include file="md5char.asp"-->
<!--#include file="paysettings.asp"-->
<%
'#############################################################
'#               贺喜支付平台支付接口接收程序
'#                            v2.0
'#                   http://www.168reg.cn
'#
'#  版权所有: 株洲市和谐网络科技发展有限公司
'#
'#  主页地址: http://www.168reg.cn
'#  技术支持: support@168reg.cn
'#  技 术 QQ: 359465724
'#  技术QQ群：8246422，7048987
'#
'#############################################################
'# ·郑重声明:
'# ·此程序不得随意公开发布、销售或进行其他非法转让。
'# ·如对此程序有任何疑问，请在管理区留言。
'#############################################################
'本文件功能介绍：
'1、根据自己的密钥设置验证返回的加密字符串是否正确。
'2、显示定单支付成功页面。
'3、如果返回的提交有错误，即显示错误信息。
'4、为了增强返回定单的安全性，系统返回的加密字符串由多个定单信息拼凑在一起后经过MD5加密后产生的。下面的程序已经完成了此加密字符串的验证。
'5、为了防止黑客通过不正常的手段恶意返回(刷新)成功页面，请您在此程序中加入验证定单号的功能，即每一个成功定单只能反馈一次此页面。下面的程序中有验证定单号的示例程序，供您研究和使用。
'6、反馈的定单数据您都可以充分利用并添加到您自己的数据库中。下面的程序中根据您的设置有一段是保存定单信息到数据库中的示例程序，供您研究和使用。

'为防止用户多次刷新成功页面，使缓存的页面立即过期
Response.expires = 0
Response.expiresabsolute = now() - 1
Response.addHeader "pragma","no-cache"
Response.addHeader "cache-control","private"
Response.cachecontrol = "no-cache"
'您可以充分利用以下反馈信息并添加到您自己的数据库中。
vip=Request.ServerVariables("Remote_Addr")   '提交者IP地址
v_orderid=Request("v_orderid")   '贺喜支付平台反馈的定单号
v_orderdate=Request("v_orderdate")   '定单成交时间
v_price=Request("v_price")   '定单成交价格，以分为单位
v_billno=Request("v_billno")   '商户订单号
v_custom1=Request("v_custom1")   '自定义字段1
v_custom2=Request("v_custom2")   '自定义字段2
v_mobileno=Request("v_mobileno")   '用户支付的手机号码
v_servicename=Request("v_servicename")   '支付订单的服务名称
v_payvia=Request("v_payvia")   '用户选择的支付途径，1：银行卡在线支付；2：声讯电话支付；3：互联星空支付；4：手机短信注册；5，腾讯财付通支付；6，腾讯Q币支付；7，神州行充值卡支付；8，盛大游戏点卡支付；9，支付宝支付；10，手机银行支付；11，北京宽带支付
v_payviastr=Request("v_payviastr")   '用户选择的支付途径中文名称
v_md5=Request("v_md5")   '返回的加密字符串
v_pstatus=Request("v_pstatus")   '定单成功反馈的字符串，有1和0两种情况。主要用于验证是否属正常反馈。
v_pstring=Request("v_pstring")   '定单支付状态说明。
v_paymode=Request("v_paymode")   '当前定单运行模式，仅启用测试模式时有效，值为testmode。
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>贺喜多途径支付平台支付返回页面</title>
<STYLE type="text/CSS">
Body {text-Align:Center;Font-Size:9pt}
TD {Font-Size:9pt}
input {font-size:9pt}
.style3 {	COLOR: #000000
}
</STYLE>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>

<body>
<div align="center">
  <center>
  <map name="MapMapMapMap2">
    <area shape="rect" coords="3,36,73,54" href="#" onClick="MM_openBrWindow('http://www.168reg.cn/','','scrollbars=yes')">
    <area shape="rect" coords="76,36,140,54" href="#" onClick="MM_openBrWindow('http://www.168reg.com/help.asp','','scrollbars=yes')">
  </map>  
  <TABLE height=400 cellSpacing=1 cellPadding=0 width=370 align=center 
bgColor=#666666 border=0>
    <TBODY>
      <TR bgColor=#f7fef1>
        <TD width="100%" bgColor=#ffffff><TABLE height=400 cellSpacing=0 cellPadding=0 width=570 border=0>
            <TBODY>
              <TR>
                <TD vAlign=top height=63><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                      <TR>
                        <TD valign="top"><table width="101%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="15%"><a href="http://www.168reg.cn" target="_blank"><img src="images/logo.gif" width="173" height="62" border="0"></a></td>
                            <td width="71%">&nbsp;</td>
                            <td width="14%"><img src="images/top_right.gif" width="148" height="62" usemap="#MapMapMapMap2" border="0">
                            </td>
                          </tr>
                          <tr bgcolor="#666666">
                            <td colspan="3" height="2"></td>
                          </tr>
                        </table></TD>
                        </TR>
                      <TR bgColor=#666666>
                        <TD height=1 valign="top"></TD>
                      </TR>
                    </TBODY>
                </TABLE></TD>
              </TR>
              <TR>
                <TD vAlign=top height=337><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                      <TR>
                        <TD background=images/bg.gif height=312><TABLE height=301 cellSpacing=3 cellPadding=3 width=557 
                  align=center border=0>
                            <TBODY>
                              <TR>
                                <TD colSpan=3></TD>
                              </TR>
                              <TR>
                                <TD width=5></TD>
                                <TD width=547 vAlign=top bgColor=#FFFFFF><div align="center">
                                  <table width="524" height="360" border="0" align="center">
                                    <tr>
                                      <td width="518" height="356" bgcolor="#FFFFFF" valign="top"><div align="center">
                                          <Table bgColor="#CCCCCC" Width="100%" height="356" Border=0 CellSpacing=1 CellPadding=5>
<%
if v_pstatus="1" then
if v_orderid="" or v_orderdate="" or v_price="" or v_md5="" or v_payvia="" then%>
<script language=vbscript>
  MsgBox "非法反馈：反馈的数据不正确！"
  location.href = "/"
</script>
<%Response.end
end if
'以下程序验证返回的加密字符串是否正确
encrypt_string=Ucase(trim(md5(v_orderid&v_billno&v_custom1&v_custom2&v_price&v_payvia&reg_userid&v_pstatus&paykey&v_paymode)))
if v_md5<>encrypt_string then%>
<script language=vbscript>
  MsgBox "致命错误：返回的加密字符串不正确，您是非法提交！"
  location.href = "/"
</script>
<%Response.end
end if
'验证返回的加密字符串是否正确程序结束

'将订单支付金额换成以元为单位
payfee=FormatNumber(v_price/100,2,True)

'贺喜支付平台强烈推荐您进行定单号验证，如果觉得定单可疑，请到商户管理区核对。因为贵站安全措施未做好而造成的损失，贺喜支付平台概不负责。

'判断是否使用简易版定单管理系统，验证并保存定单信息
if order_mode then
	connstr="DBQ="+server.mappath("order/168regorder.asp")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
	set conn=server.createobject("ADODB.CONNECTION")
	conn.open connstr
	set rs=server.createobject("adodb.recordset")
	'检测定单号是否已存在于数据库中，可根据自己的数据库修改或使用我们提供的示例数据库。
	sql="SELECT orderid FROM myorder where orderid='" & v_orderid & "'"
	rs.open sql,conn,1,1
	hassave=false
	if not rs.eof then
		hassave=true
		'以下显示用户多次刷新或提交的错误页面，可根据自己网站进行美化。
		%>
		<script language=vbscript>
		  MsgBox "错误：该定单已经成功支付并成功返回，请勿重复刷新页面！"
		</script>
		<%
	end if
	rs.close
	if not hassave then
		'将定单添加到自己的数据库中
		sql="SELECT * FROM myorder"
		rs.open sql,conn,1,3
		rs.addnew
		rs("orderid")=v_orderid
		rs("billno")=v_billno
		rs("servicename")=v_servicename
		rs("price")=payfee
		rs("custom1")=v_custom1
		rs("custom2")=v_custom2
		rs("payvia")=v_payviastr
		rs("pstring")=v_pstring
		rs("orderdate")=v_orderdate
		rs("vip")=vip
		rs.update
		rs.close
	end if
	set rs=nothing
	conn.close
else
	'以下程序能简单地防止用户是否多次刷新成功页面，最好的方法是您做成从自己的数据库中检测v_orderid定单号是否已成交，如果已成交，就不显示页面。
	if session("reg168_orderid")<>"" then
		if session("reg168_orderid")=v_orderid then%>
		<script language=vbscript>
		  MsgBox "错误：同一定单成交页面不允许多次刷新或提交！"
		  location.href = "/"
		</script>
		<%Response.end
		else
			session("reg168_orderid")=v_orderid
		end if
	else
		session("reg168_orderid")=v_orderid
	end if
end if

'下面请放入定单成功页面的HTML代码，可自定义%>
    <Tr bgColor="#FFFFFF">
      <Td colspan="2" align=Right><div align="left">
          <p align="center"><SPAN 
class=style3><font color="#FF0000" size="3"><b>支付成功</b></font></SPAN></div></Td>         
    </TR>

    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>服务名称：</p>
</td>
<td width="73%">
<p><%=v_servicename%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>支付金额：</p>
</td>
<td width="73%">
<p><%=payfee%> 元</p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>商户订单号：</p>
</td>
<td width="73%">
<p><%=v_billno%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>贺喜支付平台订单号：</p>
</td>
<td width="73%">
<p><%=v_orderid%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>支付途径：</p>
</td>
<td width="73%">
<p><%=v_payviastr%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>付款状态：</p>
</td>
<td width="73%">
<p><%=v_pstatus%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>付款状态说明：</p>
</td>
<td width="73%">
<p><%=v_pstring%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>IP地址：</p>
</td>
<td width="73%">
<p><%=vip%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>订单成交时间：</p>
</td>
<td width="73%">
<p><%=v_orderdate%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>自定义字段1：</p>
</td>
<td width="73%">
<p><%=v_custom1%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>自定义字段2：</p>
</td>
<td width="73%">
<p><%=v_custom2%></p>
</td>
    </TR>
<%
'用户选择手机短信注册时将返回手机号码
if v_payvia=4 then%>
		<Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>用户手机号码：</p>
</td>
<td width="73%">
<p><%=v_mobileno%></p>
</td>
    </TR>
<%end if%>
		<Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>返回的加密字符串：</p>
</td>
<td width="73%">
<p><%=v_md5%></p>
</td>
    </TR>
		<Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>运行模式：</p>
</td>
<td width="73%">
<p><%if v_paymode="testmode" then%>测试模式<%else%>正式模式<%end if%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p><font color="#FF0000"><b>说明：</b></font></p>
</td>
<td width="73%">
<p>支付返回页面中不需要显示的信息请自行删除。</p>
</td>
    </TR>
<%
else
'下面请放入定单失败页面的HTML代码
%>
    <Tr bgColor="#FFFFFF">
      <Td colspan="2" align=Right><div align="left">
          <p align="center"><SPAN 
class=style3><font color="#FF0000" size="3"><b>支付失败<br><br>
原因：
<%if v_pstring="" then
	Response.write "非法进入返回页面"
else
	Response.write v_pstring
end if%>
</b></font></SPAN></div></Td>         
    </TR>
<%end if%>

                                          </Table>
                                      </div></td>
                                    </tr>
                                  </table>
                                  </div></TD>
                                <TD width=5></TD>
                              </TR>
                              <TR>
                                <TD colSpan=3 height=5></TD>
                              </TR>
                            </TBODY>
                        </TABLE></TD>
                      </TR>
                      <TR>
                        <TD bgColor=#f7f3ef background="images/copy.gif" height="22"><DIV align=center>
                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                              <TBODY>
                                <TR>
                                  <TD bgColor=#999999 height=1></TD>
                                </TR>
                                <TR>
                                  <TD height=1></TD>
                                </TR>
                                <TR>
                                  <TD bgColor=#999999 height=1></TD>
                                </TR>
                              </TBODY>
                            </TABLE>
                            版本：2.0</DIV></TD>
                      </TR>
                    </TBODY>
                </TABLE></TD>
              </TR>
            </TBODY>
        </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
  </center>
</div>
</body>

</html>