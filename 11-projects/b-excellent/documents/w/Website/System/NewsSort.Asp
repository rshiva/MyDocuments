<!--#include file="../Include/Const.Asp" -->
<!--#include file="../Include/ConnSiteData.Asp" -->
<!--#include file="CheckAdmin.Asp"-->
<%
If InStr(session("AdminPurview"), "|6,") = 0 Then
    response.Write ("<br /><br /><div align=""center""><font style=""color:red; font-size:9pt; "")>您没有管理该模块的权限！</font></div>")
    response.End
End If
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="Images/Admin_style.css">
<script language="javascript" src="../Scripts/Admin.js"></script>
<%
Dim Action
Action = request.QueryString("Action")
Select Case Action
    Case "Add"
        addFolder
        CallFolderView()
    Case "Del"
        Dim rs, sql, SortPath
        Set rs = server.CreateObject("adodb.recordset")
        sql = "Select * From Qianbo_NewsSort where ID="&request.QueryString("id")
        rs.Open sql, conn, 1, 1
        SortPath = rs("SortPath")
        conn.Execute("delete from  Qianbo_NewsSort where Instr(SortPath,'"&SortPath&"')>0")
        conn.Execute("delete from  Qianbo_News where Instr(SortPath,'"&SortPath&"')>0")
        response.Write ("<script language='javascript'>alert('成功删除本类、子类及所有下属信息条目！');location.replace('NewsSort.Asp');</script>")
    Case "Save"
        saveFolder ()
    Case "Edit"
        editFolder
        CallFolderView()
    Case "Move"
        moveFolderForm ()
        CallFolderView()
    Case "MoveSave"
        saveMoveFolder ()
    Case Else
        CallFolderView()
End Select
%>
<%Function CallFolderView()%>
<br />
<table class="tableBorder" width="95%" border="0" align="center" cellpadding="5" cellspacing="1">
  <tr>
    <th height="22" sytle="line-height:150%">【管理文章类别】</th>
  </tr>
  <tr>
    <td align="center" nowrap class="forumRow"><a href="NewsSort.Asp?Action=Add&ParentID=0">添加一级分类</a> | <a href="NewsList.Asp">查看所有文章</a></td>
  </tr>
  <tr>
    <td nowrap class="forumRow"><%Folder(0)%></td>
  </tr>
</table>
<%
End Function


