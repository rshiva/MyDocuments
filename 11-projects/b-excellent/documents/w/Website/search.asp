<!--#include file="Include/Const.Asp" -->
<!--#include file="Include/NoSQL.Asp" -->
<!--#include file="Include/ConnSiteData.Asp" -->
<%
Call SiteInfo
if trim(request("key"))="" or trim(request("key"))="输入您要搜索的内容" then
response.Write("<script>alert('请输入您要搜索的关键字！');location.href='index.asp';</script>")
response.End()
end if
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
        <td colspan="3">　<img src="images/weizhi.gif" width="14" height="14" style="vertical-align:middle;" />&nbsp;您当前的位置：<a href="index.asp">爱克思伦企业管理首页</a> → 搜索结果 </td>
      </tr>
      <tr>
        <td width="51" height="27" align="center" valign="top" bgcolor="#3D8EEA"><img src="images/right_ico.gif" width="28" height="27" /></td>
        <td width="411" valign="top" bgcolor="#3D8EEA"><h2>“<%=trim(request("Key"))%>” → 搜索详情</h2></td>
        <td width="212" valign="top" bgcolor="#3D8EEA"><img src="images/right_name.gif" width="194" height="27" /></td>
      </tr>
      <tr>
        <td colspan="3" valign="top" class="pad_left">
		  <ul class="news-two">
		     <li style="border:0;"><img src="images/ejlm_ico.gif" style="vertical-align:middle" />&nbsp;<strong> 最新动态 → 搜索结果</strong>&nbsp;&nbsp;</li>
             <%=WebContent(trim(request("Key")),"News")%>
		</td>
      </tr>
      <tr>
        <td colspan="3" valign="top" class="pad_left">
		  <ul class="news-two">
		     <li style="border:0;"><img src="images/ejlm_ico.gif" style="vertical-align:middle" />&nbsp;<strong> 学习园地 → 搜索结果</strong>&nbsp;&nbsp;</li>
             <%=WebContent(trim(request("Key")),"Down")%>
		</td>
      </tr>
      <tr>
        <td colspan="3" valign="top" class="pad_left">
		  <ul class="news-two">
		     <li style="border:0;"><img src="images/ejlm_ico.gif" style="vertical-align:middle" />&nbsp;<strong> 服务范围 → 搜索结果</strong>&nbsp;&nbsp;</li>
             <%=WebContent(trim(request("Key")),"Others")%>
		</td>
      </tr>
    </table></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
<%
Function WebLocation()
    WebLocation = "搜索 - "&vbCrLf
    If trim(request("key")) = "" Then
        WebLocation = WebLocation&"<center>请输入搜索关键字！</center>"
        Exit Function
    ElseIf Trim(request("Key")) = "" Then
        WebLocation = WebLocation&"<font color=""red"">关键字为空</font>"
    ElseIf request("Range") = "News" Then
        WebLocation = WebLocation&"最新动态 - 关键字[<font color=""red"">"&Trim(request("Keyword"))&"</font>]"
    ElseIf request("Range") = "Down" Then
        WebLocation = WebLocation&"学习园地 - 关键字[<font color=""red"">"&Trim(request("Keyword"))&"</font>]"
    ElseIf request("Range") = "Others" Then
        WebLocation = WebLocation&"服务范围 - 关键字[<font color=""red"">"&Trim(request("Keyword"))&"</font>]"
    End If
End Function

Function WebContent(Keyword, Range)
    If Range = "Void" Then
        response.Write "<center>请选择搜索范围</center>"
        Exit Function
    End If
    Dim idCount
    Dim pages
    pages = 12
    Dim pagec
    Dim page
    page = CLng(request("Page"))
    Dim pagenc
    pagenc = 5
    Dim pagenmax
    Dim pagenmin
    Dim pageprevious
    Dim pagenext
    Dim datafrom
    Dim datawhere
    Select Case Range
        Case "News"
            datafrom = "Qianbo_News"
            datawhere = "where ViewFlag and NewsName like '%"&KeyWord&"%'"
        Case "Down"
            datafrom = "Qianbo_Download"
            datawhere = "where ViewFlag and DownName like '%"&KeyWord&"%'"
        Case "Others"
            datafrom = "Qianbo_Others"
            datawhere = "where ViewFlag and OthersName like '%"&KeyWord&"%'"
    End Select
    Dim sqlid
    Dim Myself, PATH_INFO, QUERY_STRING
    PATH_INFO = request.servervariables("PATH_INFO")
    QUERY_STRING = request.ServerVariables("QUERY_STRING")'
    If QUERY_STRING = "" Then
        Myself = PATH_INFO & "?"
    ElseIf InStr(PATH_INFO & "?" & QUERY_STRING, "Page=") = 0 Then
        Myself = PATH_INFO & "?" & QUERY_STRING & "&"
    Else
        Myself = Left(PATH_INFO & "?" & QUERY_STRING, InStr(PATH_INFO & "?" & QUERY_STRING, "Page=") -1)
    End If
    Dim taxis
    taxis = "order by id desc "
    Dim i
    Dim rs, sql
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select count(ID) as idCount from ["& datafrom &"]" & datawhere
    Set rs = server.CreateObject("adodb.recordset")
    rs.Open sql, conn, 0, 1
    idCount = rs("idCount")
    If(idcount>0) Then
    If(idcount Mod pages = 0)Then
    pagec = Int(idcount / pages)
