<!--#include file="Include/Const.Asp" -->
<!--#include file="Include/NoSQL.Asp" -->
<!--#include file="Include/ConnSiteData.Asp" -->
<%
Call SiteInfo
ID = request.QueryString("ID")
If ID <> "" Or IsNumeric(ID) Then
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from Qianbo_Download where ViewFlag and ID="&ID
    rs.Open sql, conn, 1, 3
    If rs("SeoKeywords") <> "" Then
        SeoKeywords = rs("SeoKeywords")
    Else
        SeoKeywords = rs("OthersName")
    End If
    If rs("SeoDescription") <> "" Then
        SeoDescription = rs("SeoDescription")
    Else
        SeoDescription = rs("DownName")
    End If
    SeoTitle = rs("DownName")
End If
rs.Close
Set rs = Nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title><% =SeoTitle %> - <% =SiteTitle %></title>
<meta name="keywords" content="<% =SeoKeywords %>" />
<meta name="description" content="<% =SeoDescription %>" />
<link href="style.css" type="text/css" rel="stylesheet" rev="stylesheet"/>
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
              <li>·<a href="SerView.Asp?ID=15">企业战略</a></li>
	          <li>·<a href="SerView.Asp?ID=15">管理体系</a></li>
	          <li>·<a href="SerView.Asp?ID=15">领导才能</a></li>
	          <li>·<a href="SerView.Asp?ID=15">管理工具</a></li>
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
    <td width="673" colspan="3" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>　<img src="images/weizhi.gif" width="14" height="14" style="vertical-align:middle;" />&nbsp;您当前的位置：<a href="index.asp">爱克思伦企业管理首页</a>  <%=WebLocation()%> </td>
      </tr>
      <tr>
        <td height="26" align="right" bgcolor="#F7f7f7"><a href="javascript:self.print()" class="txt">【打印本页】</a></font>　<a href="javascript:window.close();">【关闭窗口】　</a></td>
        </tr>
        <%
ID = request.QueryString("ID")
If ID = "" Or Not IsNumeric(ID) Then
    response.Write "<center>暂无相关信息</center>"
ElseIf conn.Execute("select * from Qianbo_Download Where ViewFlag and  ID="&ID).EOF Then
    response.Write "<center>暂无相关信息</center>"
Else
    Dim rs, sql
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from Qianbo_Download where ViewFlag and ID="&ID
    rs.Open sql, conn, 1, 3
End If
If Request("page") = "" Then
    pageNum = 0
Else
    pageNum = Request("page")
End If
%>
      <tr>
        <td valign="top"><h3><%=SeoTitle%></h3></td>
      </tr>
      <tr>
        <td height="300" valign="top" class="pad_left"><%
ContentStr = Split(rs("Content"), "{＄html_Paging＄}")
For i = pageNum To pageNum
%>
              <%=ContentStr(i)%>
              <% Next %></td>
      </tr>
      <tr>
        <td valign="top" class="pad_left">本文共分
              <%For p = 0 to ubound(ContentStr)%>
              <a href="?ID=<%=request("ID")%>&page=<%=p%>"><font color="red"><%=p+1%></font></a>
              <%Next%>
              页</td>
      </tr>
      <tr>
        <td align="right" bgcolor="#F7f7f7">发布日期：<font color="#666666"><%=FormatDate(rs("Addtime"),13)%></font>  <%
		if rs("FileUrl")<>"" then
		%><a href="<%=rs("FileUrl")%>">下载地址</a>  文件大小：<font color="#666666"><%=rs("FileSize")%></font><%end if%>&nbsp;</td>
      </tr>
      <script language="javascript" src="HitCount.Asp?id=<%=rs("ID")%>&LX=Qianbo_Download"></script>
      <script language="javascript" src="HitCount.Asp?action=count&LX=Qianbo_Download&id=<%=rs("ID")%>"></script>
      <%
rs.update
rs.Close
Set rs = Nothing
%>
    </table></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
<%Function WebLocation()
    If request.QueryString("ID") = "" Then
        WebLocation = WebLocation
    ElseIf Not IsNumeric(request.QueryString("ID")) Then
        WebLocation = WebLocation&"读取错误"
    ElseIf conn.Execute("select * from Qianbo_Download Where ViewFlag and  ID="&request.QueryString("ID")).EOF Then
        WebLocation = WebLocation&"读取错误"
    Else
        Dim rs, sql
        Set rs = server.CreateObject("adodb.recordset")
        sql = "select * from Qianbo_Download where ViewFlag and ID="&request.QueryString("ID")
        rs.Open sql, conn, 1, 1
        WebLocation = WebLocation&SortPathTXT("Qianbo_DownSort", rs("SortID"))
        rs.Close
        Set rs = Nothing
    End If
End Function

Function SortPathTXT(DataFrom, ID)
    Dim rs, sql
    Set rs = server.CreateObject("adodb.recordset")
    sql = "Select * From "&DataFrom&" where ViewFlag and ID="&ID
    rs.Open sql, conn, 1, 1
    If Not rs.EOF Then
        AutoLink = "know.Asp?SortID="&rs("ID")&""
        SortPathTXT = SortPathTXT(DataFrom, rs("ParentID"))&" → <a href="""&AutoLink&"""><span style=""color:#EC0000"">"&rs("SortName")&"</span></a>"
    End If
    rs.Close
    Set rs = Nothing
End Function%>
</body>
</html>