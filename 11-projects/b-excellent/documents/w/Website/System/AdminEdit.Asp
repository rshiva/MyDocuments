<!--#include file="../Include/Const.Asp" -->
<!--#include file="../Include/ConnSiteData.Asp" -->
<!--#include file="../Include/Md5.Asp"-->
<!--#include file="CheckAdmin.Asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="Images/Admin_style.css">
<script language="javascript" src="../Scripts/Admin.js"></script>
<%
If InStr(session("AdminPurview"), "|29,") = 0 Then
    response.Write ("<br /><br /><div align=""center""><font style=""color:red; font-size:9pt; "")>您没有管理该模块的权限！</font></div>")
    response.End
End If
Dim Result
Result = request.QueryString("Result")
Dim ID, AdminName, Working, Password, vPassword, UserName, Purview, Explain, AddTime
ID = request.QueryString("ID")
If ID = "" Then ID = 0
Call AdminEdit()
%>
<br />
<table class="tableBorder" width="95%" border="0" align="center" cellpadding="5" cellspacing="1">
  <form name="editForm" method="post" action="AdminEdit.Asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>">
    <tr>
      <th height="22" colspan="2" sytle="line-height:150%">【<%If Result = "Add" then%>添加<%ElseIf Result = "Modify" then%>修改<%End If%>管理员】</th>
    </tr>
    <tr>
      <td width="20%" align="right" class="forumRow">登录名称：</td>
      <td width="80%" class="forumRowHighlight"><input name="AdminName" type="text" id="AdminName" style="width: 180" value="<%=AdminName%>" maxlength="16" <%if Result="Modify" then response.write ("readonly")%>>
        <font color="red">*</font>3-10个字符</td>
    </tr>
    <tr>
      <td align="right" class="forumRow">生效：</td>
      <td class="forumRowHighlight"><input name="Working" type="checkbox" value="1" <%if Working then response.write ("checked")%>></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">管理员密码：</td>
      <td class="forumRowHighlight"><input name="Password" type="password" id="Password" maxlength="20" style="width: 180">
        <font color="red">*</font>6-16个字符</td>
    </tr>
    <tr>
      <td align="right" class="forumRow">确认密码：</td>
      <td class="forumRowHighlight"><input name="vPassword" type="password" id="vPassword" maxlength="20" style="width: 180">
        <font color="red">*</font></td>
    </tr>
    <tr>
      <td align="right" class="forumRow">管理员名称：</td>
      <td class="forumRowHighlight"><input name="UserName" type="text" id="UserName" style="width: 120;" value="<%=UserName%>"></td>
    </tr>
    <tr <%if ID=1 then response.write ("style=display:none")%>>
      <td align="right" class="forumRow">操作权限：</td>
      <td class="forumRowHighlight"><input name="Purview1" type="checkbox" value="|1,"<%if Instr(Purview,"|1,")>0 then response.write ("checked")%>>网站参数设置
        <input name="Purview4" type="checkbox" value="|4,"<%if Instr(Purview,"|4,")>0 then response.write ("checked")%>>友情链接添加
        <input name="Purview5" type="checkbox" value="|5,"<%if Instr(Purview,"|5,")>0 then response.write ("checked")%>>友情链接管理
        <input name="Purview6" type="checkbox" value="|6,"<%if Instr(Purview,"|6,")>0 then response.write ("checked")%>>新闻类别管理</td>
    </tr>
    <tr <%if ID=1 then response.write ("style=display:none")%>>
      <td align="right" class="forumRow"></td>
      <td class="forumRowHighlight"><input name="Purview7" type="checkbox" value="|7,"<%if Instr(Purview,"|7,")>0 then response.write ("checked")%>>新闻列表管理
        <input name="Purview8" type="checkbox" value="|8,"<%if Instr(Purview,"|8,")>0 then response.write ("checked")%>>添加新闻
        <input name="Purview9" type="checkbox" value="|9,"<%if Instr(Purview,"|9,")>0 then response.write ("checked")%>>企业信息列表
        <input name="Purview10" type="checkbox" value="|10,"<%if Instr(Purview,"|10,")>0 then response.write ("checked")%>>添加企业信息        </td>
    </tr>
    <tr <%if ID=1 then response.write ("style=display:none")%>>
      <td align="right" class="forumRow"></td>
      <td class="forumRowHighlight"><input name="Purview14" type="checkbox" value="|14,"<%if Instr(Purview,"|14,")>0 then response.write ("checked")%>>
        学习园地类别管理
          <input name="Purview15" type="checkbox" value="|15,"<%if Instr(Purview,"|15,")>0 then response.write ("checked")%>>
          学习园地列表管理
        <input name="Purview16" type="checkbox" value="|16,"<%if Instr(Purview,"|16,")>0 then response.write ("checked")%>>        添加学习园地信息</td>
    </tr>
    <tr <%if ID=1 then response.write ("style=display:none")%>>
      <td align="right" class="forumRow"></td>
      <td class="forumRowHighlight"><input name="Purview19" type="checkbox" value="|19,"<%if Instr(Purview,"|19,")>0 then response.write ("checked")%>>信息类别管理
        <input name="Purview20" type="checkbox" value="|20,"<%if Instr(Purview,"|20,")>0 then response.write ("checked")%>>信息列表管理
        <input name="Purview21" type="checkbox" value="|21,"<%if Instr(Purview,"|21,")>0 then response.write ("checked")%>>添加信息
        <input name="Purview22" type="checkbox" value="|22,"<%if Instr(Purview,"|22,")>0 then response.write ("checked")%>>留言信息查看
        <input name="Purview23" type="checkbox" value="|23,"<%if Instr(Purview,"|23,")>0 then response.write ("checked")%>>留言信息管理        </td>
    </tr>
    <tr <%if ID=1 then response.write ("style=display:none")%>>
      <td align="right" class="forumRow"></td>
      <td class="forumRowHighlight"><input name="Purview28" type="checkbox" value="|28,"<%if Instr(Purview,"|28,")>0 then response.write ("checked")%>>网站管理员查看
        <input name="Purview29" type="checkbox" value="|29,"<%if Instr(Purview,"|29,")>0 then response.write ("checked")%>>网站管理员管理        </td>
    </tr>
    <tr <%if ID=1 then response.write ("style=display:none")%>>
      <td align="right" class="forumRow"></td>
      <td class="forumRowHighlight"><input name="Purview33" type="checkbox" value="|33,"<%if Instr(Purview,"|33,")>0 then response.write ("checked")%>>后台登录日志管理
        
      <input name="Purview38" type="checkbox" value="|38,"<%if Instr(Purview,"|38,")>0 then response.write ("checked")%>>数据表管理</td>
    </tr>
    <tr <%if ID<>1 then response.write ("style=display:none")%>>
      <td align="right" class="forumRow">操作权限：</td>
      <td class="forumRowHighlight">内置超级管理员帐号</td>
    </tr>
    <tr>
      <td align="right" class="forumRow">备注：</td>
      <td class="forumRowHighlight"><textarea name="Explain" rows="8" id="Explain" style="width: 500" ><%=Explain%></textarea></td>
    </tr>
    <tr>
      <td align="right" class="forumRow"></td>
      <td class="forumRowHighlight"><input name="submitSaveEdit" type="submit" id="submitSaveEdit" value="保存">
        <input type="button" value="返回上一页" onclick="history.back(-1)"></td>
    </tr>
  </form>