Else
    pagec = Int(idcount / pages) + 1
End If
sql = "select id from ["& datafrom &"] " & datawhere & taxis
Set rs = server.CreateObject("adodb.recordset")
rs.Open sql, conn, 1, 1
rs.pagesize = pages
If page < 1 Then page = 1
If page > pagec Then page = pagec
If pagec > 0 Then rs.absolutepage = page
For i = 1 To rs.pagesize
    If rs.EOF Then Exit For
    If(i = 1)Then
    sqlid = rs("id")
Else
    sqlid = sqlid &","&rs("id")
End If
rs.movenext
Next
End If
If(idcount>0 And sqlid<>"") Then
sql = "select * from ["& datafrom &"] where id in("& sqlid &") "&taxis
Set rs = server.CreateObject("adodb.recordset")
rs.Open sql, conn, 0, 1
While Not rs.EOF
    NewAutoLink = "NewsView.Asp?ID="&rs("ID")&""
    DownAutoLink = "knowView.Asp?ID="&rs("ID")&""
    OtherAutoLink = "SerView.Asp?ID="&rs("ID")&""
    Select Case Range
        Case "News"
            Response.Write "<li><span class=""tit""><img src=""images/news_ico.gif"" width=""3"" height=""5"" style=""vertical-align:middle"" /> <a href="""&NewAutoLink&""">"&rs("NewsName")&"</a></span><span class=""date"">"&FormatDate(rs("Addtime"), 13)&"</span></li>"&vbCrLf
        Case "Down"
		    Response.Write "<li><span class=""tit""><img src=""images/news_ico.gif"" width=""3"" height=""5"" style=""vertical-align:middle"" /> <a href="""&DownAutoLink&""">"&rs("DownName")&"</a></span><span class=""date"">"&FormatDate(rs("Addtime"), 13)&"</span></li>"&vbCrLf
        Case "Others"
			Response.Write "<li><span class=""tit""><img src=""images/news_ico.gif"" width=""3"" height=""5"" style=""vertical-align:middle"" /> <a href="""&OtherAutoLink&""">"&rs("OthersName")&"</a></span><span class=""date"">"&FormatDate(rs("Addtime"), 13)&"</span></li>"&vbCrLf
    End Select
    rs.movenext
Wend
Else
    response.Write "<li>暂无相关信息</li>"
    Exit Function
End If
response.Write("</ul>")
Response.Write "<table width=""98%"" border=""0"" cellspacing=""0"" cellpadding=""0"">"&vbCrLf
Response.Write "  <tr height=""35"">"&vbCrLf
Response.Write "    <td align=""center"">"&vbCrLf
Response.Write "共<strong style=""color:red"">"&idcount&"</strong>条记录 页次：<strong style=""color:red"">"&page&"</strong>/"&pagec&" 每页：<strong style=""color:red"">"&pages&"</strong>条记录" & vbCrLf
pagenmin = page - pagenc
pagenmax = page+pagenc
If(pagenmin<1) Then pagenmin = 1
If(page>1) Then response.Write ("<a href="""& myself &"Page=1"" title=""回到第一页""><font face=""webdings"" color=""#000000"">9</font></a> ")
If page - (pagenc * 2 + 1)<= 0 Then
    pageprevious = 1
Else
    pageprevious = page - (pagenc * 2 + 1)
End If
If(pagenmin>1) Then response.Write ("<a href="""& myself &"Page="& pageprevious &""" title=""第"& pageprevious &"页""><font face=""webdings"" color=""#000000"">3</font></a> ")
If(pagenmax>pagec) Then pagenmax = pagec
For i = pagenmin To pagenmax
    If(i = page) Then
    response.Write ("&nbsp;<strong style=""color:red"">"& i &"</strong>&nbsp;")
Else
    response.Write ("[<a href="""& myself &"Page="& i &""">"& i &"</a>]")
End If
Next
If page+(pagenc * 2 + 1)>= pagec Then
    pagenext = pagec
Else
    pagenext = page+(pagenc * 2 + 1)
End If
If(pagenmax<pagec) Then response.Write (" <a href="""& myself &"Page="& pagenext &""" title=""跳转到第"&pagenext&"页""><font face=""webdings"" color=""#999999"">:</font></a> ")
If(page<pagec) Then response.Write (" <a href="""& myself &"Page="& pagec &""" title=""跳转到第"&pagec&"页""><font face=""webdings"" color=""#000000"">:</font></a>")
Response.Write "    </td>"&vbCrLf
Response.Write "  </tr>"&vbCrLf
Response.Write "</table>"&vbCrLf
rs.Close
Set rs = Nothing
End Function
%>
</body>
</html>