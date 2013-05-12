<!--#include file="../Include/Const.Asp" -->
<!--#include file="../Include/ConnSiteData.Asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="Images/Admin_style.css">
<script language="javascript" src="../Scripts/Admin.js"></script>
<%
If InStr(session("AdminPurview"), "|10,") = 0 Then
    response.Write ("<br /><br /><div align=""center""><font style=""color:red; font-size:9pt; "")>您没有管理该模块的权限！</font></div>")
    response.End
End If
Dim Result
Result = request.QueryString("Result")
Dim ID, AboutName, ViewFlag, Content
Dim GroupID, GroupIdName, Exclusive, ChildFlag
ID = request.QueryString("ID")
Call AboutEdit()
%>
<br />
<table class="tableBorder" width="95%" border="0" align="center" cellpadding="5" cellspacing="1">
  <form name="editAboutForm" method="post" action="AboutEdit.Asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>">
    <tr>
      <th height="22" colspan="2" sytle="line-height:150%">【<%If Result = "Add" then%>添加<%ElseIf Result = "Modify" then%>修改<%End If%>企业信息】</th>
    </tr>
    <tr>
      <td width="20%" align="right" class="forumRow">信息标题：</td>
      <td width="80%" class="forumRowHighlight"><input name="AboutName" type="text" id="AboutName" style="width: 280" value="<%=AboutName%>" maxlength="100">
        是否生效：<input name="ViewFlag" type="checkbox" value="1" <%if ViewFlag then response.write ("checked")%>>
        是否分页：<input name="ChildFlag" type="checkbox" value="1" <%if ChildFlag then response.write ("checked")%>> <font color="red">*</font>
        分页符{＄html_Paging＄}</td>
    </tr>
    <tr>
      <td align="right" class="forumRow">信息内容：</td>
      <td class="forumRowHighlight"><textarea name="Content" id="Content" style="display:none"><%=Server.HTMLEncode((Content))%></textarea>
        <IFRAME ID="eWebEditor1" SRC="eWebEditor/ewebeditor.htm?id=Content&style=popup" FRAMEBORDER="0" SCROLLING="no" WIDTH="600" HEIGHT="350"></IFRAME></iframe></td>
    </tr>
    <tr>
      <td align="right" class="forumRow"></td>
      <td class="forumRowHighlight"><input name="submitSaveEdit" type="submit" id="submitSaveEdit" value="保存"> <input type="button" value="返回上一页" onclick="history.back(-1)"></td>
    </tr>
  </form>
</table>
<%
Sub AboutEdit()
    Dim Action, rsCheckAdd, rs, sql
    Action = request.QueryString("Action")
    If Action = "SaveEdit" Then
        Set rs = server.CreateObject("adodb.recordset")
        If Len(Trim(request.Form("AboutName")))<1 Then
            response.Write ("<script language='javascript'>alert('请填写信息标题！');history.back(-1);</script>")
            response.End
        End If
        If Trim(request.Form("Content")) = "" Then
            response.Write ("<script language='javascript'>alert('请填写信息内容！');history.back(-1);</script>")
            response.End
        End If
        If Result = "Add" Then
            sql = "select * from Qianbo_About"
            rs.Open sql, conn, 1, 3
            rs.addnew
            rs("AboutName") = Trim(Request.Form("AboutName"))
            If Request.Form("ViewFlag") = 1 Then
                rs("ViewFlag") = Request.Form("ViewFlag")
            Else
                rs("ViewFlag") = 0
            End If
            rs("Content") = RTrim(Request.Form("Content"))
            If Request.Form("ChildFlag") = 1 Then
                rs("ChildFlag") = Request.Form("ChildFlag")
                rs("Sequence") = 999
            Else
                rs("ChildFlag") = 0
                rs("Sequence") = 99
            End If
            rs("AddTime") = Now()
            rs("UpdateTime") = Now()
            rs.update
            rs.Close
            Set rs = Nothing
        End If
        If Result = "Modify" Then
            sql = "select * from Qianbo_About where ID="&ID
            rs.Open sql, conn, 1, 3
            rs("AboutName") = Trim(Request.Form("AboutName"))
            If Request.Form("ViewFlag") = 1 Then
                rs("ViewFlag") = Request.Form("ViewFlag")
            Else
                rs("ViewFlag") = 0
            End If
            rs("Content") = Request.Form("Content")
            If Request.Form("ChildFlag") = 1 Then
                rs("ChildFlag") = Request.Form("ChildFlag")
                rs("Sequence") = 999
            Else
                rs("ChildFlag") = 0
            End If
            rs("UpdateTime") = Now()
            rs.update
            rs.Close
            Set rs = Nothing
        End If
        response.Write "<script language='javascript'>alert('设置成功！');location.replace('AboutList.Asp');</script>"
    Else
        If Result = "Modify" Then
            Set rs = server.CreateObject("adodb.recordset")
            sql = "select * from Qianbo_About where ID="& ID
            rs.Open sql, conn, 1, 1
            AboutName = rs("AboutName")
            ViewFlag = rs("ViewFlag")
            Content = rs("Content")
            ChildFlag = rs("ChildFlag")
            rs.Close
            Set rs = Nothing
        End If
    End If
End Sub

%>