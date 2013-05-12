<!--#include file="../Include/Const.Asp" -->
<!--#include file="../Include/ConnSiteData.Asp" -->
<!--#include file="CheckAdmin.Asp"-->
<%
If InStr(session("AdminPurview"), "|9,") = 0 Then
    response.Write ("<br /><br /><div align=""center""><font style=""color:red; font-size:9pt; "")>您没有管理该模块的权限！</font></div>")
    response.End
End If
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="Images/Admin_style.css">
<script language="javascript" src="../Scripts/Admin.js"></script>
<br />
<table class="tableBorder" width="95%" border="0" align="center" cellpadding="5" cellspacing="1">
<form action="DelContent.Asp?Result=About" method="post" name="formDel">
  <tr>
    <th height="22" colspan="8" sytle="line-height:150%">【企业信息管理】</th>
  </tr>
  <tr>
    <th>ID</th>
	<th>生效</th>
	<th width="200" align="left">信息标题</th>
	<th>显示顺序</th>
	<th>更新时间</th>
	<th>人气</th>
	<th>操作</th>
	<!--th>选择</th-->
  </tr>
  <% AboutList() %>
  </form>
</table>
<% if request.QueryString("Result")="ModifySequence" then call ModifySequence() %>
<% if request.QueryString("Result")="SaveSequence" then call SaveSequence() %>
<%
Function AboutList()
    Dim idCount
    Dim pages
    pages = 20
    Dim pagec
    Dim page
    page = CLng(request("Page"))
    Dim pagenc
    pagenc = 2
    Dim pagenmax
    Dim pagenmin
    Dim datafrom
    datafrom = "Qianbo_About"
    Dim datawhere
    datawhere = ""
    Dim sqlid
    Dim Myself, PATH_INFO, QUERY_STRING
    PATH_INFO = request.servervariables("PATH_INFO")
    QUERY_STRING = request.ServerVariables("QUERY_STRING")'
    If QUERY_STRING = "" Or InStr(PATH_INFO & "?" & QUERY_STRING, "Page=") = 0 Then
        Myself = PATH_INFO & "?"
    Else
        Myself = Left(PATH_INFO & "?" & QUERY_STRING, InStr(PATH_INFO & "?" & QUERY_STRING, "Page=") -1)
    End If
    Dim taxis
    taxis = "order by Sequence asc"
    Dim i
    Dim rs, sql
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
While(Not rs.EOF)
Response.Write "<tr>" & vbCrLf
Response.Write "<td nowrap class=""forumRow"">"&rs("ID")&"</td>" & vbCrLf
If rs("ViewFlag") Then
    Response.Write "<td nowrap align='center' class=""forumRow"" width=""40""><a href=""Conversion.Asp?id="&rs("ID")&"&LX="&datafrom&"&Operation=down""><font color='blue'>生效</font></a></td>" & vbCrLf
Else
    Response.Write "<td nowrap align='center' class=""forumRow"" width=""40""><a href=""Conversion.Asp?id="&rs("ID")&"&LX="&datafrom&"&Operation=up""><font color='red'>未生效</font></a></td>" & vbCrLf
