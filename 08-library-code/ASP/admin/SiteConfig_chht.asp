
<script language="javascript">
<!--  
  if (window == top)top.location.href = "Default.asp"; 
// -->
</script>
<html>
<head>
<title>南方数据企业网站管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.back_southidc{BACKGROUND-IMAGE:url('image/titlebg.gif');COLOR:000000;}
.table_southidc{BACKGROUND-COLOR: A4B6D7;}
.td_southidc{BACKGROUND-COLOR: F2F8FF;}
.tr_southidc{BACKGROUND-COLOR: ECF5FF;}

.t1 {font:12px 宋体;color:#000000} 
.t2 {font:12px 宋体;color:#ffffff} 
.t3 {font:12px 宋体;color:#ffff00} 
.t4 {font:12px 宋体;color:#800000} 
.t5 {font:12px 宋体;color:#191970} 

.weiqun:hover{
	Font-unline:yes;
	font-family: "宋体";
	color: #FFFFFF;
	text-decoration: underline;
	background-color: #CCCCCC;
}
td {
	font-size: 12px;
}

a:link {
	color: #000000;
	text-decoration: none;
}
a:active {
	color: #000000;
	text-decoration: none;
}
a:visited {
	color: #000000;
	text-decoration: none;
}

-->
</style>
<body>

<html>
<head>
<title>网站配置</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0"> 

<form method="POST" action="SiteConfig.asp" id="form" name="form">
  <table width="650" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#000000" >
    <tr> 
      <td height="24" colspan="4" class="back_southidc"> <div align="center"><strong>网 
          站 配 置</strong></div></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" class="topbg"> <strong>网站信息配置</strong></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="224" class="tdbg"><strong>网站名称：</strong></td>
      <td colspan="3" class="tdbg"> <input name="SiteName" type="text" id="SiteName" value="南方数据企业网站管理系统" size="40" maxlength="50"> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="224" class="tdbg"><strong>网站标题：</strong></td>
      <td colspan="3" class="tdbg"> <input name="SiteTitle" type="text" id="SiteTitle" value="南方数据企业网站管理系统" size="40" maxlength="50"> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="224" class="tdbg"><strong>网站地址：</strong><br>
        请添写完整URL地址</td>
      <td colspan="3" class="tdbg"> <input name="SiteUrl" type="text" id="SiteUrl" value="http://china.0791idc.com/demo" size="40" maxlength="255"> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>企业邮局：</strong><br>
        请添写完整URL地址</td>
      <td colspan="3" class="tdbg"> <input name="EnterpriseMail" type="text" id="EnterpriseMail" value="http://mail.163.com" size="40" maxlength="255"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="224" class="tdbg"><strong>LOGO地址：</strong><br> </td>
      <td colspan="3" class="tdbg"> <input name="LogoUrl" type="text" id="LogoUrl" value="images/logo.gif" size="40" maxlength="255"> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="224" height="20" class="tdbg"><strong>首页Banner地址(只能用FLASH)：</strong><br> 
      </td>
      <td width="186" class="tdbg"> <input name="BannerUrl" type="text" id="BannerUrl" value="Images/0791idc.swf" size="25" maxlength="255"> 
      </td>
      <td width="42" class="tdbg">高度：</td>
      <td width="127" class="tdbg"> <input name="High" type="text" id="High" value="100" size="6" maxlength="5"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="224" class="tdbg"><strong>站长姓名：</strong></td>
      <td colspan="3" class="tdbg"> <input name="WebmasterName" type="text" id="WebmasterName" value="weiqun" size="40" maxlength="20"> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="224" class="tdbg"><strong>站长信箱：</strong></td>
      <td colspan="3" class="tdbg"> <input name="WebmasterEmail" type="text" id="WebmasterEmail" value="hdz2008@163.com" size="40" maxlength="100"> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="224" class="tdbg"><strong>版权信息：</strong><br>
        支持HTML标记，不能使用双引号</td>
      <td colspan="3" class="tdbg"> <textarea name="Copyright" cols="50" rows="8" id="Copyright">版权所有 2001-2005 南方数据 www.0791idc.com<br>总公司地址:江西省南昌市省府大院西二路监察大楼 邮编:330046 <br>销售热线:0791-6274752,8059439 技术支持:0791-6274752,13065161861<br>销售在线服务: MSN:jxhwq@hotmail.com QQ:635495 在线技术支持：MSN:jxhwq@hotmail.com QQ:635495</textarea> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" class="topbg"><strong>网站选项配置</strong></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>首页每页产品或文章数：</strong></td>
      <td colspan="3" class="tdbg"> <input name="MaxPerPage_Default" type="text" id="MaxPerPage_Default" value="10" size="6" maxlength="5"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>首页新闻资讯条数：</strong></td>
      <td colspan="3" class="tdbg"> <input name="New_count" type="text" id="New_count" value="5" size="6" maxlength="5"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>首页产品列表数：</strong></td>
      <td colspan="3" class="tdbg"> <input name="Product_count" type="text" id="Product_count" value="8" size="6" maxlength="5"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>产品搜索页每页文章数：</strong></td>
      <td colspan="3" class="tdbg"> <input name="MaxPerPage_Search" type="text" id="MaxPerPage_Search" value="10" size="6" maxlength="5"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>每页显示大约字符数：</strong></td>
      <td colspan="3" class="tdbg"> <input name="MaxPerPage_Content" type="text" id="MaxPerPage_Content" value="200000" size="6" maxlength="5"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td class="tdbg"><strong>是否启用新闻评论功能：</strong></td>
      <td colspan="3" class="tdbg"> <input type="radio" name="NewsComment" value="Yes" checked>
        是 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="NewsComment" value="No" >
        否</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>是否启用文章审核功能：</strong></td>
      <td colspan="3" class="tdbg"> <input type="radio" name="EnableArticleCheck" value="Yes" checked>
        是 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="EnableArticleCheck" value="No" >
        否</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>是否开放文件上传：</strong></td>
      <td colspan="3" class="tdbg"> <input type="radio" name="EnableUploadFile" value="Yes" checked>
        是 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="EnableUploadFile" value="No" >
        否</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>是否显示公告：</strong></td>
      <td colspan="3" class="tdbg"> <input type="radio" name="PopAnnounce" value="Yes" checked>
        是 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="PopAnnounce" value="No" >
        否</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>热门文章点击数：</strong></td>
      <td colspan="3" class="tdbg"> <input name="HitsOfHot" type="text" id="HitsOfHot" value="500" size="6" maxlength="5"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>上传文件大小限制：</strong><br>
        建议不要超过1024K，以免影响服务器性能<strong>：</strong></td>
      <td colspan="3" class="tdbg"> <input name="MaxFileSize" type="text" id="MaxFileSize" value="200" size="6" maxlength="5">
        K</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>存放上传文件的目录：</strong><br>
        请输入相对于首页（Default.asp）的相对路径</td>
      <td colspan="3" class="tdbg"> <input name="SaveUpFilesPath" type="text" id="SaveUpFilesPath" value="UploadFiles" size="30" maxlength="100"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>允许的上传文件类型：</strong><br>
        只输入扩展名。每种文件类型用“|”号分开。</td>
      <td colspan="3" class="tdbg"> <input name="UpFileType" type="text" id="UpFileType2" value="gif|jpg|bmp|png|swf|doc|rar" size="50" maxlength="255"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>删除文章时是否同时删除文章中的上传文件：</strong><br>
        此功能需要FSO支持。</td>
      <td colspan="3" class="tdbg"> <input type="radio" name="DelUpFiles" value="Yes" checked>
        是 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="DelUpFiles" value="No" >
        否</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg"><strong>Session会话的保持时间：</strong><br>
        主要用于后台管理员登录，为了安全，请不要将时间设得太长。建议设为10分钟</td>
      <td colspan="3" class="tdbg"> <input name="SessionTimeout" type="text" id="SessionTimeout" value="10" size="6" maxlength="5">
        分钟</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td class="tdbg">&nbsp;</td>
      <td colspan="3" class="tdbg">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" class="topbg"><strong>邮件服务器选项</strong></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="224" class="tdbg"><strong>邮件发送组件：</strong><br>
        请一定要选择服务器上已安装的组件</td>
      <td colspan="3" class="tdbg"> <select name="MailObject" id="MailObject">
          <option value="Jmail" selected>Jmail</option>
        </select> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="224" class="tdbg"><strong>SMTP服务器地址：</strong><br>
        用来发送邮件的SMTP服务器<br>
        如果你不清楚此参数含义，请联系你的空间商 </td>
      <td colspan="3" class="tdbg"> <input name="MailServer" type="text" id="MailServer" value="mail.0791idc.com" size="40"> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="224" class="tdbg"><strong>SMTP登录用户名：</strong><br>
        当你的服务器需要SMTP身份验证时还需设置此参数</td>
      <td colspan="3" class="tdbg"> <input name="MailServerUserName" type="text" id="MailServerUserName" value="webmaster@0791idc.com" size="40"> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="224" class="tdbg"><strong>SMTP登录密码：</strong><br>
        当你的服务器需要SMTP身份验证时还需设置此参数 </td>
      <td colspan="3" class="tdbg"> <input name="MailServerPassWord" type="password" id="MailServerPassWord" value="zhangweimy" size="40"> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="224" class="tdbg"><strong>SMTP域名</strong>：<br>
        如果用“name@domain.com”这样的用户名登录时，请指明domain.com</td>
      <td colspan="3" class="tdbg"> <input name="MailDomain" type="text" id="MailDomain" value="0791idc.com" size="40"> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" align="center" class="tdbg"> <input name="Action" type="hidden" id="Action" value="SaveConfig"> 
        <input name="cmdSave" type="submit" id="cmdSave" value=" 保存设置 " > 
      </td>
    </tr>
    
  </table>

</form>
</body>
</html>
