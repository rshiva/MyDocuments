<!--#include file="../Include/Const.Asp" -->
<!--#include file="../Include/ConnSiteData.Asp" -->
<!--#include file="CheckAdmin.Asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="Images/Admin_style.css">
<script language="javascript" src="../Scripts/Admin.js"></script>
<%
If InStr(session("AdminPurview"), "|23,") = 0 Then
    response.Write ("<br /><br /><div align=""center""><font style=""color:red; font-size:9pt; "")>您没有管理该模块的权限！</font></div>")
    response.End
End If
Dim Result
Result = request.QueryString("Result")
Dim ReplyContent, ReplyTime, ID, MesName, Content, ViewFlag, SecretFlag
Dim mLinkman, mCompany, mAddress, mZipCode, mTelephone, mFax, mMobile, mEmail, AddTime
ID = request.QueryString("ID")
Call MesEdit()
%>
<br />
<table class="tableBorder" width="95%" border="0" align="center" cellpadding="5" cellspacing="1">
  <form name="editForm" method="post" action="MessageEdit.Asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>">
    <tr>
      <th height="22" colspan="2" sytle="line-height:150%">【审核、回复留言】</th>
    </tr>
    <tr>
      <td width="20%" align="right" class="forumRow">留言标题：</td>
      <td width="80%" class="forumRowHighlight"><input name="MesName" type="text" id="MesName" style="width: 280" value="<%=MesName%>" maxlength="250"> <font color="red">*</font></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">留言内容：</td>
      <td class="forumRowHighlight"><textarea name="Content" rows="8" id="Content" style="width: 500"><%=Content%></textarea> <font color="red">*</font></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">留言人：</td>
      <td class="forumRowHighlight"><%=mLinkman%></td>
    </tr>
	<tr>
      <td align="right" class="forumRow">单位名称：</td>
      <td class="forumRowHighlight"><input name="Company" type="text" style="width: 250" value="<%=mCompany%>" maxlength="250" readonly></td>
    </tr>
	<tr>
      <td align="right" class="forumRow">通信地址：</td>
      <td class="forumRowHighlight"><input name="Address" type="text" style="width: 250" value="<%=mAddress%>" maxlength="250" readonly></td>
    </tr>
	
	<tr>
      <td align="right" class="forumRow">联系电话：</td>
      <td class="forumRowHighlight"><input name="Telephone" type="text" style="width: 180" value="<%=mTelephone%>" maxlength="180" readonly></td>
    </tr>
	<tr>
      <td align="right" class="forumRow">传真号码：</td>
      <td class="forumRowHighlight"><input name="Fax" type="text" style="width: 180" value="<%=mFax%>" maxlength="180" readonly></td>
    </tr>
	<tr>
      <td align="right" class="forumRow">手机号码：</td>
      <td class="forumRowHighlight"><input name="Mobile" type="text" style="width: 180" value="<%=mMobile%>" maxlength="180" readonly></td>
    </tr>
	<tr>
      <td align="right" class="forumRow">电子信箱：</td>
      <td class="forumRowHighlight"><input name="Email" type="text" style="width: 180" value="<%=mEmail%>" maxlength="180" readonly></td>
    </tr>
	<tr>
      <td align="right" class="forumRow">当前状态：</td>
      <td class="forumRowHighlight"><input name="SecretFlag" type="checkbox" id="SecretFlag" value="1" <%if SecretFlag then response.write ("checked")%>> 悄悄话 <input name="ViewFlag" type="checkbox" id="ViewFlag" value="1" <%if ViewFlag then response.write ("checked")%>>通过审核</td>
    </tr>
	<tr>
      <td align="right" class="forumRow">留言时间：</td>
      <td class="forumRowHighlight"><input name="AddTime" type="text" style="width: 180" value="<%=AddTime%>" maxlength="180" readonly></td>
    </tr>
	<tr>
      <td align="right" class="forumRow">回复时间：</td>
      <td class="forumRowHighlight"><input name="ReplyTime" type="text" style="width: 180" value="<%=ReplyTime%>" maxlength="180" readonly></td>
    </tr>
	<tr>
      <td align="right" class="forumRow">回复内容：</td>
      <td class="forumRowHighlight"><textarea name="ReplyContent" rows="8" id="ReplyContent" style="width: 500"><%=ReplyContent%></textarea></td>
    </tr>
    <tr>
      <td align="right" class="forumRow"></td>
      <td class="forumRowHighlight"><input name="submitSaveEdit" type="submit" id="submitSaveEdit" value="保存"> <input type="button" value="返回上一页" onclick="history.back(-1)"></td>
    </tr>
  </form>
</table>
<%
Sub MesEdit()
    Dim Action, rsCheckAdd, rs, sql
    Action = request.QueryString("Action")
    If Action = "SaveEdit" Then
        Set rs = server.CreateObject("adodb.recordset")
        If Len(Trim(request.Form("MesName")))<1 Then
            response.Write ("<script language='javascript'>alert('请填写留言标题！');history.back(-1);</script>")
            response.End
        End If
        If Len(Trim(request.Form("Content")))<1 Then
            response.Write ("<script language='javascript'>alert('请填写留言内容！');history.back(-1);</script>")
            response.End
        End If
        If Result = "Modify" Then
            sql = "select * from Qianbo_Message where ID="&ID
            rs.Open sql, conn, 1, 3
            rs("MesName") = Trim(Request.Form("MesName"))
            rs("Content") = StrReplace(Request.Form("Content"))
            If Request.Form("ViewFlag") = 1 Then
                rs("ViewFlag") = Request.Form("ViewFlag")
            Else
                rs("ViewFlag") = 0
            End If
            If Request.Form("SecretFlag") = 1 Then
                rs("SecretFlag") = Request.Form("SecretFlag")
            Else
                rs("SecretFlag") = 0
            End If
            rs("ReplyContent") = StrReplace(Request.Form("ReplyContent"))
            If Not (Trim(request.Form("ReplyContent")) = "" Or Trim(request.Form("ReplyTime"))<>"") Then
                rs("ReplyTime") = Now()
            End If
        End If
        rs.update
        rs.Close
        Set rs = Nothing
        response.Write "<script language='javascript'>alert('审核、回复成功！');location.replace('MessageList.Asp');</script>"
    Else
        If Result = "Modify" Then
            Set rs = server.CreateObject("adodb.recordset")
            sql = "select * from Qianbo_Message where ID="& ID
            rs.Open sql, conn, 1, 1
            MesName = rs("MesName")
            Content = ReStrReplace(rs("Content"))
            mLinkman = rs("Linkman")
            mCompany = rs("Company")
            mAddress = rs("Address")
            mZipCode = rs("ZipCode")
            mTelephone = rs("Telephone")
            mFax = rs("Fax")
            mMobile = rs("Mobile")
            mEmail = rs("Email")
            ViewFlag = rs("ViewFlag")
            SecretFlag = rs("SecretFlag")
            AddTime = rs("AddTime")
            ReplyContent = ReStrReplace(rs("ReplyContent"))
            ReplyTime = rs("ReplyTime")
            rs.Close
            Set rs = Nothing
        End If
    End If
End Sub
%>