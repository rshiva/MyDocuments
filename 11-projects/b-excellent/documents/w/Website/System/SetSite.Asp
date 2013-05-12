<!--#include file="../Include/Const.Asp" -->
<!--#include file="../Include/ConnSiteData.Asp" -->
<!--#include file="CheckAdmin.Asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="Images/Admin_style.css">
<script language="javascript">
<!--
function setpic(){
    var arr = showModalDialog("eWebEditor/customDialog/img.htm", "", "dialogWidth:30em; dialogHeight:26em; status:0;help=no");
    if (arr ==null){
        alert("系统提示：当前没有上传图片，界面预览图为空，用户可以重新上传图片！");
    }
    if (arr !=null){
        editForm.SiteLogo.value=arr;
    }
}
//-->
</script>
<%
If InStr(session("AdminPurview"), "|1,") = 0 Then
    response.Write ("<br /><br /><div align=""center""><font style=""color:red; font-size:9pt; "")>您没有管理该模块的权限！</font></div>")
    response.End
End If
Select Case request.QueryString("Action")
    Case "Save"
        SaveSiteInfo
    Case "SaveConst"
        SaveConstInfo
    Case Else
        ViewSiteInfo
End Select
%>
<br />
<table class="tableBorder" width="95%" border="0" align="center" cellpadding="5" cellspacing="1">
  <form name="editForm" method="post" action="?Action=Save">
    <tr>
      <th height="22" colspan="2" sytle="line-height:150%">【系统主参数设置】</th>
    </tr>
    <tr>
      <td width="20%" align="right" class="forumRow">网站标题：</td>
      <td width="80%" class="forumRowHighlight"><input name="SiteTitle" type="text" id="SiteTitle" style="width: 280" value="<%=SiteTitle%>">
        <font color="red">*</font></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">公司网址：</td>
      <td class="forumRowHighlight"><input name="SiteUrl" type="text" id="SiteUrl" style="width: 280" value="<%=SiteUrl%>">
        <font color="red">*</font></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">公司名称：</td>
      <td class="forumRowHighlight"><input name="ComName" type="text" id="ComName" style="width: 280" value="<%=ComName%>">
        <font color="red">*</font></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">详细地址：</td>
      <td class="forumRowHighlight"><input name="Address" type="text" id="Address" style="width: 280" value="<%=Address%>">
        <font color="red">*</font></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">邮政编码：</td>
      <td class="forumRowHighlight"><input name="ZipCode" type="text" id="ZipCode" style="width: 180" value="<%=ZipCode%>" maxlength="6">
        <font color="red">*</font></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">联系电话：</td>
      <td class="forumRowHighlight"><input name="Telephone" type="text" id="Telephone" style="width: 180" value="<%=Telephone%>">
        <font color="red">*</font></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">传真号码：</td>
      <td class="forumRowHighlight"><input name="Fax" type="text" id="Fax" style="width: 180" value="<%=Fax%>">
        <font color="red">*</font></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">电子邮箱：</td>
      <td class="forumRowHighlight"><input name="Email" type="text" id="Email" style="width: 180" value="<%=Email%>">
        <font color="red">*</font></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">Keywords优化：</td>
      <td class="forumRowHighlight"><textarea name="Keywords" rows="4"  id="Keywords" style="width: 500"><%=Keywords%></textarea></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">Description优化：</td>
      <td class="forumRowHighlight"><textarea name="Descriptions" rows="4" id="Descriptions" style="width: 500"><%=Descriptions%></textarea></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">ICP备案号：</td>
      <td class="forumRowHighlight"><input name="IcpNumber" type="text" id="IcpNumber" style="width: 180" value="<%=IcpNumber%>"></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">访客留言设置：</td>
      <td class="forumRowHighlight"><input name="MesViewFlag" type="checkbox" id="MesViewFlag" value="1" <%if MesViewFlag then response.write ("checked")%>>
        无须审核</td>
    </tr>
	<tr>
      <td align="right" class="forumRow">首页Logo设置：</td>
      <td class="forumRowHighlight"><input name="SiteLogo" type="text" id="SiteLogo" style="width: 500" value="<%=SiteLogo%>"> <input type="button" value="上传图片" onClick="setpic();"></td>
    </tr>
	
    <tr>
      <td align="right" class="forumRow"></td>
      <td class="forumRowHighlight"><input name="submitSaveEdit" type="submit" id="submitSaveEdit" value="保存主参数设置"></td>
    </tr>
  </form>
</table>
<br />
<%
Call SiteInfo

