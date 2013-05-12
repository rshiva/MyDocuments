<!--#include file="../Include/Const.Asp" -->
<!--#include file="../Include/ConnSiteData.Asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="Images/Admin_style.css">
<script language="javascript" src="../Scripts/Admin.js"></script>
<script language="javascript">
function showUploadDialog(s_Type, s_Link, s_Thumbnail){
var arr = showModalDialog("eWebEditor/dialog/i_upload.htm?style=popup&type="+s_Type+"&link="+s_Link+"&thumbnail="+s_Thumbnail, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");}
</script>
<%
If InStr(session("AdminPurview"), "|8,") = 0 Then
    response.Write ("<br /><br /><div align=""center""><font style=""color:red; font-size:9pt; "")>您没有管理该模块的权限！</font></div>")
    response.End
End If
Dim Result
Result = request.QueryString("Result")
Dim ID, NewsName, ViewFlag, SortName, SortID, SortPath
Dim GroupID, GroupIdName, Exclusive, NoticeFlag, Source, Content, SeoKeywords, SeoDescription,SmallPic
ID = request.QueryString("ID")
Call NewsEdit()
Call SiteInfo
%>
<br />
<table class="tableBorder" width="95%" border="0" align="center" cellpadding="5" cellspacing="1">
  <form name="editForm" method="post" action="NewsEdit.Asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>">
    <tr>
      <th height="22" colspan="2" sytle="line-height:150%">【<%If Result = "Add" then%>添加<%ElseIf Result = "Modify" then%>修改<%End If%>文章】</th>
    </tr>
    <tr>
      <td width="20%" align="right" class="forumRow">文章标题：</td>
      <td width="80%" class="forumRowHighlight"><input name="NewsName" type="text" id="NewsName" style="width: 280" value="<%=NewsName%>" maxlength="100">
        是否生效：<input name="ViewFlag" type="checkbox" value="1" <%if ViewFlag then response.write ("checked")%>>
        是否首页显示：<input name="NoticeFlag" type="checkbox" value="1" <%if NoticeFlag then response.write ("checked")%>> <font color="red">*</font> <input type="button" name="btn" value="复制标题" title="复制标题到：MetaDescription、MetaKeywords" onclick="CopyWebTitle(document.editForm.NewsName.value);"></td>
    </tr>
    <tr>
      <td width="20%" align="right" class="forumRow">MetaKeywords：</td>
      <td width="80%" class="forumRowHighlight"><input name="SeoKeywords" type="text" id="SeoKeywords" style="width: 500" value="<%=SeoKeywords%>" maxlength="250"></td>
    </tr>
    <tr>
      <td width="20%" align="right" class="forumRow">MetaDescription：</td>
      <td width="80%" class="forumRowHighlight"><input name="SeoDescription" type="text" id="SeoDescription" style="width: 500" value="<%=SeoDescription%>" maxlength="250"></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">文章类别：</td>
      <td class="forumRowHighlight"><input name="SortID" type="text" id="SortID" style="width: 18; background-color:#fffff0" value="<%=SortID%>" readonly> <input name="SortPath" type="text" id="SortPath" style="width: 70; background-color:#fffff0" value="<%=SortPath%>" readonly> <input name="SortName" type="text" id="SortName" value="<%=SortName%>" style="width: 180; background-color:#fffff0" readonly> <a href="javaScript:OpenScript('SelectSort.Asp?Result=News',500,500,'')">选择类别</a> <font color="red">*</font></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">文章来源：</td>
      <td class="forumRowHighlight"><input name="Source" type="text" style="width: 280;" value="<%=Source%>" maxlength="100"> <a href="javascript:" onClick="document.editForm.Source.value='<%=SiteTitle%>'"><%=SiteTitle%></a></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">缩 略 图：</td>
      <td class="forumRowHighlight"><input name="SmallPic" type="text" style="width: 280;" value="<%=SmallPic%>" maxlength="250">
        <input type="button" value="上传图片" onClick="showUploadDialog('image', 'editForm.SmallPic', '')"></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">文章内容：<br>分页符{＄html_Paging＄}</td>
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
Sub NewsEdit()
    Dim Action, rsRepeat, rs, sql
    Action = request.QueryString("Action")
    If Action = "SaveEdit" Then
        Set rs = server.CreateObject("adodb.recordset")
        If Len(Trim(request.Form("NewsName")))<3 Then
            response.Write ("<script language='javascript'>alert('请填写文章名称！');history.back(-1);</script>")
            response.End
        End If
        If Result = "Add" Then
            sql = "select * from Qianbo_News"
            rs.Open sql, conn, 1, 3
            rs.addnew
            rs("NewsName") = Trim(Request.Form("NewsName"))
            If Request.Form("ViewFlag") = 1 Then
                rs("ViewFlag") = Request.Form("ViewFlag")
            Else
                rs("ViewFlag") = 0
            End If
            If Request.Form("SortID") = "" And Request.Form("SortPath") = "" Then
                response.Write ("<script language='javascript'>alert('请选择所属分类！');history.back(-1);</script>")
                response.End
            Else
                rs("SortID") = Request.Form("SortID")
                rs("SortPath") = Request.Form("SortPath")
            End If
            rs("Source") = Trim(Request.Form("Source"))
            If Request.Form("NoticeFlag") = 1 Then
                rs("NoticeFlag") = Request.Form("NoticeFlag")
            Else
                rs("NoticeFlag") = 0
            End If
			rs("SmallPic") = Trim(Request.Form("SmallPic"))
            rs("Content") = Trim(Request.Form("Content"))
            rs("SeoKeywords") = Trim(Request.Form("SeoKeywords"))
            rs("SeoDescription") = Trim(Request.Form("SeoDescription"))
            rs("AddTime") = Now()
            rs.update
            rs.Close
            Set rs = Nothing
        End If
        If Result = "Modify" Then
            sql = "select * from Qianbo_News where ID="&ID
            rs.Open sql, conn, 1, 3
            rs("NewsName") = Trim(Request.Form("NewsName"))
            If Request.Form("ViewFlag") = 1 Then
                rs("ViewFlag") = Request.Form("ViewFlag")
            Else
                rs("ViewFlag") = 0
            End If
            If Request.Form("SortID")<>"" And Request.Form("SortPath")<>"" Then
                rs("SortID") = Request.Form("SortID")
                rs("SortPath") = Request.Form("SortPath")
            Else
                response.Write ("<script language='javascript'>alert('请选择所属分类！');history.back(-1);</script>")
                response.End
            End If
            rs("Source") = Trim(Request.Form("Source"))
            If Request.Form("NoticeFlag") = 1 Then
                rs("NoticeFlag") = Request.Form("NoticeFlag")
            Else
                rs("NoticeFlag") = 0
            End If
			rs("SmallPic") = Trim(Request.Form("SmallPic"))
            rs("Content") = RTrim(Request.Form("Content"))
            rs("SeoKeywords") = Trim(Request.Form("SeoKeywords"))
            rs("SeoDescription") = Trim(Request.Form("SeoDescription"))
            rs.update
            rs.Close
            Set rs = Nothing
        End If
        response.Write "<script language='javascript'>alert('设置成功！');location.replace('NewsList.Asp');</script>"
    Else
        If Result = "Modify" Then
            Set rs = server.CreateObject("adodb.recordset")
            sql = "select * from Qianbo_News where ID="& ID
            rs.Open sql, conn, 1, 1
            If rs.bof And rs.EOF Then
                response.Write ("<center>数据库记录读取错误！</center>")
                response.End
            End If
            NewsName = rs("NewsName")
            ViewFlag = rs("ViewFlag")
            SortName = SortText(rs("SortID"))
            SortID = rs("SortID")
            SortPath = rs("SortPath")
            Source = rs("Source")
            NoticeFlag = rs("NoticeFlag")
			SmallPic = rs("SmallPic")
            Content = rs("Content")
            SeoKeywords = rs("SeoKeywords")
            SeoDescription = rs("SeoDescription")
            rs.Close
            Set rs = Nothing
        End If
    End If
End Sub

Function SortText(ID)
    Dim rs, sql
    Set rs = server.CreateObject("adodb.recordset")
    sql = "Select * From Qianbo_NewsSort where ID="&ID
    rs.Open sql, conn, 1, 1
    SortText = rs("SortName")
    rs.Close
    Set rs = Nothing
End Function
%>