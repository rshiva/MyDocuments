<!--#include file="Include/Const.Asp" -->
<!--#include file="Include/NoSQL.Asp" -->
<!--#include file="Include/ConnSiteData.Asp" -->
<%
Call SiteInfo
SeoTitle = "客户名录"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title><% =SeoTitle %> - <% =SiteTitle %></title>
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
    <td width="301" valign="top" bgcolor="#F7F7F7"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="41%" height="40" class="left_tit">关于我们</td>
        <td width="45%" class="left_bg">&nbsp;</td>
        <td width="14%" class="left_bg"><img src="images/left_ico.gif" width="18" height="19" /></td>
      </tr>
      
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="margin">
        <tr>
          <td width="58%" valign="top">
		    <ul class="about">
			  <li><a href="about.asp">公司简介</a></li>
			  <li><a href="news.asp">公司新闻</a></li>
			  <li><a href="directory.asp">客户名录</a></li>
			  <li><a href="about.asp?ID=5">合作伙伴</a></li>
			  <li><a href="about.asp?ID=3">职业生涯</a></li>
              <li><a href="about.asp?ID=6">亚太网络</a></li>
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
    <td width="674" height="28" colspan="3" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3">　<img src="images/weizhi.gif" width="14" height="14" style="vertical-align:middle;" />&nbsp;您当前的位置：<a href="<%=SysRootDir%>">爱克思伦企业管理首页</a> → 关于我们</td>
  </tr>
  <tr>
    <td width="51" height="27" align="center" valign="top" bgcolor="#3D8EEA"><img src="images/right_ico.gif" width="28" height="27" /></td>
    <td width="411" valign="top" bgcolor="#3D8EEA"><h2><%=SeoTitle%></h2></td>
    <td width="212" valign="top" bgcolor="#3D8EEA"><img src="images/right_name.gif" width="194" height="27" /></td>
  </tr>
  <tr>
    <td colspan="3" valign="top" class="pad_left">
    <%
Dim rs, sql
Set rs = server.CreateObject("adodb.recordset")
    sql = "select top 1 * from Qianbo_About where id=2"
rs.Open sql, conn, 1, 3
If rs.EOF Then
response.Write("<p>暂无更新！")
else
%>
    <p><%
ContentStr = Split(rs("Content"), "{＄html_Paging＄}")
For i = pageNum To pageNum
%>
              <%=ContentStr(i)%>
              <% Next %></p>
    <%End If
rs.Close
Set rs = Nothing%></td>
  </tr>
</table></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>