</table>
<%
Sub AdminEdit()
    Dim Action, rsCheckAdd, rs, sql
    Action = request.QueryString("Action")
    If Action = "SaveEdit" Then
        Set rs = server.CreateObject("adodb.recordset")
        If Result = "Add" Then
            Set rsCheckAdd = conn.Execute("select AdminName from Qianbo_Admin where AdminName='" & Trim(Request.Form("AdminName")) & "'")
            If Not (rsCheckAdd.bof And rsCheckAdd.EOF) Then
                response.Write "<script language='javascript'>alert('" & Trim(Request.Form("AdminName")) & "管理员名称已存在！');history.back(-1);</script>"
                response.End
            End If
            sql = "select * from Qianbo_Admin"
            rs.Open sql, conn, 1, 3
            rs.addnew
            If Len(Trim(Request.Form("AdminName")))<3 Or Len(Trim(Request.Form("AdminName")))>10 Then
                response.Write "<script language='javascript'>alert('请填写管理员名称(字符数在3-10位之间)！');history.back(-1);</script>"
                response.End
            End If
            If Len(Trim(Request.Form("Password")))<6 Or Len(Trim(Request.Form("Password")))>16 Then
                response.Write "<script language='javascript'>alert('请填写管理员密码(字符数在6-16位之间)！');history.back(-1);</script>"
                response.End
            End If
            If Request.Form("Password")<>Request.Form("vPassword") Then
                response.Write "<script language='javascript'>alert('两次输入的密码不同！');history.back(-1);</script>"
                response.End
            End If
            rs("AdminName") = Trim(Request.Form("AdminName"))
            If Request.Form("Working") = 1 Then
                rs("Working") = Request.Form("Working")
            Else
                rs("Working") = 0
            End If
            rs("Password") = Md5(Request.Form("Password"))
            rs("UserName") = Trim(Request.Form("UserName"))
            rs("AdminPurview") = Request.Form("Purview1") & Request.Form("Purview2") &_
            Request.Form("Purview3") & Request.Form("Purview4") & Request.Form("Purview5") &_
            Request.Form("Purview6") & Request.Form("Purview7") & Request.Form("Purview8") &_
            Request.Form("Purview9") & Request.Form("Purview10") & Request.Form("Purview11") &_
            Request.Form("Purview12") & Request.Form("Purview13") &_
            Request.Form("Purview14") & Request.Form("Purview15") & Request.Form("Purview16") &_
            Request.Form("Purview17") & Request.Form("Purview18") &_
            Request.Form("Purview19") & Request.Form("Purview20") & Request.Form("Purview21") &_
            Request.Form("Purview22") & Request.Form("Purview23") & Request.Form("Purview24") &_
            Request.Form("Purview25") &_
            Request.Form("Purview26") & Request.Form("Purview27") & Request.Form("Purview28") &_
            Request.Form("Purview29") & Request.Form("Purview30") & Request.Form("Purview31") &_
            Request.Form("Purview32") & Request.Form("Purview33") & Request.Form("Purview34") &_
            Request.Form("Purview35") & Request.Form("Purview36") & Request.Form("Purview37") &_
            Request.Form("Purview38") & Request.Form("Purview39") & Request.Form("Purview40")
            rs("Explain") = Trim(Request.Form("Explain"))
            rs("AddTime") = Now()
        End If
        If Result = "Modify" Then
            sql = "select * from Qianbo_Admin where ID="&ID
            rs.Open sql, conn, 1, 3
            rs("AdminName") = Trim(Request.Form("AdminName"))
            If Request.Form("Working") = 1 Then
                rs("Working") = Request.Form("Working")
            Else
                rs("Working") = 0
            End If
            If Trim(Request.Form("Password"))<>"" Then
                If Len(Trim(Request.Form("Password")))<6 Or Len(Trim(Request.Form("Password")))>16 Then
                    response.Write "<script language='javascript'>alert('请填写管理员密码(字符数在6-16位之间)！');history.back(-1);</script>"
                    response.End
                End If
                If Request.Form("Password")<>Request.Form("vPassword") Then
                    response.Write "<script language='javascript'>alert('两次输入的密码不同！');history.back(-1);</script>"
                    response.End
                End If
                rs("Password") = Md5(Request.Form("Password"))
            End If
            rs("UserName") = Trim(Request.Form("UserName"))
            rs("AdminPurview") = Request.Form("Purview1") & Request.Form("Purview2") &_
            Request.Form("Purview3") & Request.Form("Purview4") & Request.Form("Purview5") &_
            Request.Form("Purview6") & Request.Form("Purview7") & Request.Form("Purview8") &_
            Request.Form("Purview9") & Request.Form("Purview10") & Request.Form("Purview11") &_
            Request.Form("Purview12") & Request.Form("Purview13") &_
            Request.Form("Purview14") & Request.Form("Purview15") & Request.Form("Purview16") &_
            Request.Form("Purview17") & Request.Form("Purview18") &_
            Request.Form("Purview19") & Request.Form("Purview20") & Request.Form("Purview21") &_
            Request.Form("Purview22") & Request.Form("Purview23") & Request.Form("Purview24") &_
            Request.Form("Purview25") &_
            Request.Form("Purview26") & Request.Form("Purview27") & Request.Form("Purview28") &_
            Request.Form("Purview29") & Request.Form("Purview30") & Request.Form("Purview31") &_
            Request.Form("Purview32") & Request.Form("Purview33") & Request.Form("Purview34") &_
            Request.Form("Purview35") & Request.Form("Purview36") & Request.Form("Purview37") &_
            Request.Form("Purview38") & Request.Form("Purview39") & Request.Form("Purview40")
            rs("Explain") = Trim(Request.Form("Explain"))
        End If
        rs.update
        rs.Close
        Set rs = Nothing
        response.Write "<script language='javascript'>alert('设置成功！');location.replace('AdminList.Asp');</script>"
    Else
        If Result = "Modify" Then
            Set rs = server.CreateObject("adodb.recordset")
            sql = "select * from Qianbo_Admin where ID="& ID
            rs.Open sql, conn, 1, 1
            AdminName = rs("AdminName")
            Working = rs("Working")
            UserName = rs("UserName")
            Purview = rs("AdminPurview")
            Explain = rs("Explain")
            rs.Close
            Set rs = Nothing
        End If
    End If
End Sub
%>