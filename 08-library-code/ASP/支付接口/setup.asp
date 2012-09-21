<%
'#############################################################
'#               贺喜支付平台支付接口安装程序
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
on error resume next
'获取本文件名
thisfilename=right(Request.ServerVariables("SCRIPT_NAME"),len(Request.ServerVariables("SCRIPT_NAME"))-InStrRev(Request.ServerVariables("SCRIPT_NAME"),"/"))
if request.form("submit")<>"" then
	reg_userid=request.form("reg_userid")
	reg_key=request.form("reg_key")
	servicename=request.form("servicename")
	receive_url=request.form("receive_url")
	use_custom1=request.form("use_custom1")
	custom1_name=request.form("custom1_name")
	use_custom2=request.form("use_custom2")
	custom2_name=request.form("custom2_name")
	fee_mode=request.form("fee_mode")
	pay_fee=request.form("pay_fee")
	payvia_list=request.form("payvia_list")
	payvia_mode=request.form("payvia_mode")
	order_mode=request.form("order_mode")
	orderuser=request.form("orderuser")
	orderpass=request.form("orderpass")
	pay_mode=request.form("pay_mode")
	deletefile=request.form("deletefile")
	if reg_userid="" then%>
	<script language=vbscript>
	  MsgBox "错误：商户编号必须填写！"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	else
		if not isNumeric(reg_userid) then%>
		<script language=vbscript>
		  MsgBox "错误：商户编号必须为数字！"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
		end if
	end if
	if reg_key="" then%>
	<script language=vbscript>
	  MsgBox "错误：商户密钥必须填写！"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	end if
	if len(reg_key)>30 then%>
	<script language=vbscript>
	  MsgBox "错误：商户密钥长度必须小于30个字符！"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	end if
	if servicename="" then%>
	<script language=vbscript>
	  MsgBox "错误：服务名称必须填写！"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	end if
	if receive_url="" then%>
	<script language=vbscript>
	  MsgBox "错误：支付结果返回地址必须填写！"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	end if
	if use_custom1 then
		if custom1_name="" then%>
		<script language=vbscript>
		  MsgBox "错误：启用自定义字段1后自定义字段1显示名称必须填写！"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
		end if
	end if
	if use_custom2 then
		if custom2_name="" then%>
		<script language=vbscript>
		  MsgBox "错误：启用自定义字段2后自定义字段2显示名称必须填写！"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
		end if
	end if
	if fee_mode then
		if pay_fee="" then%>
		<script language=vbscript>
		  MsgBox "错误：固定支付金额后固定支付金额必须填写！"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
		else
			if not isNumeric(pay_fee) then%>
			<script language=vbscript>
			  MsgBox "错误：固定支付金额必须为数字！"
			  location.href = "javascript:history.back()"
			</script>
			<%Response.end
			end if
		end if
	end if
	if instr(payvia_list, "|")<=0 then%>
		<script language=vbscript>
		  MsgBox "错误：支付途径列表至少需要设置一项！"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
	end if
	if not isNumeric(left(payvia_list,1)) then%>
	<script language=vbscript>
	  MsgBox "错误：支付途径列表第一位必须为数字！"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	end if
	if order_mode then
		if orderuser="" then%>
		<script language=vbscript>
		  MsgBox "错误：使用定单管理系统后登录用户名必须填写！"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
		end if
		if orderpass="" then%>
		<script language=vbscript>
		  MsgBox "错误：使用定单管理系统后登录密码必须填写！"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
		end if
	end if
	Set Fso = Server.CreateObject("Scripting.FileSystemObject")
	Set FsoTEXT = Fso.OpenTextFile(Server.MapPath("paysettings.mb"),1,True)
	If Not FsoTEXT.AtEndOfStream Then 
		Fso_Read=FsoTEXT.ReadAll
		set FsoTEXT=Nothing
		Set Fso=Nothing
	else%>
	<script language=vbscript>
	  MsgBox "错误：paysettings.mb设置模板文件丢失或无内容，安装失败！"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	end if
	'替换模板中的相关设置
	Fso_Read=replace(Fso_Read,"$reg_userid$",reg_userid,1,1)
	Fso_Read=replace(Fso_Read,"$paykey$",reg_key,1,1)
	Fso_Read=replace(Fso_Read,"$servicename$",servicename,1,1)
	Fso_Read=replace(Fso_Read,"$receive_url$",receive_url,1,1)
	Fso_Read=replace(Fso_Read,"$use_custom1$",use_custom1,1,1)
	Fso_Read=replace(Fso_Read,"$custom1_name$",custom1_name,1,1)
	Fso_Read=replace(Fso_Read,"$use_custom2$",use_custom2,1,1)
	Fso_Read=replace(Fso_Read,"$custom2_name$",custom2_name,1,1)
	Fso_Read=replace(Fso_Read,"$fee_mode$",fee_mode,1,1)
	Fso_Read=replace(Fso_Read,"$pay_fee$",pay_fee,1,1)
	Fso_Read=replace(Fso_Read,"$payvia_list$",payvia_list,1,1)
	Fso_Read=replace(Fso_Read,"$payvia_mode$",payvia_mode,1,1)
	Fso_Read=replace(Fso_Read,"$pay_mode$",pay_mode,1,1)
	Fso_Read=replace(Fso_Read,"$order_mode$",order_mode,1,1)
	Fso_Read=replace(Fso_Read,"$orderuser$",orderuser,1,1)
	Fso_Read=replace(Fso_Read,"$orderpass$",orderpass,1,1)

	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	Set fout = fso.CreateTextFile(server.mappath("paysettings.asp"))
	fout.Write Fso_Read
	fout.close
	Response.write "<html><head>" & vbcrlf
	Response.write "<title>贺喜多途径支付系统安装成功</title>" & vbcrlf
	Response.write "<meta http-equiv='refresh' content='3;url=index.asp'>" & vbcrlf
	Response.write "</head>" & vbcrlf
	Response.write "<body text='#FF0000'>" & vbcrlf
	Response.write "<p align='center'>恭喜，贺喜多途径支付系统已经安装成功！正跳转到您的支付页面...</p>" & vbcrlf
	Response.write "</body></html>" & vbcrlf
	Set fout = nothing
	if deletefile then
		Fso.DeleteFile Server.MapPath("paysettings.mb"),True
		Fso.DeleteFile Server.MapPath("setup.asp"),True
	end if
	Set Fso=Nothing