End If
Response.Write "<td nowrap class=""forumRow""><a href='AboutEdit.Asp?Result=Modify&ID="&rs("ID")&"' title="""&rs("AboutName")&""">"&StrLeft(rs("AboutName"), 28)&"</a>"& vbCrLf
If rs("ChildFlag") Then
    Response.Write "<font color='blue'>分页</font>" & vbCrLf
Else
    Response.Write "<font color='red'>不分页</font>" & vbCrLf
End If
Response.Write "</td>"& vbCrLf
Response.Write "<td nowrap align='center' class=""forumRow""><font color='blue'>"&rs("Sequence")&"</font></td>" & vbCrLf
Response.Write "<td nowrap class=""forumRow"">"&rs("AddTime")&"</td>" & vbCrLf
Response.Write "<td nowrap align='center' class=""forumRow"">"&rs("ClickNumber")&"</td>" & vbCrLf
Response.Write "<td align=""center""nowrap class=""forumRow""><a href='AboutEdit.Asp?Result=Add'>添加</a> <a href='AboutEdit.Asp?Result=Modify&ID="&rs("ID")&"'>修改</a> <a href='AboutList.Asp?Result=ModifySequence&ID="&rs("ID")&"'>排序</a></td>" & vbCrLf
'Response.Write "<td nowrap align='center' class=""forumRow""><input name='selectID' type='checkbox' value='"&rs("ID")&"'></td>" & vbCrLf
Response.Write "</tr>" & vbCrLf
rs.movenext
Wend
'Response.Write "<tr>" & vbCrLf
'Response.Write "<td colspan='10' nowrap align=""right"" class=""forumRow""><input onClick=""CheckAll(this.form)"" name=""buttonAllSelect"" type=""button"" id=""submitAllSearch"" value=""全选""> <input onClick=""CheckOthers(this.form)"" name=""buttonOtherSelect"" type=""button"" id=""submitOtherSelect"" value=""反选""> <input name='submitDelSelect' type='button' id='submitDelSelect' value='删除所选' onClick='ConfirmDel(""是否确定删除？删除后不能恢复！"");'></td>" & vbCrLf
'Response.Write "</tr>" & vbCrLf
Else
    response.Write "<tr><td nowrap align='center' colspan='10' class=""forumRow"">暂无企业信息</td></tr>"
End If
Response.Write "<tr>" & vbCrLf
Response.Write "<td colspan='10' nowrap class=""forumRow"">" & vbCrLf
Response.Write "<table width='100%' border='0' align='center' cellpadding='0' cellspacing='0'>" & vbCrLf
Response.Write "<tr>" & vbCrLf
Response.Write "<td class=""forumRow"">共计：<font color='red'>"&idcount&"</font>条记录 页次：<font color='red'>"&page&"</font></strong>/"&pagec&" 每页：<font color='red'>"&pages&"</font>条</td>" & vbCrLf
Response.Write "<td align='right'>" & vbCrLf
pagenmin = page - pagenc
pagenmax = page+pagenc
If(pagenmin<1) Then pagenmin = 1
If(page>1) Then response.Write ("<a href='"& myself &"Page=1'><font style='font-size: 14px; font-family: Webdings'>9</font></a> ")
If(pagenmin>1) Then response.Write ("<a href='"& myself &"Page="& page - (pagenc * 2 + 1) &"'><font style='font-size: 14px; font-family: Webdings'>7</font></a> ")
If(pagenmax>pagec) Then pagenmax = pagec
For i = pagenmin To pagenmax
    If(i = page) Then
    response.Write (" <font color='red'>"& i &"</font> ")
Else
    response.Write ("[<a href="& myself &"Page="& i &">"& i &"</a>]")
End If
Next
If(pagenmax<pagec) Then response.Write (" <a href='"& myself &"Page="& page+(pagenc * 2 + 1) &"'><font style='font-size: 14px; font-family: Webdings'>8</font></a> ")
If(page<pagec) Then response.Write ("<a href='"& myself &"Page="& pagec &"'><font style='font-size: 14px; font-family: Webdings'>:</font></a> ")
Response.Write "第<input name='SkipPage' onKeyDown='if(event.keyCode==13)event.returnValue=false' onchange=""if(/\D/.test(this.value)){alert('请输入需要跳转到的页数并且必须为整数！');this.value='"&Page&"';}"" style='width: 28px;' type='text' value='"&Page&"'>页" & vbCrLf
Response.Write "<input name='submitSkip' type='button' onClick='GoPage("""&Myself&""")' value='转到'>" & vbCrLf
Response.Write "</td>" & vbCrLf
Response.Write "</tr>" & vbCrLf
Response.Write "</table>" & vbCrLf
rs.Close
Set rs = Nothing
Response.Write "</td>" & vbCrLf
Response.Write "</tr>" & vbCrLf
End Function

Sub ViewGroupName(GruopID)
    Dim rs, sql
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select GroupID,GroupName from Qianbo_MemGroup where GroupID='"&GruopID&"'"
    rs.Open sql, conn, 1, 1
    If rs.bof And rs.EOF Then
        response.Write("<td nowrap align=""center"" class=""forumRow"">未设组别</td>")
    Else
        response.Write("<td nowrap align=""center"" class=""forumRow"">"&rs("GroupName")&"</td>")
    End If
    rs.Close
    Set rs = Nothing
End Sub

Sub ModifySequence()
    Dim rs, sql, ID, AboutName, Sequence
    ID = request.QueryString("ID")
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from Qianbo_About where ID="& ID
    rs.Open sql, conn, 1, 1
    AboutName = rs("AboutName")
    Sequence = rs("Sequence")
    rs.Close
    Set rs = Nothing
    response.Write "<br />"
    response.Write "<table width='100%' border='0' cellpadding='3' cellspacing='0'>"
    response.Write "<form action='AboutList.Asp?Result=SaveSequence' method='post' name='formSequence'>"
    response.Write "<tr>"
    response.Write "<td height='24' align='center' nowrap>ID：<input name='ID' type='text' style='width: 28;' value='"&ID&"' maxlength='4' readonly> 企业信息名称：<input name='AboutName' type='text' id='AboutName' style='width: 180;' value='"&AboutName&"' maxlength='35' readonly> 排序号：<input name='Sequence' type='text' style='width: 60;' value='"&Sequence&"' maxlength='4' onKeyDown='if(event.keyCode==13)event.returnValue=false' onchange=""if(/\D/.test(this.value)){alert('序号必须为整数！');this.value='"&Sequence&"';}""> <input name='submitSequence' type='submit' class='button' value='保存'></td>"
    response.Write "</tr>"
    response.Write "</form>"
    response.Write "</table>"
End Sub

Sub SaveSequence()
    Dim rs, sql
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select * from Qianbo_About where ID="& request.Form("ID")
    rs.Open sql, conn, 1, 3
    rs("Sequence") = request.Form("Sequence")
    rs.update
    rs.Close
    Set rs = Nothing
    response.redirect "AboutList.Asp"
End Sub
%>