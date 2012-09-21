<!--#include file="paysettings.asp"-->
<%
'#############################################################
'#               贺喜支付平台支付接口支付页面
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
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title><%=servicename%>支付页面</title>
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

function Checkinput()
{
	with (document.payform) 
	{
		var retVal;
		var amt = amount.value;
		var Ms = 0 ;
		
		// 检查支付金额不能为空
	    if(amt == "")
		{
			window.alert("请填写有效的支付金额！") ;
			return false;
		}
		// 检查支付金额是否有效
		if (! checkValidAmount(amt))
		{
			window.alert("有效的支付金额只能为数字(包括小数，小数点后最多只能包括两个数字)");
			return false;
		}
		// 检查最大的支付金额及最小的支付金额
		if ((retVal = checkValidSaveAmount(amt)) != "true")
		{
			window.alert(retVal);
			return false;
		}

		for(i=0; i<payvia.length; i++)
		{
			if(payvia[i].checked)
			{
				Ms=1 ;
			}
		}
		
		if(Ms==0)
		{
			window.alert("请选择支付方式！");
			return false ;
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
  <form name="payform" method="POST" action="payment.asp" onsubmit='return(Checkinput());'>
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
                                                  <b><%=servicename%></b></SPAN></div></Td>         
                                            </TR>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="27%">
  <p><font color="#FF0000"><b>*</b></font> 支付金额：</p>
      </td>
      <td width="73%">
<%if fee_mode then%>
  <p><input type=hidden name="amount" value="<%=pay_fee%>"><font color="#FF0000"><b><%=pay_fee%></b></font> 元</p>
<%else%>
  <p><input type="text" name="amount" size="7" value="0" maxlength="5"> 元</p>
<%end if%>
      </td>
                                            </Tr>
<%if use_custom1 then%>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="27%">
  <p>
  <%=custom1_name%>：</p>
      </td>
      <td width="73%">
  <p><!--webbot bot="Validation" B-Value-Required="TRUE" I-Maximum-Length="30"
  --><input type="text" name="custom1" size="20" maxlength="30"></p>
      </td>
                                            </Tr>
<%end if
if use_custom2 then%>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="27%">
  <p>
  <%=custom2_name%>：</p>
      </td>
      <td width="73%">
  <p><!--webbot bot="Validation" B-Value-Required="TRUE" I-Maximum-Length="30"
  --><input type="text" name="custom2" size="20" maxlength="30"></p>
      </td>
                                            </Tr>
<%end if%>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="27%">
  <p><font color="#FF0000"><b>*</b></font> 选择支付方式：</p>
      </td>
      <td width="73%">
<%
if payvia_mode=1 then
	payvia_type="radio"
else
	payvia_type="checkbox"
end if
payviaarray=Split(payvia_list,",")
payarraycount=UBound(payviaarray)
if payarraycount>0 then
	for i=0 to payarraycount
		payvia=Split(payviaarray(i),"|")
		if not isNumeric(payvia(0)) then
	  	Response.Write "<script Language=Javascript>alert(' 对不起！该支付方式设置有误，请联系管理员......');location.href = 'javascript:history.back()';</script>"
	    response.end
		end if
		if payvia(1)="" then
	  	Response.Write "<script Language=Javascript>alert(' 对不起！该支付方式设置有误，请联系管理员......');location.href = 'javascript:history.back()';</script>"
	    response.end
		end if
		response.write "<input type='" & payvia_type & "' name='payvia' value='" & payvia(0) & "' id='payvia" & i & "'><label for='payvia" & i & "'>" & payvia(1) & "</label><br>" & vbcrlf
	next
else
	payvia=Split(hx_payvia,"|")
	if not isNumeric(payvia(0)) then
  	Response.Write "<script Language=Javascript>alert(' 对不起！该支付方式设置有误，请联系管理员......');location.href = 'javascript:history.back()';</script>"
    response.end
	end if
	if payvia(1)="" then
  	Response.Write "<script Language=Javascript>alert(' 对不起！该支付方式设置有误，请联系管理员......');location.href = 'javascript:history.back()';</script>"
    response.end
	end if
	response.write "<input type='" & payvia_type & "' name='payvia' value='" & payvia(0) & "' id='payvia" & i & "'><label for='payvia" & i & "'>" & payvia(1) & "</label><br>" & vbcrlf
end if
%>
      </td>
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
                                              <Td Align=center colspan="2"><input style="image" src=images/bt.gif type=image width="82" height="21" border=0 name=submit>　<a href="/" target="_top"><img src="images/re.gif" width="68" height="20" border="0"></a></Td>
                                            </Tr>
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
  </form>
  </center>
</div>
</body>

</html>
