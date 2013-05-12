<!--#include file="Include/Const.Asp" -->
<!--#include file="Include/ConnSiteData.Asp" -->
<%
Call SiteInfo
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>客户留言 - <% =SiteTitle %></title>
<meta name="keywords" content="<% =Keywords %>" />
<meta name="description" content="<% =Descriptions %>" />
<link href="style.css" type="text/css" rel="stylesheet" rev="stylesheet"/>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-35734769-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</head>
<body>
<!--#include file="head.asp"-->
<table width="975"  border="0" align="center" cellpadding="0" cellspacing="0" class="margin">
  <tr>
    <td width="302" valign="top" bgcolor="#F7F7F7"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="41%" height="40" class="left_tit">我们的服务</td>
        <td width="45%" class="left_bg">&nbsp;</td>
        <td width="14%" class="left_bg"><img src="images/left_ico.gif" width="18" height="19" /></td>
      </tr>
      
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="margin">
        <tr>
          <td width="42%" align="center"><img src="images/server-1.gif" width="78" height="58" style="margin-bottom:8px;" /><br />
          <img src="images/server_2.gif" width="78" height="58" /></td>
          <td width="58%" valign="top">
		    <ul class="server">
			  <li>·企业战略</li>
			  <li>·管理体系</li>
			  <li>·领导才能</li>
			  <li>·管理工具</li>
			</ul>		  </td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="41%" height="40" class="left_tit">联系我们</td>
          <td width="45%" class="left_bg">&nbsp;</td>
          <td width="14%" class="left_bg"><img src="images/left_ico.gif" width="18" height="19" /></td>
        </tr>
      </table>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="pad_left"><strong>爱克思伦企业管理顾问有限公司</strong><br />
      电 话：<% =Telephone %><br />
            传 真：<% =Fax %><br />
            地 址：<% =Address %> <br />
            邮 编：<% =ZipCode %><br />
            WEB：<a href="<% =SiteUrl %>"><% =SiteUrl %></a><br />
      E-mail：<a href="mailto:<% =Email %>"><% =Email %></a></td>
  </tr>
