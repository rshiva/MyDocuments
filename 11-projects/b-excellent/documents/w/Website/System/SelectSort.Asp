<!--#include file="../Include/Const.Asp" -->
<!--#include file="../Include/ConnSiteData.Asp" -->
<!--#include file="CheckAdmin.Asp"-->
<title>选择所属类别</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="Images/Admin_style.css">
<script language="javascript" src="../Scripts/Admin.js"></script>
<br />
<table class="tableBorder" width="95%" border="0" align="center" cellpadding="5" cellspacing="1">
  <tr>
    <th height="22" colspan="2" sytle="line-height:150%">【选择所属类别】</th>
  </tr>
  <tr>
    <td class="forumRow">
<%
Dim Result, Datafrom
Result = request.QueryString("Result")
Select Case Result
    Case "Products"
        Datafrom = "Qianbo_ProductSort"
    Case "News"
        Datafrom = "Qianbo_NewsSort"
    Case "Download"
        Datafrom = "Qianbo_DownSort"
    Case "Others"
        Datafrom = "Qianbo_OthersSort"
    Case Else
End Select
ListSort(0)
%>
    </td>
  </tr>
</table>
<%
Function ListSort(id)
    Dim rs, sql, i, ChildCount, FolderType, FolderName, onMouseUp, ListType
    Set rs = server.CreateObject("adodb.recordset")
    sql = "Select * From "&Datafrom&" where ParentID="&id&" order by id"
    rs.Open sql, conn, 1, 1
    If id = 0 And rs.recordcount = 0 Then
        response.Write ("<center>暂无相关分类</center>")
        response.End
    End If
    i = 1
    response.Write("<table border='0' cellspacing='0' cellpadding='0'>")
    While Not rs.EOF
        ChildCount = conn.Execute("select count(*) from "&Datafrom&" where ParentID="&rs("id"))(0)
        If ChildCount = 0 Then
            If i = rs.recordcount Then
                FolderType = "SortFileEnd"
            Else
                FolderType = "SortFile"
            End If
            FolderName = rs("SortName")
            onMouseUp = ""
        Else
            If i = rs.recordcount Then
                FolderType = "SortEndFolderClose"
                ListType = "SortEndListline"
                onMouseUp = "EndSortChange('a"&rs("id")&"','b"&rs("id")&"');"
            Else
                FolderType = "SortFolderClose"
                ListType = "SortListline"
                onMouseUp = "SortChange('a"&rs("id")&"','b"&rs("id")&"');"
            End If
            FolderName = rs("SortName")
        End If
        response.Write("<tr>")
        response.Write("<td nowrap id='b"&rs("id")&"' class='"&FolderType&"' onMouseUp="&onMouseUp&"></td><td nowrap>"&FolderName&"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
        response.Write("<a href=javaScript:AddSort('"&SortText(rs("ID"))&"','"&rs("ID")&"','"&rs("SortPath")&"')><font color='#ff6600'>选择</font></a>")
        response.Write("</td></tr>")
        If ChildCount>0 Then
%>
      <tr id="a<%= rs("id")%>" style="display:yes"><td class="<%= ListType%>" nowrap></td><td ><% ListSort(rs("id")) %></td></tr>
<%
End If
rs.movenext
i = i + 1
Wend
response.Write("</table>")
rs.Close
Set rs = Nothing
End Function

Function SortText(ID)
    Dim rs, sql
    Set rs = server.CreateObject("adodb.recordset")
    sql = "Select * From "&Datafrom&" where ID="&ID
    rs.Open sql, conn, 1, 1
    SortText = rs("SortName")
    SortText = Replace(SortText, " ", "&nbsp;")
    rs.Close
    Set rs = Nothing
End Function
%>