Function SaveSiteInfo()
    If Len(Trim(request.Form("SiteTitle")))<4 Then
        response.Write "<script language='JavaScript'>alert('请详细填写您的网站标题并保持至少在两个汉字以上！');" & "history.back()" & "</script>"
        response.End
    End If
    If Len(Trim(request.Form("SiteUrl")))<9 Then
        response.Write "<script language='JavaScript'>alert('请详细填写您的公司网址！');" & "history.back()" & "</script>"
        response.End
    End If
    If Len(Trim(request.Form("ComName")))<4 Then
        response.Write "<script language='JavaScript'>alert('请详细填写您的公司名称并保持至少在两个汉字以上！');" & "history.back()" & "</script>"
        response.End
    End If
    If Len(Trim(request.Form("Address")))<4 Then
        response.Write "<script language='JavaScript'>alert('请详细填写您的公司地址并保持至少在两个汉字以上！');" & "history.back()" & "</script>"
        response.End
    End If
    If Len(Trim(request.Form("ZipCode")))<6 Then
        response.Write "<script language='JavaScript'>alert('请详细填写邮政编码并保持至少在6个字符以上！');" & "history.back()" & "</script>"
        response.End
    End If
    If Len(Trim(request.Form("Telephone")))<11 Then
        response.Write "<script language='JavaScript'>alert('请详细填写联系电话并保持至少在11个字符以上！');" & "history.back()" & "</script>"
        response.End
    End If
    If Len(Trim(request.Form("Fax")))<11 Then
        response.Write "<script language='JavaScript'>alert('请详细填写传真号码并保持至少在11个字符以上！');" & "history.back()" & "</script>"
        response.End
    End If
    If Len(Trim(request.Form("Email")))<6 Then
        response.Write "<script language='JavaScript'>alert('请详细填写电子邮箱地址并保持至少在6个字符以上！');" & "history.back()" & "</script>"
        response.End
    End If
    If Len(Trim(request.Form("Keywords")))>250 Then
        response.Write "<script language='JavaScript'>alert('请详细填写网站关键词并保持在250个字符以内！');" & "history.back()" & "</script>"
        response.End
    End If
    If Len(Trim(request.Form("Descriptions")))>250 Then
        response.Write "<script language='JavaScript'>alert('请详细填写网站描述并保持在250个字符以内！');" & "history.back()" & "</script>"
        response.End
    End If
    Dim rs, sql
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select top 1 * from Qianbo_Site"
    rs.Open sql, conn, 1, 3
    rs("SiteTitle") = Trim(Request.Form("SiteTitle"))
    rs("SiteUrl") = Trim(Request.Form("SiteUrl"))
    rs("ComName") = Trim(Request.Form("ComName"))
    rs("Address") = Trim(Request.Form("Address"))
    rs("ZipCode") = Trim(Request.Form("ZipCode"))
    rs("Telephone") = Trim(Request.Form("Telephone"))
    rs("Fax") = Trim(Request.Form("Fax"))
    rs("Email") = Trim(Request.Form("Email"))
    rs("Keywords") = Trim(Request.Form("Keywords"))
    rs("Descriptions") = Trim(Request.Form("Descriptions"))
    rs("IcpNumber") = Trim(Request.Form("IcpNumber"))
    rs("SiteLogo") = Trim(Request.Form("SiteLogo"))
    rs("SiteDetail") = Trim(Request.Form("SiteDetail"))
    If Request.Form("MesViewFlag") = 1 Then
        rs("MesViewFlag") = Request.Form("MesViewFlag")
        Conn.Execute "alter table Qianbo_Message alter column ViewFlag bit default 1"
    Else
        rs("MesViewFlag") = 0
        Conn.Execute "alter table Qianbo_Message alter column ViewFlag bit default 0"
    End If
    rs.update
    rs.Close
    Set rs = Nothing
    response.Write "<script language='javascript'>alert('系统主参数设置成功！');location.replace('SetSite.Asp');</script>"
End Function

Function ViewSiteInfo()
    Dim rs, sql
    Set rs = server.CreateObject("adodb.recordset")
    sql = "select top 1 * from Qianbo_Site"
    rs.Open sql, conn, 1, 1
    If rs.bof And rs.EOF Then
        response.Write ("<br /><br /><div align=""center""><font style=""color:red; font-size:9pt; "")>数据库记录读取错误！</font></div>")
        response.End
    Else
        SiteTitle = rs("SiteTitle")
        SiteUrl = rs("SiteUrl")
        ComName = rs("ComName")
        Address = rs("Address")
        ZipCode = rs("ZipCode")
        Telephone = rs("Telephone")
        Fax = rs("Fax")
        Email = rs("Email")
        Keywords = rs("Keywords")
        Descriptions = rs("Descriptions")
        IcpNumber = rs("IcpNumber")
        MesViewFlag = rs("MesViewFlag")
        Video = rs("Video")
        SiteLogo = rs("SiteLogo")
        SiteDetail = rs("SiteDetail")
        rs.Close
        Set rs = Nothing
    End If
End Function
%>