</table></td>
    <td width="673" height="28" colspan="3" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="3">　<img src="images/weizhi.gif" width="14" height="14" style="vertical-align:middle;" />&nbsp;您当前的位置：<a href="index.asp">爱克思伦企业管理首页</a> → 访客留言 </td>
      </tr>
      <tr>
        <td width="44" height="27" align="center" valign="top" bgcolor="#3D8EEA"><img src="images/right_ico.gif" width="28" height="27" /></td>
        <td width="435" valign="top" bgcolor="#3D8EEA"><h2>访客留言</h2></td>
        <td width="194" valign="top" bgcolor="#3D8EEA"><img src="images/right_name.gif" width="194" height="27" /></td>
      </tr>
      <tr>
        <td colspan="3" valign="top" class="pad_left"><table width="90%" border="0" align="center" cellpadding="5" cellspacing="1" bordercolor="#CCCCCC" bgcolor="#E1E1E1"><form action="MessageSave.Asp" method="post" name="formWrite" id="formWrite">
          <tr>
            <td width="19%" align="center" valign="top" bgcolor="#F7f7f7">留言主题：</td>
            <td width="81%" bgcolor="#F7f7f7"><input name="MesName" type="text" id="MesName" size="40" maxlength="100" onfocus="if (this.value=='请填写主题'){this.value='';}" onblur="if (this.value==''){this.value='请填写主题';}" value="请填写主题" />
                      <font color="red">*</font></td>
          </tr>
          <tr>
            <td align="center" valign="top" bgcolor="#FFFFFF">姓　名：</td>
            <td bgcolor="#FFFFFF"><input name="Linkman" type="text" id="Linkman" size="20" maxlength="50" onfocus="if (this.value=='请输入您的姓名'){this.value='';}" onblur="if (this.value==''){this.value='请输入您的姓名';}" value="请输入您的姓名" />
                      <font color="red">*</font></td>
          </tr>
          <tr>
            <td align="center" valign="top" bgcolor="#F7F7F7">性  别：</td>
            <td bgcolor="#F7F7F7"><input name="Sex" type="radio" value="先生" checked="checked" />
                      先生
                      <input type="radio" name="Sex" value="女士" />
                      女士 <font color="red">*</font></td>
          </tr>
          <tr>
            <td align="center" valign="top" bgcolor="#FFFFFF">公司名称：</td>
            <td bgcolor="#FFFFFF"><input name="Company" type="text" size="50" maxlength="100" onfocus="if (this.value=='请输入您的公司名称'){this.value='';}" onblur="if (this.value==''){this.value='请输入您的公司名称';}" value="请输入您的公司名称" />
                      <font color="red">*</font></td>
          </tr>
          <tr>
            <td align="center" valign="top" bgcolor="#F7F7F7">联系地址：</td>
            <td bgcolor="#F7F7F7"><input name="Address" type="text" size="50" maxlength="100" onfocus="if (this.value=='请输入您的联系地址'){this.value='';}" onblur="if (this.value==''){this.value='请输入您的联系地址';}" value="请输入您的联系地址" /><font color="red">*</font></td>
          </tr>
          <tr>
            <td align="center" valign="top" bgcolor="#FFFFFF">联系电话：</td>
            <td bgcolor="#FFFFFF"><input name="Telephone" type="text" id="Telephone" onfocus="if (this.value=='请输入您的联系电话'){this.value='';}" onblur="if (this.value==''){this.value='请输入您的联系电话';}" value="请输入您的联系电话" size="30" /><font color="red">*</font></td>
          </tr>
          <tr>
            <td align="center" valign="top" bgcolor="#F7F7F7">传真号码:</td>
            <td bgcolor="#F7F7F7"><input name="Fax" type="text" id="Fax" onfocus="if (this.value=='请输入您的传真号码'){this.value='';}" onblur="if (this.value==''){this.value='请输入您的传真号码';}" value="请输入您的传真号码" size="30" /><font color="red">*</font></td>
          </tr>
          <tr>
            <td align="center" valign="top" bgcolor="#FFFFFF">手机号码：</td>
            <td bgcolor="#FFFFFF"><input name="Mobile" type="text" id="Mobile" onfocus="if (this.value=='请输入您的手机号码'){this.value='';}" onblur="if (this.value==''){this.value='请输入您的手机号码';}" value="请输入您的手机号码" size="30" /><font color="red">*</font></td>
          </tr>
          <tr>
            <td align="center" valign="top" bgcolor="#F7F7F7">电子信箱：</td>
            <td bgcolor="#F7F7F7"><input name="Email" type="text" id="Email" onfocus="if (this.value=='请输入您的电子信箱'){this.value='';}" onblur="if (this.value==''){this.value='请输入您的电子信箱';}" value="请输入您的电子信箱" size="30" /><font color="red">*</font></td>
          </tr>
          <tr>
            <td align="center" valign="top" bgcolor="#FFFFFF">留言区域：</td>
            <td bgcolor="#FFFFFF">
              <label>
              <textarea name="Content" cols="55" rows="7" onfocus="if (this.value=='--您有什么需求，请在这里告诉我们！--'){this.value='';}" onblur="if (this.value==''){this.value='--您有什么需求，请在这里告诉我们！--';}">--您有什么需求，请在这里告诉我们！--</textarea>
              </label>
                       </td>
          </tr>
          <tr>
            <td align="center" valign="top" bgcolor="#F7F7F7">验证码：</td>
            <td bgcolor="#F7F7F7"><input name="CheckCode" type="text" size="6" maxlength="6" class="memberName" />
                      <a href="javascript:refreshimg()" title="看不清楚，换个图片。"><img src="Include/CheckCode/CheckCode.Asp" name="checkcode" align="absmiddle" id="checkcode" style="border: 1px solid #ffffff" /></a> <font color="red">*</font></td>
          </tr>
          <tr>
            <td align="center" valign="top" bgcolor="#FFFFFF">&nbsp;</td>
            <td bgcolor="#FFFFFF"><input name="Submit" type="submit" value="发表留言" class="cartButton" /></td>
          </tr></form>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