else
IsObj=false
set TestObj=server.CreateObject("Scripting.FileSystemObject")
If -2147221005 <> Err then
	IsObj = True
	VerObj = TestObj.version
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>贺喜多途径支付系统安装程序</title>
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

// 检查是否为数字
function checkIsInteger(str)
{
    if (str == "")
        return false;
    if (str.search(/^[0-9]+$/) < 0)
        return false;
    if (str <= 0)
        return false;
    else
        return true;
}

function Checkinput()
{
	with (document.setupform) 
	{
		var retVal;
		var amt = pay_fee.value;
		var Ms = 0 ;
		
		// 检查商户编号不能为空
	    if(reg_userid.value == "")
		{
			window.alert("请填写正确的商户编号！") ;
			reg_userid.focus();
			return false;
		}

		// 检查商户编号必须为数字
	    if (! checkIsInteger(reg_userid.value))
		{
			window.alert("商户编号必须为数字且大于0！") ;
			reg_userid.focus();
			return false;
		}
		// 检查商户密钥不能为空
	    if(reg_key.value == "")
		{
			window.alert("请填写正确的商户密钥！") ;
			reg_key.focus();
			return false;
		}

		// 检查服务名称不能为空
	    if(servicename.value == "")
		{
			window.alert("请填写正确的服务名称！") ;
			servicename.focus();
			return false;
		}

		// 检查支付结果接收地址不能为空
	    if(receive_url.value == "")
		{
			window.alert("请填写正确的支付结果接收地址！") ;
			receive_url.focus();
			return false;
		}

		if(use_custom1[0].checked)
		{
			// 检查自定义字段1显示名称不能为空
		    if(custom1_name.value == "")
			{
				window.alert("请填写正确的自定义字段1显示名称！") ;
				custom1_name.focus();
				return false;
			}
		}

		if(use_custom2[0].checked)
		{
			// 检查自定义字段2显示名称不能为空
		    if(custom2_name.value == "")
			{
				window.alert("请填写正确的自定义字段2显示名称！") ;
				custom2_name.focus();
				return false;
			}
		}

		if(fee_mode[0].checked)
		{
			// 检查支付金额不能为空
		    if(amt == "")
			{
				window.alert("请填写有效的支付金额！") ;
				pay_fee.focus();
				return false;
			}
			// 检查支付金额是否有效
			if (! checkValidAmount(amt))
			{
				window.alert("有效的支付金额只能为数字(包括小数，小数点后最多只能包括两个数字)");
				pay_fee.focus();
				return false;
			}
			// 检查最大的支付金额及最小的支付金额
			if ((retVal = checkValidSaveAmount(amt)) != "true")
			{
				window.alert(retVal);
				pay_fee.focus();
				return false;
			}
		}

		// 检查支付途径列表不能为空
	    if(payvia_list.value == "")
		{
			window.alert("请填写正确的支付途径列表！") ;
			payvia_list.focus();
			return false;
		}
		
		if(order_mode[0].checked)
		{
			// 检查登录用户名不能为空
		    if(orderuser.value == "")
			{
				window.alert("请填写正确的登录用户名！") ;
				orderuser.focus();
				return false;
			}
			// 检查登录密码不能为空
		    if(orderpass.value == "")
			{
				window.alert("请填写正确的登录密码！") ;
				orderpass.focus();
				return false;
			}
		}

	}

	return true;
}

