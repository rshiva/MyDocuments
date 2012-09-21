<!--#include file="md5char.asp"-->
<!--#include file="paysettings.asp"-->
<%
'#############################################################
'#               贺喜支付平台支付接口提交程序
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

'支付金额，以分为单位，最大支付金额：10000元
amount=Request("amount")
if not isNumeric(amount) then%>
<script language=vbscript>
  MsgBox "错误：支付金额必须为数字！"
  location.href = "javascript:history.back()"
</script>
<%Response.end
end if
amount=amount*100
'订单日期,长度：8
yy=year(date)
mm=month(now)
if len(mm)=1 then mm="0"&mm
dd=day(Date)
if len(dd)=1 then dd="0"&dd
'产生订单日期
ymd=yy&mm&dd
'商户订单号,长度：30可变，本示例中以系统时间和4位随机数产生订单号，格式：YYYYMMDDHHMMSS+4位随机数，共18位
'如果商户网站有自己的订单管理系统，建议商户订单号按照自己网站的订单号进行设置
'生成订单号所有所需元素,格式为：小时，分钟，秒
xiaoshi=right("00"&hour(time),2)
fenzhong=right("00"&minute(time),2)
miao=right("00"&second(time),2)
'生成4位随机数
Randomize
sjj=cstr(Int((8999 * Rnd) + 1000))
'以下billno为贺喜支付平台推荐标准订单号
billno=ymd&xiaoshi&fenzhong&miao&sjj

'自定义字段1、2
custom1=Request("custom1")
custom2=Request("custom2")

'选择的支付途径,1：银行卡支付，2：声讯电话支付，3：互联星空支付，4：手机短信注册，5：腾讯财付通支付，6：腾讯Q币支付，7：神州行充值卡支付，8：盛大游戏点卡支付，9：支付宝支付，10：手机银行支付，11：北京宽带支付。
payvia=Request("payvia")

post_md5info=Ucase(trim(md5(reg_userid&amount&ymd&receive_url&billno&custom1&custom2&payvia&paykey&pay_mode)))

%>
<HTML><HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<TITLE>订单提交页面</TITLE>
</HEAD>
<BODY onload='document.forms[0].submit();'>
<form name=form1 method="get" action="http://pay.168reg.cn/pay.do">
<input type=hidden name="reg_userid" value="<%=reg_userid%>">
<input type=hidden name="servicename" value="<%=servicename%>">
<input type=hidden name="amount" value="<%=amount%>">
<input type=hidden name="ymd" value="<%=ymd%>">
<input type=hidden name="receive_url" value="<%=receive_url%>">
<input type=hidden name="billno" value="<%=billno%>">
<input type=hidden name="custom1name" value="<%=custom1_name%>">
<input type=hidden name="custom1" value="<%=custom1%>">
<input type=hidden name="custom2name" value="<%=custom2_name%>">
<input type=hidden name="custom2" value="<%=custom2%>">
<input type=hidden name="paymode" value="<%=pay_mode%>">
<input type=hidden name="payvia" value="<%=payvia%>">
<input type=hidden name="post_md5info" value="<%=post_md5info%>">
</form>
<form name=form2 method="get" action="http://pay.168reg.cn/pay.do">
<input type=hidden name="reg_userid" value="<%=reg_userid%>">
<input type=hidden name="servicename" value="<%=servicename%>">
<input type=hidden name="amount" value="<%=amount%>">
<input type=hidden name="ymd" value="<%=ymd%>">
<input type=hidden name="receive_url" value="<%=receive_url%>">
<input type=hidden name="billno" value="<%=billno%>">
<input type=hidden name="custom1name" value="<%=custom1_name%>">
<input type=hidden name="custom1" value="<%=custom1%>">
<input type=hidden name="custom2name" value="<%=custom2_name%>">
<input type=hidden name="custom2" value="<%=custom2%>">
<input type=hidden name="paymode" value="<%=pay_mode%>">
<input type=hidden name="payvia" value="<%=payvia%>">
<input type=hidden name="post_md5info" value="<%=post_md5info%>">
订单已生成，请点击<input type="submit" value="立即支付" name="submit">。
</form>
</BODY></HTML>