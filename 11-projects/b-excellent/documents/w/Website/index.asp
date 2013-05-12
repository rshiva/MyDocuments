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
<title><% =SiteTitle %></title>
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
<table width="975" height="96" border="0" align="center" cellpadding="0" cellspacing="0" class="margin">
  <tr>
    <td align="center"><img src="images/ourservices.gif"/><br/><img src="images/server.gif" /></td>
    <td align="center"><img src="images/strategy .gif" width="185" height="89" border="0" usemap="#Map" /></td>
    <td align="center"><img src="images/ment.gif" width="185" height="89" border="0" usemap="#Map2" /></td>
    <td align="center"><img src="images/ship.gif" width="184" height="89" border="0" usemap="#Map3" /></td>
    <td align="center"><img src="images/tool.gif" width="184" height="89" border="0" usemap="#Map4" /></td>
  </tr>
</table>
<table width="975" border="0" align="center" cellpadding="0" cellspacing="0" class="cantent">
  <tr>
    <td width="276" valign="top" class="border-right"><table width="265" border="0" cellspacing="0" cellpadding="0" class="tjkc">
      <tr>
        <td width="32" rowspan="4"><img src="images/class.gif" width="32" height="201" /></td>
        <td width="214" align="center" valign="middle"></td>
      </tr>
      <tr>
        <td align="center" class="class_1"><a href="curriculum.asp?SortID=3">推荐课程</a></td>
      </tr>
      <tr>
        <td align="center"  class="class_2"><a href="curriculum.asp?SortID=4">推荐课程</a></td>
      </tr>
      <tr>
        <td align="center"  class="class_3"><a href="curriculum.asp?SortID=5">推荐课程</a></td>
      </tr>
    </table>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="search">
    <form action="search.asp" method="post">
<tr>
    <td height="28" align="center">
        <input name="key" type="text" onfocus="if (this.value=='输入您要搜索的内容'){this.value='';}" onblur="if (this.value==''){this.value='输入您要搜索的内容';}" value="输入您要搜索的内容" size="30" /> 
        <input type="image" src="images/search.gif" name="Submit" value="提交" class="input1" /></td>
  </tr></form>
</table>
    </td>
    <td width="665" valign="top" class="padding-left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="26" colspan="2" class="border-bottom"><img src="images/list_ico.gif" width="20" height="19" style="vertical-align:middle;" />&nbsp;<span class="title">最新动态</span> <span class="title-e">NEWS</span><span class="more"><a href="news.asp" class="more">&raquo; more</a></span> </td>
      </tr>
      <tr>
        <td width="50%" class="pad">
		   <ul class="news_pic">
		      <%=Newspic("5,")%>
		   </ul>
		</td>
        <td width="50%"class="pad"><ul class="news_pic">
		      <%=Newspic("6,")%>
	      </ul></td>
      </tr>
      <tr>
        <td valign="top" class="pad" style="border-right:1px dotted #ccc;">
		   <ul class="news">
		     <%=News("5,")%>
		    </ul>
		</td>
        <td valign="top" class="pad">
		   <ul class="news">
		     <%=News("6,")%>
		    </ul>
		</td>
      </tr>
    </table>
</table>
<!--#include file="foot.asp"-->
<%
Function News(SortPath)
    Dim rs, sql, NewsName, NewFlag
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select top 4 * from Qianbo_News where ViewFlag and NoticeFlag and Instr(SortPath,'"&SortPath&"')>0 order by id desc"
    rs.Open sql, conn, 1, 1
    If rs.EOF Then
        Response.Write "<li>暂无相关信息</li>"&vbCrLf
    Else
        Do While Not rs.EOF
            If Now() - rs("AddTime")<= 2 Then
                NewsName = StrLeft(rs("NewsName"), 20)
                NewFlag = " <img src=""Images/new.gif"" align=""absmiddle"">"
            Else
                NewsName = Mid(rs("NewsName"), 1, 17)
                NewFlag = ""
            End If
            AutoLink = "NewsView.Asp?ID="&rs("id")&""
            Response.Write "<li><span class=""tit"">· <a href="""&AutoLink&""" title="""&rs("NewsName")&""">"&NewsName&"</a>"&NewFlag&"</span> <span class=""date"">"&formatdatetime(rs("AddTime"),2)&"</span></li>"&vbCrLf
            rs.movenext
        Loop
    End If
    rs.Close
    Set rs = Nothing
End Function

Function Newspic(SortPath)
    Dim rs, sql, NewsName, NewFlag
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select top 1 * from Qianbo_News where ViewFlag and NoticeFlag and len(SmallPic)>10 and Instr(SortPath,'"&SortPath&"')>0 order by id desc"
    rs.Open sql, conn, 1, 1
    If rs.EOF Then
        Response.Write "<li>暂无相关信息</li>"&vbCrLf
    Else
        Do While Not rs.EOF
            If Now() - rs("AddTime")<= 2 Then
                NewsName = StrLeft(rs("NewsName"), 50)
                NewFlag = " <img src=""Images/new.gif"" align=""absmiddle"">"
            Else
                NewsName = Mid(rs("NewsName"), 1, 50)
                NewFlag = ""
            End If
            AutoLink = "NewsView.Asp?ID="&rs("id")&""
            Response.Write "<li class=""img1""><img src="&rs("SmallPic")&" width=""82"" height=""65"" border=""0"" /></li><li class=""txt"">"&formatdatetime(rs("AddTime"),2)&"<br>"&NewsName&"...<a href="""&AutoLink&""" title="""&NewsName&"""> &raquo;more</a></li>"&vbCrLf
            rs.movenext
        Loop
    End If
    rs.Close
    Set rs = Nothing
End Function
%>
<map name="Map" id="Map"><area shape="rect" coords="141,68,176,83" href="SerView.Asp?ID=15" /></map>
<map name="Map2" id="Map2"><area shape="rect" coords="142,68,175,84" href="SerView.Asp?ID=15" /></map>
<map name="Map3" id="Map3"><area shape="rect" coords="143,68,174,83" href="SerView.Asp?ID=15" /></map>
<map name="Map4" id="Map4"><area shape="rect" coords="145,68,174,82" href="SerView.Asp?ID=15" /></map>
</body>
</html>