var minSaveAmount = 0.01;     // 最小的支付金额
var maxSaveAmount = 10000;   // 最大的支付金额
// 检查是否为有效的金额(包括小数点后二位)，以元为单位
// 返回值：
// 		true : 正确
//      false: 错误
function checkValidAmount(num)
{
	var len = num.length;
	
	// "." 不能出现在第一个字符及最后一个字符
	if (num.charAt(0) == '.' || num.charAt(len - 1) == '.')
		return false;
	// 小数点后最多只能包含两个有效数字(如果“.”号存在，而且它的存在位置在到数第2个以内则认为错误)
	var idx = 0;
	if ((idx = num.indexOf('.')) >= 0 && idx < len - 1 - 2)
		return false;
	// 数字开头，可以包含小数点
    if(num.search(/^[0-9]+[.]?[0-9]*$/) >= 0)
        return true;
    else
        return false;
        
    return true;
}

// 检查是否为超过支付范围
// 返回值：
//      "true" : 正确
//      其它   : 错误
function checkValidSaveAmount(num)
{
	var retVal = "true";
	if (num < minSaveAmount)
	{
		retVal = "对不起，单次支付的金额最少为" + minSaveAmount + "元";
	}
    else if (num > maxSaveAmount)
    {
    	retVal = "对不起，单次支付的金额最大为" + maxSaveAmount + "元";
    }

	return retVal;
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
                                      <td width="518" height="356" bgcolor="#FFFFFF"><div align="center">
                                          <Table bgColor="#CCCCCC" Width="100%" Border=0 CellSpacing=1 CellPadding=5>
                                            <Tr bgColor="#FFFFFF">
                                              <Td colspan="2" align=Right><div align="left"><SPAN 
                              class=style3><IMG height=11 
                              src="images/icon_01.gif" width=18>  
                                                  贺喜多途径支付系统安装程序</SPAN></div></Td>                     
                                            </TR>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><b>第一步：</b></p>
      </td>
      <td width="70%">
  <p>请先通过<a href="http://www.168reg.cn/register.asp" target="_blank">http://www.168reg.cn/register.asp</a>注册成为商户。</p>
      </td>
                                            </TR>
                                            <form method="POST" name="setkeyform" action="http://merchant.168reg.cn/168setkey.asp" target="_blank">
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><b>第二步：</b></p>
      </td>
      <td width="70%">
  <p>在线设置贺喜支付接口商户密钥(<b><font color="#0000FF">已设置的此步可跳过</font></b>)：<br>商户登录名：<input type="text" name="devusername" size="20" maxlength="15"><br>　登录密码：<input type="password" name="devpassword" size="20" maxlength="16"><br>　商户密钥：<input type="password" name="devreg_key" size="20" maxlength="30">(小于30个字符)<br><input type="submit" value="立即设置" name="submit1">(在线设置后可立即获得商户编号)</p>
      </td>
                                            </TR>
                                            </form>
<%if IsObj then%>
                                            <form method="POST" name="setupform" action="<%=thisfilename%>" onsubmit='return(Checkinput());'>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <b>第三步：</b>
      </td>
      <td width="70%">
  请对以下信息进行设置。
      </td>
                                            </TR>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <b>商户编号：</b>
      </td>
      <td width="70%">
  <input type="text" name="reg_userid" size="5" maxlength="5" value="0">(商户编号可通过管理区首页、支付平台－参数设置获得)
      </td>
                                            </TR>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <b>商户密钥：</b>
      </td>
      <td width="70%">
  <input type="password" name="reg_key" size="15" maxlength="30">
      </td>
                                            </TR>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><b>服务名称：</b></p>
      </td>
      <td width="70%">
  <p><!--webbot bot="Validation" B-Value-Required="TRUE" I-Maximum-Length="50"
  --><input type="text" name="servicename" size="20" value="XXXX网会员" maxlength="50">（最长50字符）</p>
      </td>
                                            </TR>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><b>支付结果接收地址：</b></p>
      </td>
      <td width="70%">
  <p><input type="text" name="receive_url" size="40" value="http://www.yourdomain.com/payreceive.asp"><br>
  (支付结果将返回此地址，请设置为payreceive.asp所在网站地址)</p>
      </td>
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><b>是否启用自定义字段1：</b></p>
      </td>
      <td width="70%">
  <p><input type="radio" value="true" checked name="use_custom1" id="use_custom11"><label for="use_custom11">启用</label>　<input type="radio" value="false" name="use_custom1" id="use_custom12"><label for="use_custom12">不启用</label></p>
      </td>
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p>
  <b>
  自定义字段1显示名称：</b></p>
      </td>
      <td width="70%">
  <p><!--webbot bot="Validation" B-Value-Required="TRUE" I-Maximum-Length="30"
  --><input type="text" name="custom1_name" size="10" value="用户名" maxlength="30"></p>
      </td>
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p>
  <b>是否启用自定义字段2：</b></p>
      </td>
      <td width="70%">
  <p><input type="radio" value="true" name="use_custom2" id="use_custom21"><label for="use_custom21">启用</label>　<input type="radio" value="false" name="use_custom2" checked id="use_custom22"><label for="use_custom22">不启用</label></p>
      </td>
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p>
  <b>
  自定义字段2显示名称：</b></p>
      </td>
      <td width="70%">
  <p><!--webbot bot="Validation" B-Value-Required="TRUE" I-Maximum-Length="30"
  --><input type="text" name="custom2_name" size="10" maxlength="30"></p>
      </td>
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><font color="#FF0000"><b>自定义字段说明：</b></font></p>
      </td>
      <td width="70%">
  <p>可用于保存商户网站提交的其他内容，如用户名、Email、订单类型、序列号等信息。</p>
      </td>
                                            </Tr>
                                            <tr>
      <td align="right" width="30%" bgcolor="#FFFFFF">
  <b>是否固定支付金额：</b>
      </td>
      <td width="70%" bgcolor="#FFFFFF">
  <input type="radio" value="true" checked name="fee_mode" id="fee_mode1"><label for="fee_mode1">固定金额</label>　<input type="radio" value="false" name="fee_mode" id="fee_mode2"><label for="fee_mode2">由用户输入支付金额</label>
      </td>
                                            </tr>
                                            <tr>
      <td align="right" width="30%" bgcolor="#FFFFFF">
  <p><b>固定支付金额：</b></p>
      </td>
      <td width="70%" bgcolor="#FFFFFF">
  <p><input type="text" name="pay_fee" size="5" value="1" maxlength="5"> 元</p>
      </td>
                                            </tr>
                                            <tr>
      <td align="right" width="30%" bgcolor="#FFFFFF">
  <b>支付途径列表：</b>
      </td>
      <td width="70%" bgcolor="#FFFFFF">
  <textarea rows="5" name="payvia_list" cols="45">1|银行卡支付,2|声讯电话支付,3|互联星空支付,4|手机短信注册,5|腾讯财付通支付,6|腾讯Q币支付,7|神州行充值卡支付(最高500元),8|盛大游戏点卡支付(最低1元，最高100元),9|支付宝支付,10|手机银行支付,11|北京宽带支付(最高200元)</textarea><br>
  格式：支付途径1编号|支付途径1名称,支付途径2编号|支付途径2名称，编号必须与<a href="http://www.168reg.cn" target="_blank">www.168reg.cn</a>网站公布的一致。顺序可调整。
      </td>
                                            </tr>
                                            <tr>
      <td align="right" width="30%" bgcolor="#FFFFFF">
  <b>选择支付途径模式：</b>
      </td>
      <td width="70%" bgcolor="#FFFFFF">
  <input type="radio" value="1" checked name="payvia_mode" id="payvia_mode1"><label for="payvia_mode1">单选</label>　<input type="radio" value="2" name="payvia_mode" id="payvia_mode2"><label for="payvia_mode2">多选</label>
      </td>
                                            </tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <b>是否使用支付接口自带的简易定单管理系统：</b>
      </td>
                                              <Td id="postid" name="postid" width="70%">
      <input type="radio" value="true" checked name="order_mode" id="order_mode1"><label for="order_mode1">使用</label>　<input type="radio" value="false" name="order_mode" id="order_mode2"><label for="order_mode2">不使用</label><br>
      <a href="order/" target="_blank"><font color="#FF0000"><b>点此进入简易定单管理系统</b></font></a>
      </Td>  
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <b>定单系统登录用户名：</b>
      </td>
                                              <Td id="postid" name="postid" width="70%">
      <!--webbot bot="Validation" B-Value-Required="TRUE" I-Maximum-Length="30"
      --><input type="text" name="orderuser" size="15" maxlength="30" value="admin">(默认值：admin)</Td>  
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <b>定单系统登录密码：</b>
      </td>
                                              <Td id="postid" name="postid" width="70%">
      <!--webbot bot="Validation" B-Value-Required="TRUE" I-Maximum-Length="30"
      --><input type="password" name="orderpass" size="15" maxlength="30" value="admin">(默认值：admin)</Td>  
                                            </Tr>
                                            <tr>
      <td align="right" width="30%" bgcolor="#FFFFFF">
  <p><b>运行模式：</b></p>
      </td>
                                              <Td width="70%" bgcolor="#FFFFFF">
      <input type="checkbox" name="pay_mode" value="testmode" id="paymodeid"><label for="paymodeid">测试模式（支付接口的运行模式，不勾选则启用正式模式）</label></Td>  
                                            </tr>
                                            <Tr bgColor="#FFFFFF">
                                              <Td Align=right width="30%"><b><font color="#FF0000">删除本安装程序：</font></b></Td>
                                              <Td Align=left width="70%"><input type="radio" value="true" checked name="deletefile" id="deletefile1"><label for="deletefile1">是</label>　<input type="radio" name="deletefile" value="false" id="deletefile2"><label for="deletefile2">否</label></Td>
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
                                              <Td Align=center colspan="2"><input type="submit" value=">>安 装<<" name="submit"></Td>
                                            </Tr>
                                            </form>
<%else%>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><b>第三步：</b></p>
      </td>
      <td width="70%">
  <p>由于您的服务器不支持Scripting.FileSystemObject组件，请您直接打开paysettings.asp文件进行设置。</p>
      </td>
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
<%end if%>