Function Folder(id)
    Dim rs, sql, i, ChildCount, FolderType, FolderName, onMouseUp, ListType
    Set rs = server.CreateObject("adodb.recordset")
    sql = "Select * From Qianbo_NewsSort where ParentID="&id&" order by id"
    rs.Open sql, conn, 1, 1
    If id = 0 And rs.recordcount = 0 Then
        response.Write ("<center>暂无文章分类</center>")
        response.End
    End If
    i = 1
    response.Write("<table border='0' cellspacing='0' cellpadding='0'>")
    While Not rs.EOF
        ChildCount = conn.Execute("select count(*) from Qianbo_NewsSort where ParentID="&rs("id"))(0)
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
        datafrom = "Qianbo_NewsSort"
        response.Write("<tr>")
        response.Write("<td nowrap id='b"&rs("id")&"' class='"&FolderType&"'></td><td nowrap>"&FolderName&"&nbsp;")
        If rs("ViewFlag") Then
            Response.Write "<a href=""Conversion.Asp?id="&rs("ID")&"&LX="&datafrom&"&Operation=down""><font color='blue'>(生效)</font></a>"
        Else
            Response.Write "<a href=""Conversion.Asp?id="&rs("ID")&"&LX="&datafrom&"&Operation=up""><font color='red'>(未生效)</font></a>"
        End If
        response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color='red'>操作：</font><a href='NewsSort.Asp?Action=Add&ParentID="&rs("id")&"'>添加</a>")
        response.Write(" | <a href='NewsSort.Asp?Action=Edit&ID="&rs("id")&"'>修改</a>")
        response.Write(" | <a href='NewsSort.Asp?Action=Move&ID="&rs("id")&"&ParentID="&rs("Parentid")&"&SortName="&rs("SortName")&"&SortPath="&rs("SortPath")&"'>移</a>")
        response.Write("→<a href='#' onclick='SortFromTo.rows[4].cells[0].innerHTML=""→ "&rs("SortName")&""";MoveForm.toID.value="&rs("ID")&";MoveForm.toParentID.value="&rs("ParentID")&";MoveForm.toSortPath.value="""&rs("SortPath")&""";'>至</a>")
        response.Write(" | <a href=javascript:ConfirmDelSort('NewsSort',"&rs("id")&")>删除</a>")
        response.Write("&nbsp;&nbsp;&nbsp;&nbsp;<font color='red'>文章：</font><a href='NewsEdit.Asp?Result=Add'>添加</a>")
        response.Write(" | <a href='NewsList.Asp?SortID="&rs("ID")&"&SortPath="&rs("SortPath")&"'>列表</a>")
        response.Write("</td></tr>")
        If ChildCount>0 Then
%>
<tr id="a<%= rs("id")%>" style="display:yes">
  <td class="<%= ListType%>" nowrap></td>
  <td ><% Folder(rs("id")) %></td>
</tr>
<%
End If
rs.movenext
i = i + 1
Wend
response.Write("</table>")
rs.Close
Set rs = Nothing
End Function

Function addFolder()
    Dim ParentID
    ParentID = request.QueryString("ParentID")
    addFolderForm ParentID
End Function

Function addFolderForm(ParentID)
    Dim ParentPath, SortTextPath, rs, sql
    If ParentID = 0 Then
        ParentPath = "0,"
        SortTextPath = ""
    Else
        Set rs = server.CreateObject("adodb.recordset")
        sql = "Select * From Qianbo_NewsSort where ID="&ParentID
        rs.Open sql, conn, 1, 1
        ParentPath = rs("SortPath")
    End If
%>
<br />
<table class="tableBorder" width="95%" border="0" align="center" cellpadding="5" cellspacing="1">
  <form name="FolderForm" method="post" action="NewsSort.Asp?Action=Save&From=Add">
    <tr>
      <th height="22" sytle="line-height:150%">【添加文章类别】</th>
    </tr>
    <tr>
      <td class="forumRow">| 根类 →
        <% if ParentID<>0 then TextPath(ParentID)%></td>
    </tr>
    <tr>
      <td class="forumRow">名称：
        <input name="SortName" type="text" id="SortName" size="28">
        生效：
        <input name="ViewFlag" type="radio" value="1" checked="checked" />
        是
        <input name="ViewFlag" type="radio" value="0" />
        否 父类ID：
        <input readonly name="ParentID" type="text" id="ParentID" size="6" value="<%=ParentID %>">
        父类数字路径：
        <input readonly name="ParentPath" type="text" id="ParentPath" size="18" value="<%=ParentPath%>">
        <input name="submitSave" type="submit" id="保存" value="保存"></td>
    </tr>
  </form>
</table>
<%
End Function


Function TextPath(ID)
    Dim rs, sql, SortTextPath
    Set rs = server.CreateObject("adodb.recordset")
    sql = "Select * From Qianbo_NewsSort where ID="&ID
    rs.Open sql, conn, 1, 1
    SortTextPath = rs("SortName")&"&nbsp;→&nbsp;"
    If rs("ParentID")<>0 Then TextPath rs("ParentID")
    response.Write(SortTextPath)
End Function


Function saveFolder
    If Len(Trim(request.Form("SortName"))) = 0 Then
        response.Write ("<script language='javascript'>alert('请填写类别名称！');history.back(-1);</script>")
        response.End
    End If
    Dim From, Action, rs, sql, SortTextPath
    From = request.QueryString("From")
    Set rs = server.CreateObject("adodb.recordset")
    If From = "Add" Then
        sql = "Select * From Qianbo_NewsSort"
        rs.Open sql, conn, 1, 3
        rs.addnew
        Action = "添加文章类别"
        rs("SortPath") = request.Form("ParentPath") & rs("ID") &","
    Else
        sql = "Select * From Qianbo_NewsSort where ID="&request.QueryString("ID")
        rs.Open sql, conn, 1, 3
        Action = "修改文章类别"
        rs("SortPath") = request.Form("SortPath")
    End If
    rs("SortName") = request.Form("SortName")
    rs("ViewFlag") = request.Form("ViewFlag")
    rs("ParentID") = request.Form("ParentID")
    rs.update
    response.Write ("<script language='javascript'>alert('"&Action&"成功！');location.replace('NewsSort.Asp');</script>")
End Function

Function editFolder()
    Dim ID
    ID = request.QueryString("ID")
    editFolderForm ID
End Function

Function editFolderForm(ID)
    Dim SortName, ViewFlag, ParentID, SortPath, rs, sql
    Set rs = server.CreateObject("adodb.recordset")
    sql = "Select * From Qianbo_NewsSort where ID="&ID
    rs.Open sql, conn, 1, 1
    SortName = rs("SortName")
    ViewFlag = rs("ViewFlag")
    ParentID = rs("ParentID")
    SortPath = rs("SortPath")
%>
<br />
<table class="tableBorder" width="95%" border="0" align="center" cellpadding="5" cellspacing="1">
  <form name="FolderForm" method="post" action="NewsSort.Asp?Action=Save&From=Edit&ID=<%=ID%>">
    <tr>
      <th height="22" sytle="line-height:150%">【修改文章类别】</th>
    </tr>
    <tr>
      <td class="forumRow">| 根类 →
        <% if ParentID<>0 then TextPath(ParentID)%></td>
    </tr>
    <tr>
      <td class="forumRow">名称：
        <input name="SortName" type="text" id="SortName" size="28" value="<%=SortName%>">
        发布：
        <input name="ViewFlag" type="radio" value="1" <%if ViewFlag then response.write ("checked=checked")%> />
        是
        <input name="ViewFlag" type="radio" value="0" <%if not ViewFlag then response.write ("checked=checked")%>/>
        否 父类ID：
        <input readonly name="ParentID" type="text" id="ParentID" size="6" value="<%=ParentID %>">
        父类数字路径：
        <input readonly name="SortPath" type="text" id="SortPath" size="18" value="<%=SortPath%>">
        <input name="submitSave" type="submit" id="保存" value="保存"></td>
    </tr>
  </form>
</table>
<%
End Function

Function moveFolderForm()
    Dim ID, ParentID, SortName, SortPath
    ID = request.QueryString("ID")
    ParentID = request.QueryString("ParentID")
    SortName = request.QueryString("SortName")
    SortPath = request.QueryString("SortPath")
%>
<br />
<table id="SortFromTo" class="tableBorder" width="95%" border="0" align="center" cellpadding="5" cellspacing="1">
  <form name="MoveForm" method="post" action="NewsSort.Asp?Action=MoveSave">
    <tr>
      <th height="22" sytle="line-height:150%">【移动文章类别】</th>
    </tr>
    <tr>
      <td class="forumRow">→
        <% response.write (SortName) %></td>
    </tr>
    <tr>
      <td class="forumRow">移动类ID：
        <input readonly name="ID" type="text" id="ID" size="8" value="<%=ID%>">
        移动类父ID：
        <input readonly name="ParentID" type="text" id="ParentID" size="8" value="<%=ParentID%>">
        移动类数字路径：
        <input readonly name="SortPath" type="text" id="SortPath" size="28" value="<%=SortPath%>">
        </th>
    </tr>
    <tr>
      <td align="center" class="forumRow"><strong>目标位置：通过点击"至"选择将要放置到的类别。</strong></td>
    </tr>
    <tr>
      <td class="forumRow">→ 请选择…</td>
    </tr>
    <tr>
      <td class="forumRow">目标类ID：
        <input readonly name="toID" type="text" id="toID" size="8" value="">
        目标类父ID：
        <input readonly name="toParentID" type="text" id="toParentID" size="8" value="">
        目标类数字路径：
        <input readonly name="toSortPath" type="text" id="toSortPath" size="28" value=""></td>
    </tr>
    <tr>
      <td align="center" class="forumRow"><input name="submitMove" type="submit" id="转移" value="转移">
        </th>
    </tr>
  </form>
</table>
<%
End Function

Function saveMoveFolder()
    Dim rs, sql, fromID, fromParentID, fromSortPath, toID, toParentID, toSortPath, fromParentSortPath
    fromID = request.Form("ID")
    fromParentID = request.Form("ParentID")
    fromSortPath = request.Form("SortPath")
    toID = request.Form("toID")
    toParentID = request.Form("toParentID")
    toSortPath = request.Form("toSortPath")
    If toID = "" Or toParentID = "" Or toSortPath = "" Then
        response.Write ("<script language='javascript'>alert('请选择移动的目标位置！');history.back(-1);</script>")
        response.End
    End If
    If fromParentID = 0 Then
        response.Write ("<script language='javascript'>alert('一级分类无法被移动！');history.back(-1);</script>")
        response.End
    End If
    If fromSortPath = toSortPath Then
        response.Write ("<script language='javascript'>alert('当前选择的移动类别和目标位置相同，操作无效！');history.back(-1);</script>")
        response.End
    End If
    If InStr(toSortPath, fromSortPath)>0 Or fromParentID = toID Then
        response.Write ("<script language='javascript'>alert('不能将类别移动到本类或下属类里，操作无效！');history.back(-1);</script>")
        response.End
    End If
    Set rs = server.CreateObject("adodb.recordset")
    sql = "Select * From Qianbo_NewsSort where ID="&fromParentID
    rs.Open sql, conn, 0, 1
    fromParentSortPath = rs("SortPath")
    conn.Execute("update Qianbo_NewsSort set SortPath='"&toSortPath&"'+Mid(SortPath,Len('"&fromParentSortPath&"')+1) where Instr(SortPath,'"&fromSortPath&"')>0")
    conn.Execute("update Qianbo_NewsSort set ParentID='"&toID&"' where ID="&fromID)
    conn.Execute("update Qianbo_News set SortPath='"&toSortPath&"'+Mid(SortPath,Len('"&fromParentSortPath&"')+1) where Instr(SortPath,'"&fromSortPath&"')>0")
    response.Write ("<script language='javascript'>alert('文章类别移动成功！');location.replace('NewsSort.Asp');</script>")
End Function
%>